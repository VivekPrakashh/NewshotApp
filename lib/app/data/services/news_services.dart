import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/util_functions.dart';
import 'package:news_shots_app/app/data/core/failures.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';
import 'package:news_shots_app/app/data/models/news/category_with_sub_category.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:news_shots_app/app/data/models/news/topic.dart';
import 'package:news_shots_app/app/data/models/notification_logs/notification_log.dart';
import 'package:news_shots_app/app/data/models/quiz/quiz.dart';
import 'package:news_shots_app/app/data/models/quiz/quiz_response.dart';
import 'package:news_shots_app/app/data/models/remote_user/remote_user.dart';
import 'package:news_shots_app/app/data/models/threads/thread.dart';
import 'package:news_shots_app/app/data/services/auth_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../modules/news_stories/ui_states/news_or_thread.dart';

class NewsServices extends GetxService {
  final Logger _logger;
  // final FirebaseAnalytics _analytics;

  final endpoint = "https://newsserver.tensionfreeparking.com";
  late Dio client;

  Completer<void>? _completer;
  Completer<void>? _handlingTokenExpireCompleter;
  late CacheStore cacheStore;
  late CacheOptions cacheOptions;
  LocalSessionData? localSessionData;
  // bool  = false;

  NewsServices(
    this._logger,
    // this._analytics,
  );

  @override
  onInit() async {
    _completer = Completer();
    if (!Get.isRegistered<AuthServices>()) {
      Get.put(AuthServices(Get.find(), FirebaseAnalytics.instance, _logger));
    }
    await Get.find<AuthServices>().checkAuth().then((value) {
      value.fold((l) {
        throw Exception("Auth Failed in News Services");
      }, (r) {
        _logger.i("token: ${r.token}");
        localSessionData = r;
        client = Dio(BaseOptions(
          baseUrl: endpoint,
          headers: {
            'key': r.token,
          },
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60),
        ));
      });
    });
    await initRequestCache();

    cacheOptions = CacheOptions(
      store: cacheStore,
      allowPostMethod: true,
      maxStale: 5.minutes,
      keyBuilder: customCacheKeyBuilder,
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: List.empty(),
    );

    client.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    _completer!.complete();

