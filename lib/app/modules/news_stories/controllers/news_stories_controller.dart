import 'dart:async';
import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:news_shots_app/app/data/models/threads/thread.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

import '../../../core/util_functions.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/services/news_services.dart';
import 'dart:math' as math;

class NewsStoriesController extends GetxController {
  final PageController storiesPageController = PageController();
  final AppLocalDB _db;

  final NewsServices _newsServices;
 
  final newsOrThread = <NewsOrThread>[].obs;
  final currentNewsIndex = 0.obs;
  final showAppBar = false.obs;
  final toggleBookmark = false.obs;
  List<String> readNewsIds = <String>[];
  int _fetchNewsCount = 20;
  int _maxRetry = 5;
  final logger = Get.find<Logger>();
  final isLoading = false.obs;
  int lastIndexView = 0;
  List<Thread> threads = [];
  // int faqReadPercentage = 0;
  final initialNews = Get.arguments as NewsOrThread?;
  StreamSubscription? threadListener;
  final showCaseItems = <GlobalKey>[];
  final loadMoreNewsloading = false.obs;

  bool pollAnswred = false;
  // bool _showCaseAdded = false;

  NewsStoriesController(this._newsServices, this._db);

  @override
  Future<void> onInit() async {
    if (initialNews != null) {
      newsOrThread.value = [initialNews!];
    }

    // await fcmNotificationHandler();
    readNewsIds = await _db.newsLogsDao.getReadNews().then((value) =>
        value.where((element) => element.isNews).map((e) => e.newsId).toList());
    await _db.unreadNewsDao.getNews().then((value) {
      value.removeWhere(
        (element) =>
            readNewsIds.contains(element.id) ||
            newsOrThread
                .map((e) => e.when(news: (news) => news.id, thread: (_) => ""))
                .toList()
                .contains(element.id),
      );

      newsOrThread.addAll((value.map((e) => NewsOrThread.news(news: e))));
    });
    await fetchNews();
    fetchThreads();

    super.onInit();
  }

  Future<void> filterShowCase(
      String actionId, GlobalKey actionGlobalKey) async {
    await _db.showCaseActionsDao.getShowCaseAction(actionId).then((value) {
      if (!value.hasActionTap && !value.hasShownToolTip) {
        showCaseItems.add(actionGlobalKey);
      }
    });
  }

  @override
  onClose() {
    threadListener?.cancel();
    super.onClose();
  }

  handleLangaugeChange() {
    currentNewsIndex.value = 0;
    if (storiesPageController.hasClients) {
      storiesPageController.jumpToPage(0);
    }
    newsOrThread.value = [];
    fetchNews();
  }