    super.onInit();
  }

  String customCacheKeyBuilder(RequestOptions request) {
    if (request.method == 'POST') {
      // Generate a unique cache key based on the request URL and body
      return '${request.uri.toString()}|${request.data.toString()}';
    } else {
      // Use the default cache key builder for non-POST requests
      return CacheOptions.defaultCacheKeyBuilder(request);
    }
  }

  Future<void> initRequestCache() async {
    final dir = await getTemporaryDirectory();
    cacheStore = DbCacheStore(
      databasePath: dir.path,
    );
  }

  Future<Either<InfraFailure, List<News>>> fetchNews({
    int limit = 20,
    Category? category,
    bool cacheRequest = true,
    Topic? topic,
    List<String> existingIds = const [],
  }) async {
    try {
      await _completer?.future;
      log("fetching news with category: ${category?.getCategoryName} limit: $limit");

      final postData = {
        'limit': limit,
        'language': Get.locale?.getLanguageString().toLowerCase(),
        'category': category?.id,
        'topic': topic?.id,
        'ExistingNewsListOnCurrentDevice': existingIds
      };

      postData.removeWhere((key, value) => value == null);
      _logger.i("fetchNews start $postData");

      final res = await client.post('/api/user/fetch/news',
          data: postData,
          options:
              cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions()
          // options: cacheRequest
          //     ? cacheOptions.toOptions()
          //     : cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
          );

      log("fetchNews complete ${res.data['news'].length}");

      final news = (res.data['news'] as List)
          .where((json) {
            try {
              News.fromJson(json);
              return true;
            } catch (e, s) {
              _logger.e("Error parsing news:$json", error: e, stackTrace: s);
              return false;
            }
          })
          .map((json) => News.fromJson(json))
          .toList();

      _logger.i(news.length);
      return right(news);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: e.stackTrace);

      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return fetchNews(
            cacheRequest: cacheRequest,
            category: category,
            limit: limit,
            topic: topic,
          );
        } else {
          await _handlingTokenExpireCompleter?.future;
          return fetchNews(
            cacheRequest: cacheRequest,
            category: category,
            limit: limit,
            topic: topic,
          );
        }
      }

      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("Unexpected Error in fetchNews", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<void> handleTokenExpire() async {
    _handlingTokenExpireCompleter = Completer();
    debugPrint("handle token expire");
    if (localSessionData != null) {
      await Get.find<AuthServices>()
          .registerUser(
        language: Locale(localSessionData?.languageCode ?? "en"),
        theme: localSessionData?.theme ?? ThemeMode.system,
      )
          .then((value) async {
        await Get.find<AuthServices>().checkAuth().then((value) {
          value.fold((l) {
            throw Exception("Auth Failed in News Services");
          }, (r) {
            _logger.i("token: ${r.token}");
            localSessionData = r;
            client = Dio(BaseOptions(
              baseUrl: endpoint,
              headers: {
                'key': r.token,
              },
              connectTimeout: const Duration(seconds: 60), // 60 seconds
              receiveTimeout: const Duration(seconds: 60),
            ));
          });
        });
      });
    }
    _handlingTokenExpireCompleter?.complete();
  }

  // Future<Either<InfraFailure, List<News>>> fetchBreakingNews() async {
  //   try {
  //     await _completer?.future;
  //     final res = await client.post(
  //       '/api/user/fetch/breaking',
  //       data: {
  //         'language': Get.locale?.getLanguageString().toLowerCase(),
  //       },
  //     );
  //     _logger.i(
  //         "......................statuscode...${res.statusCode}...............");

  //     final news = (res.data['breakingNews'] as List)
  //         .map((e) => News.fromJson(e))
  //         .toList();
  //     _logger.i(news.length);
  //     return right(news);
  //   } on DioException catch (e) {
  //     _logger.e(
  //         "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
  //         e.error,
  //         e.stackTrace);

  //     return left(const InfraFailure.serverError());
  //   } catch (e, s) {
  //     _logger.e("error fetchBreakingNews", error: e, stackTrace: s);

  //     return left(const InfraFailure.unexpected());
  //   }
  // }

  Future<Either<InfraFailure, List<Category>>> fetchCategories() async {
    try {
      await _completer?.future;
      final res = await client.get('/api/category/all/user');

      _logger.i(
          "...................fetchCategories...statuscode...${res.statusCode}...............");

      if ([200, 304].contains(res.statusCode) &&
          (res.data['success'] as bool)) {
        final categories = (res.data['foundCategories'] as List)
            .where((json) {
              try {
                Category.fromJson(json);
                return true;
              } catch (e, s) {
                _logger.e("Error parsing Category:$json",
                    error: e, stackTrace: s);
                return false;
              }
            })
            .map((e) => Category.fromJson(e))
            .toList();

        return right(categories);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: e.stackTrace);

      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return fetchCategories();
        } else {
          await _handlingTokenExpireCompleter?.future;
          return fetchCategories();
        }
      }
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error fetchCategories", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, List<Topic>>> fetchTopics() async {
    try {
      await _completer?.future;
      final res = await client.post(
        '/api/topic/all',
        data: {
          "language": Get.locale?.getLanguageString().toLowerCase(),
        },
      );

      _logger.i(
          "...................fetchTopics...statuscode...${res.statusCode}...............");

      if ([200, 304].contains(res.statusCode) &&
          (res.data['success'] as bool)) {
        final topics = (res.data['foundTopics'] as List)
            .where((json) {
              try {
                Topic.fromJson(json);
                return true;
              } catch (e, s) {
                _logger.e("Error parsing topic:$json", error: e, stackTrace: s);
                return false;
              }
            })
            .map((e) => Topic.fromJson(e))
            .toList();

        return right(topics);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e, s) {
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);

      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error fetchTopics", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, List<News>>> fetchNewsByCategory({
    required Category category,
    int limit = 5,
    bool cacheRequest = true,
    List<String> existingIds = const [],
  }) async {
    return await fetchNews(
        limit: limit,
        category: category,
        cacheRequest: cacheRequest,
        existingIds: existingIds);
  }

  Future<Either<InfraFailure, List<News>>> fetchNewsByTopic(
      {required Topic topic, int limit = 5}) async {
    return await fetchNews(limit: limit, topic: topic);
  }

  Future<Either<InfraFailure, List<News>>> getNewsByIds(
      {required List<String> ids}) async {
    try {
      await _completer?.future;

      _logger.i("Get NewsByIds $ids");

      final res = await client.post(
        '/api/user/fetch/id',
        data: {
          'news': ids,
        },
        options: cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
      );
      // print(
      //     "......................statuscode.getNewsByIds...${res.statusCode}...............");

      final news =
          (res.data['data'] as List).map((e) => News.fromJson(e)).toList();
      // print(news.length);
      return right(news);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e,
          stackTrace: s);

      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return getNewsByIds(
            ids: ids,
          );
        } else {
          await _handlingTokenExpireCompleter?.future;
          return getNewsByIds(
            ids: ids,
          );
        }
      }

      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error getNewsByIds", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, List<Thread>>> getThreadByIds(
      {required List<String> ids}) async {
    try {
      _logger.i(ids);
      final res = await client.post(
        '/api/user/fetch/thread/id',
        data: {
          'threads': ids,
        },
      );
      // print(
      //     "......................statuscode.getThreadsByIds...${res.statusCode}...............");

      final thread =
          (res.data['data'] as List).map((e) => Thread.fromJson(e)).toList();
      // print(thread.length);
      return right(thread);
    } on DioException catch (e, s) {
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);

      if (e.type == DioExceptionType.connectionError) {
        return left(const InfraFailure.noInternet());
      }
      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return getThreadByIds(ids: ids);
        } else {
          await _handlingTokenExpireCompleter?.future;
          return getThreadByIds(ids: ids);
        }
      }

      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error getThreadByIds", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  sendNewsReadLog({
    required int duration,
    required String newsId,
    required bool pollAnswered,
    required int faqPercentage,
    required int timeSpendInFaq,
    required int timeSpendInSummary,
    required int timeSpendInQuiz,
    required int timeSpendInDetails,
    required int timeSpendInHeadlines,
  }) async {
    try {
      final dio = Dio();
      final res = await dio.post(
        'https://analytics.tensionfreeparking.com/api/records/register',
        data: {
          "user": localSessionData!.userId,
          "records": [
            {
              "article": newsId,
              "timeSpent": duration,
              "totalFAQread": faqPercentage,
              "pollAnswered": pollAnswered,
              "timeSpendInFAQ": timeSpendInFaq,
              "timeSpendInSummary": timeSpendInSummary,
              "timeSpendInQuiz": timeSpendInQuiz,
              "timeSpendInDetails": timeSpendInDetails,
              "timeSpendInHeadlines": timeSpendInHeadlines,
            }
          ],
          "fcmToken": localSessionData!.fcmToken,
        },
      );
      _logger.i(
        "Info: path:${res.requestOptions.path}\ndata:${res.requestOptions.data}\nresponse:${res.data}",
      );
      // _logger.i(res);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error sendNewsReadLog", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Unit>> sendThreadReadLog(
      Duration duration, String threadId) async {
    try {
      final dio = Dio();
      final res = await dio.post(
        'https://analytics.tensionfreeparking.com/api/thread/records/register',
        data: {
          "user": localSessionData!.userId,
          "records": [
            {"article": threadId, "timeSpent": duration.inSeconds}
          ]
        },
      );
      _logger.i(res);
      return right(unit);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error sendNewsReadLog", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Poll>> sendPollAnswer(
      Poll poll, String answer) async {
    try {
      final res = await client.post('/api/user/answer/poll/${poll.id}',
          options:
              cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
          data: {
            'answer': answer,
          });
      _logger.i(res);

      if ((res.data['success'] as bool)) {
        final poll = Poll.fromJson(res.data['poll']);
        return right(poll);
      }
      _logger.i(res);
      return left(const InfraFailure.unexpected());
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);

      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error sendNewsReadLog", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, List<Thread>>> fetchFacts(
      {int limit = 20, required String? lastThreadId}) async {
    try {
      _logger.i(
          "Fetch facts start lastThreadId:$lastThreadId language:${Get.locale?.getLanguageString().toLowerCase()}");

      final res = await client.post('/api/user/fetch/threads',
          data: {
            "limit": limit,
            "language": Get.locale?.getLanguageString().toLowerCase(),
            "lastThread": lastThreadId,
          },
          options:
              cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions());
      _logger.i("Fetch facts end");

      if ([200, 304].contains(res.statusCode)) {
        // _logger.i(res.data['threads']);

        final threads = (res.data['threads'] as List)
            .where((json) {
              try {
                Thread.fromJson(json);
                return true;
              } catch (e, s) {
                _logger.e("Error parsing thread:$json",
                    error: e, stackTrace: s);
                return false;
              }
            })
            .map((e) => Thread.fromJson(e))
            .toList();

        return right(threads);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error fetchFacts", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Unit>> reportNewsOrThread(
      {required NewsOrThread newsOrThread,
      String? comments,
      required String reportReason}) async {
    try {
      final res = await client.post(
        '/api/report/create',
        options: cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
        data: {
          "article": newsOrThread.whenOrNull(
            news: (news) => news.id,
          ),
          "thread": newsOrThread.whenOrNull(
            thread: (thread) => thread.id,
          ),
          "reportReason": reportReason,
          "comments": comments,
        },
      );
      _logger.i(res);

      return right(unit);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      // if (e.type == DioExceptionType.connectionError) {
      //   return left(const InfraFailure.noInternet());
      // }
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error send report", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Unit>> updateCurrentUser({
    String? version,
    String? token,
    String? language,
    NotificationPreference? notificationPreference,
    PermissionStatus? permissionStatus,
    ThemeMode? theme,
  }) async {
    try {
      await _completer?.future;

      final postData = {
        "platform": Platform.operatingSystem,
      };
      if (version != null) {
        postData['appVersion'] = version;
      }

      if (token != null) {
        postData['fcmToken'] = token;
      }
      if (language != null) {
        postData['language'] = language.toLowerCase();
      }
      if (notificationPreference != null) {
        postData['notificationPreference'] = notificationPreference.name;
      }
      if (theme != null) {
        postData['theme'] = theme.name;
      }
      if (permissionStatus != null) {
        postData['notificationPermissionStatus'] = permissionStatus.name;
      }

      await client
          .post('/api/user/update',
              data: postData,
              options: cacheOptions
                  .copyWith(policy: CachePolicy.noCache)
                  .toOptions())
          .then((value) {
        _logger.i(value.data);

        final serverUser = value.data['user'];
        Get.find<AppLocalDB>().localSessionsDao.syncFromServer(
            appVersion: serverUser['appVersion'],
            fcmToken: serverUser['fcmToken'],
            language: serverUser['language'],
            notificationPreference: serverUser['notificationPreference'],
            notificationPermissionStatus:
                serverUser['notificationPermissionStatus']);
      });

      return right(unit);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      // if (e.type == DioExceptionType.connectionError) {
      //   return left(const InfraFailure.noInternet());
      // }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error in update current user", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Unit>> sendNotificationClickEvent(
      String newsId) async {
    try {
      final res = await client.post(
        '/api/article/update/record',
        options: cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
        data: {
          "article": newsId,
          "user": localSessionData!.userId,
        },
      );
      _logger.i(res);

      return right(unit);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error send notification click event", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, (List<Quiz>, List<QuizResponse>)>> fetchQuiz(
      {required String newsId}) async {
    try {
      final res = await client.post('/api/user/fetch/quiz',
          data: {
            "article": newsId,
          },
          options:
              cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions());
      _logger.i(res);

      final quizzes = List<Map<String, dynamic>>.from(res.data['quizzes'])
          .map((e) => Quiz.fromJson(e))
          .toList();

      final quizResponses = List<Map<String, dynamic>>.from(res.data['records'])
          .map((e) => QuizResponse.fromJson(e))
          .toList();

      // print(quizzes);

      return right((quizzes, quizResponses));
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      // if (e.type == DioExceptionType.connectionError) {
      //   return left(const InfraFailure.noInternet());
      // }
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error fetchQuiz ", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Unit>> sendQuizResponse(
      {required String quizId, required String option}) async {
    try {
      final res = await client.post(
        '/api/user/answer/quiz/$quizId',
        options: cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
        data: {
          "answer": option,
        },
      );
      _logger.i(res);

      return right(unit);
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error send quiz answer", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, List<NotificationLogs>>>
      fetchNotificationHistory() async {
    try {
      final res = await client.get(
        "https://analytics.tensionfreeparking.com/api/user/notification/history",
        options: cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions(),
      );

      if (res.data['success']) {
        final notificationLogs = (res.data['notificationLogs'] as List)
            .where((json) {
              try {
                NotificationLogs.fromJson(json);
                return true;
              } catch (e, s) {
                _logger.e("Error parsing Notification log:$json",
                    error: e, stackTrace: s);
                return false;
              }
            })
            .map((e) => NotificationLogs.fromJson(e))
            .toList();

        return right(notificationLogs);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e, s) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: s);
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error  fetch notification log", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, List<CategoryWithSubCategory>>>
      fetchCategoriesNew() async {
    try {
      await _completer?.future;
      final res = await client.get('/api/category/all/user');

      _logger.i(
          "...................fetchCategories...statuscode...${res.statusCode}...............");

      if ([200, 304].contains(res.statusCode) &&
          (res.data['success'] as bool)) {
        final categories = (res.data['foundCategories'] as List)
            .where((json) {
              try {
                CategoryWithSubCategory.fromJson(json);
                return true;
              } catch (e, s) {
                _logger.e("Error parsing Category:$json",
                    error: e, stackTrace: s);
                return false;
              }
            })
            .map((e) => CategoryWithSubCategory.fromJson(e))
            .toList();

        return right(categories);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: e.stackTrace);

      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return fetchCategoriesNew();
        } else {
          await _handlingTokenExpireCompleter?.future;
          return fetchCategoriesNew();
        }
      }
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error fetchCategories", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, Unit>> subscribeToCategory(
      List<Category> category) async {
    try {
      await _completer?.future;
      final res = await client.post('/api/category/update/user',
          data: {
            "categories": category.map((e) => e.id).toList(),
          },
          options:
              cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions());

      _logger.i(
          "...................subscribeToCategory...${res.statusCode}...............");

      if ([200].contains(res.statusCode) && (res.data['success'] as bool)) {
        _logger.i(res.data);

        return right(unit);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: e.stackTrace);

      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return subscribeToCategory(category);
        } else {
          await _handlingTokenExpireCompleter?.future;
          return subscribeToCategory(category);
        }
      }
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error subscribe Category", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }

  Future<Either<InfraFailure, RemoteUser>> getCurrentUser() async {
    try {
      await _completer?.future;
      final res = await client.post('/api/user/current',
          options:
              cacheOptions.copyWith(policy: CachePolicy.noCache).toOptions());

      _logger.i(
          "...................getCurrentUser...${res.statusCode}...............");

      if ([201].contains(res.statusCode) && (res.data['success'] as bool)) {
        final user = RemoteUser.fromJson(res.data['user']);

        return right(user);
      }
      return left(const InfraFailure.unexpected());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
      }
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
          error: e.error,
          stackTrace: e.stackTrace);

      if (e.response?.statusCode == 400 &&
          e.response?.data['error'] == "USERDOESNOTEXIST") {
        if (_handlingTokenExpireCompleter == null) {
          await handleTokenExpire();
          return getCurrentUser();
        } else {
          await _handlingTokenExpireCompleter?.future;
          return getCurrentUser();
        }
      }
      return left(const InfraFailure.serverError());
    } catch (e, s) {
      _logger.e("error in fetch current user", error: e, stackTrace: s);

      return left(const InfraFailure.unexpected());
    }
  }
}