  Future<void> fetchNews() async {
    if (isLoading.value) return;
    isLoading.value = true;
    await _newsServices
        .fetchNews(cacheRequest: false, limit: _fetchNewsCount)
        .then((value) async {
      value.fold((l) {
        l.maybeMap(
          orElse: () {
            Get.snackbar("Could Not Fetch The Latest News, Some Issue.", "",
                duration: 6.seconds,
                icon: const Icon(Icons.error),
                backgroundColor: const Color.fromARGB(184, 255, 177, 171),
                snackPosition: SnackPosition.BOTTOM,
                messageText: const SizedBox());
          },
          noInternet: (value) {
            Get.snackbar(
              "Network Error",
              "Your Internet Is Not Working",
              duration: 6.seconds,
              icon: const Icon(Icons.error),
              backgroundColor: const Color.fromARGB(184, 255, 177, 171),
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        );
      }, (r) async {
        if (initialNews != null) {
          r.removeWhere((element) => element.id == initialNews!.id);
        }
        // remove items from result which already read by user from db and item before index
        r.removeWhere(
          (element) =>
              readNewsIds.contains(element.id) ||
              (newsOrThread.length > 3 &&
                  newsOrThread
                      .getRange(
                          0,
                          (currentNewsIndex.value + 1) == newsOrThread.length
                              ? newsOrThread.length
                              : currentNewsIndex.value + 2)
                      .map((e) => e.when(
                          news: (news) => news.id!,
                          thread: (thread) => thread.id))
                      .contains(element.id)),
        );

        logger.i("News Length:${r.length}");

        if (currentNewsIndex.value + 1 < newsOrThread.length - 1) {
          newsOrThread.removeRange(
              currentNewsIndex.value + 2, newsOrThread.length);
        }
        newsOrThread.value = [
          ...newsOrThread,
          ...(r.map((e) => NewsOrThread.news(news: e)))
        ];
        await _db.unreadNewsDao.setNews(news: r);

        /// called if only next five unread news left
        if ((((newsOrThread.length - 1) - currentNewsIndex.value) < 5) ||
            (r.length < 5)) {
          _maxRetry--;
          logger.i("Retry news since result list is less then 5");
          if (_maxRetry < 0) {
            logger.i("Max retry limit reach");

            return;
          }
          _fetchNewsCount = _fetchNewsCount + 20;
          await fetchNews();
          logger.i("Fetched news if only five news left $_fetchNewsCount");
          logger.i(
              "Fetched news if only ${((newsOrThread.length - 1) - currentNewsIndex.value)}");
          return;
        } else {
          _maxRetry = 5;
        }

        logger.i("Fetched news end");
      });
    });
    isLoading.value = false;
  }

  loadMoreNewsClicked() async {
    if (loadMoreNewsloading.value) return;
    loadMoreNewsloading.value = true;
    _fetchNewsCount = _fetchNewsCount + 20;
    await _newsServices
        .fetchNews(
      cacheRequest: false,
      limit: _fetchNewsCount,
    )
        .then((value) async {
      await value.fold((l) {
        l.maybeMap(
          orElse: () {
            Get.snackbar("Could Not Fetch The Latest News, Some Issue.", "",
                duration: 6.seconds,
                icon: const Icon(Icons.error),
                backgroundColor: const Color.fromARGB(184, 255, 177, 171),
                snackPosition: SnackPosition.BOTTOM,
                messageText: const SizedBox());
          },
          noInternet: (value) {
            Get.snackbar(
              "Network Error",
              "Your Internet Is Not Working",
              duration: 6.seconds,
              icon: const Icon(Icons.error),
              backgroundColor: const Color.fromARGB(184, 255, 177, 171),
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        );
      }, (r) async {
        readNewsIds = await _db.newsLogsDao.getReadNews().then((value) => value
            .where((element) => element.isNews)
            .map((e) => e.newsId)
            .toList());
        r.removeWhere((element) => readNewsIds.contains(element.id));

        r.removeWhere((element) => newsOrThread
            .map((e) => e.when(news: (news) => news.id, thread: (_) => ""))
            .toList()
            .contains(element.id));

        newsOrThread.value = [
          ...newsOrThread,
          ...r.map((e) => NewsOrThread.news(news: e))
        ];
      });
    });

    loadMoreNewsloading.value = false;
  }

  insertNewsLogToDb(String newsId, bool isNews) async {
    await _db.newsLogsDao.insertLog(newsId: newsId, isNews: isNews);
    if (!isNews) {
      await _db.unreadThreadDao.removeThreadById(newsId);
    }
  }

  fetchThreadFromNetwork(String? lastThreadId) async {
    print(lastThreadId);

    if (lastThreadId != null) {
      _db.localSessionsDao.setLastFetchedThreadId(lastThreadId);
    }
    if (lastThreadId == null) {
      final lastId = await _db.localSessionsDao.getLastFetchedThreadId();
      if (lastId != null) {
        lastThreadId = lastId;
      }
    }

    _newsServices.fetchFacts(lastThreadId: lastThreadId).then((value) {
      value.fold((l) async {
        await Future.delayed(
          2.seconds,
          () async {
            await fetchThreadFromNetwork(lastThreadId);
          },
        );
      }, (r) async {
        if (r.length == 1 && r.first.id == lastThreadId) {
          return;
        }
        await _db.unreadThreadDao.saveThreads(threads: r);
      });
    });
  }

  fetchThreads() {
    threadListener = _db.unreadThreadDao.getThreads().listen((event) {
      threads = event;
      print(threads.length);
      if (threads.length < 10) {
        fetchThreadFromNetwork(threads.isEmpty ? null : event.last.id);
      }
    });
  }

  onStoryChange(int index) {
    currentNewsIndex.value = index;

    if (newsOrThread.length - 1 > currentNewsIndex.value) {
      final nextNewsOrThread = newsOrThread[index + 1];
      nextNewsOrThread.when(news: (news) {
        if (news.urlToImage != null) {
          preloadImage(news.urlToImage!);
        }
      }, thread: (thread) {
        if (thread.backgroundImgUrl != null) {
          preloadImage(thread.backgroundImgUrl!);
        }
        if (thread.facts.isNotEmpty) {
          preloadImage(thread.facts.first.imgUrl);
        }
      });
    }

    if (lastIndexView < index) {
      lastIndexView = index;

      if (((index + 3) % 4 == 0) && threads.isNotEmpty) {
        newsOrThread.insert(
            index + 2, NewsOrThread.thread(thread: threads.removeAt(0)));
      }
    }

    if ((newsOrThread.length - index) <= 6) {
      _fetchNewsCount = _fetchNewsCount + 20;
      fetchNews();
    }
  }

  preloadImage(String url) {
    DefaultCacheManager().getSingleFile(url);
  }

  updateDuration(String newsId, int duration) async {
    await _db.newsLogsDao.updateDurationWatched(newsId, duration);
  }

  Stream<NewsBookmark?> getBookmarkById({String? id}) {
    if (newsOrThread.isEmpty) {
      return const Stream.empty();
    }

    if (id != null) {
      return _db.newsBookmarksDao.getBookmarkByIdStream(id);
    }

    return _db.newsBookmarksDao.getBookmarkByIdStream(
        newsOrThread[currentNewsIndex.value]
            .when(news: (news) => news.id!, thread: (thread) => thread.id));
  }

  addToBookmark({NewsOrThread? currentNewsOrThread}) async {
    if (currentNewsOrThread == null) {
      if (newsOrThread.isEmpty) return;
      currentNewsOrThread = newsOrThread[currentNewsIndex.value];
    }

    await _db.newsBookmarksDao.addToBookmark(currentNewsOrThread);
    currentNewsOrThread.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "thread_id": thread.id,
            "thread_title": thread.threadTitle
                    ?.substring(0, math.min(thread.threadTitle!.length, 39)) ??
                'no title',
          });
    });
  }

  removeFromBookmark({NewsOrThread? news}) async {
    NewsOrThread currentNews;
    if (news != null) {
      currentNews = news;
    } else {
      if (newsOrThread.isEmpty) return;
      currentNews = newsOrThread[currentNewsIndex.value];
    }

    await _db.newsBookmarksDao.removeFromBookmark(currentNews.id);

    currentNews.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "thread_id": currentNews.id,
          });
    });
  }

  sendThreadDuration(Thread news, Duration duration) {
    _newsServices.sendThreadReadLog(duration, news.id);
  }

  Stream<String?> getPollAnswerByNewsId(String newsId) {
    return _db.newsLogsDao.getPollAnswer(newsId: newsId);
  }

  shareNewsClicked() async {
    UtilsFunction.shareNewsOrThread(newsOrThread[currentNewsIndex.value]);
  }

  List<News> getNextNewsList() {
    return newsOrThread
        .sublist(currentNewsIndex.value + 1)
        .where((element) => element.isNews)
        .map((e) => e.getNews()!)
        .toList();
  }
}
