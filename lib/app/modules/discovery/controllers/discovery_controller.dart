import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/data/core/show_case_constants.dart';
import 'package:news_shots_app/app/data/services/notification_services.dart';
import 'package:news_shots_app/generated/locales.g.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../data/db/database.dart';
import '../../../data/models/news/category.dart';
import '../../../data/models/news/news.dart';
import '../../../data/models/news/topic.dart';
import '../../../data/models/remote_user/remote_user.dart';
import '../../../data/models/threads/thread.dart';
import '../../../data/services/news_services.dart';
import '../../../routes/app_pages.dart';
import '../../home/uistate/news_with_loading.dart';
import '../../news_stories/controllers/news_stories_controller.dart';
import '../../news_stories/ui_states/news_or_thread.dart';

class DiscoveryController extends GetxController
    with GetTickerProviderStateMixin {
  final categories = <Category>[].obs;
  final AppLocalDB _db;
  final localSession = Rxn<LocalSessionData>();
  int _fetchNewsCount = 20;
  final isTopicLoading = true.obs;
  final topics = <Topic>[].obs;
  final isLoading = false.obs;
  final newsByCategoryMap = Rx<Map<int, NewsWithLoading>>({});
  final NewsServices _newsServices;
  // final PageController categoryContentPageController = PageController();
  late TabController categoriesTabController;
  bool istopicTabInit = false;
  bool isCategoryTabInit = false;
  final news = <News>[].obs;
  Set<String> viewNewsIds = <String>{};
  List<String> readNewsIds = <String>[];
  final logger = Get.find<Logger>();

  final showCaseItems = <GlobalKey>[];
  int errorRetryCount = 2;
  StreamSubscription? _dynamicLinkSubs;
  StreamSubscription? _localSessionSubs;
  final bool isDebug = kDebugMode || const bool.fromEnvironment('debug');
  late final AudioPlayer audioPlayer;
  RemoteUser? remoteUser;

  DiscoveryController(this._newsServices, this._db);

  @override
  Future<void> onInit() async {
    initCategoryTabController(2);

    listenDynamicLink();
    handleFCMiOSOnly();
    await askForPreference();

    _localSessionSubs = _db.localSessionsDao.getLocalSession().listen((event) {
      event.fold((l) => null, (r) {
        localSession.value = r;
      });
    });
    audioPlayer = AudioPlayer();

    readNewsIds = await _db.newsLogsDao.getReadNews().then((value) =>
        value.where((element) => element.isNews).map((e) => e.newsId).toList());
    // _newsServices.fetchBreakingNews().then((value) {
    //   value.fold((l) {}, (r) {
    //     breakingNews.value = r;
    //   });
    // });
    fetchTopics();
    // await initialFetch(false);
    await Future.wait([
      fetchNews(true),
    ]);
    _fetchCategories(false);
    super.onInit();
  }

  handleFCMiOSOnly() {
    if (Platform.isIOS) {
      Get.find<FirebaseMessaging>().getInitialMessage().then((message) {
        if (message == null) return;
        Get.find<NotificationServices>()
            .handleForgroundNotificationClick(jsonEncode(message.data));
      });
    }
  }

  Future<void> askForPreference({bool refetch = false}) async {
    if (!refetch && remoteUser != null && !remoteUser!.preferencesAsked) {
      Get.toNamed(Routes.SELECT_CATEGORIES);
      return;
    }

    await _newsServices.getCurrentUser().then((value) {
      value.fold((l) => null, (r) {
        remoteUser = r;
        if (!r.preferencesAsked) {
          Get.toNamed(Routes.SELECT_CATEGORIES);
        }
      });
    });
  }

  playSound() async {
    EasyLoading.showToast(LocaleKeys.you_are_seeing_latest_news.tr,
        toastPosition: EasyLoadingToastPosition.bottom);
    await audioPlayer.play(
      AssetSource('audio/alert.mp3'),
    );

    // await audioPlayer.dispose();
  }

  fetchTopics() async {
    isTopicLoading.value = true;
    await Future.delayed(3.seconds);
    await _newsServices.fetchTopics().then(
      (value) {
        isTopicLoading.value = false;
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
        }, (r) {
          topics.value = r
              .where((element) => element.articleDisplayOrder.isNotEmpty)
              .toList();
        });
      },
    );
  }

  handleShowCase() async {
    await filterShowCase(ShowCaseActionsConstaints.newsRouteArrowAction,
        ShowCaseActionsConstaints.newsRouteArrowActionKey);

    if (showCaseItems.isNotEmpty) {
      ShowCaseWidget.of(Get.context!).startShowCase(showCaseItems);
    }
  }

  Future<void> filterShowCase(
      String actionId, GlobalKey actionGlobalKey) async {
    await _db.showCaseActionsDao.getShowCaseAction(actionId).then((value) {
      if (!value.hasActionTap && !value.hasShownToolTip) {
        showCaseItems.add(actionGlobalKey);
      }
    });
  }

  checkNotificationPermissionAndShowAlert() {
    Future.delayed(1.seconds, () {
      if (localSession.value != null) {
        // show alert for notification permission 10 times
        if ((localSession.value!.notificationPermissionAlertShownCount < 10)) {
          Permission.notification.status.then((status) {
            if (status == PermissionStatus.denied ||
                status == PermissionStatus.permanentlyDenied) {
              showNotificationPermissionAlert();
            }
          });
        }
      }
    });
  }

  requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status == PermissionStatus.denied) {
      Permission.notification.request();
    }
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  showNotificationPermissionAlert() {
    final context = Get.context!;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      onVisible: () {
        if (localSession.value != null) {
          _db.localSessionsDao.setShowNotificationPermissionAlertCount(
              localSession.value!.notificationPermissionAlertShownCount + 1);
        }
      },
      closeIconColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 251, 228, 255),
      content: RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                ),
            children: [
              TextSpan(
                  text: "${LocaleKeys.stay_connected.tr}\n",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: "${LocaleKeys.noti_permission_alert_message.tr}\n\n"),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      requestNotificationPermission();
                    },
                  text: LocaleKeys.adjust_noti_setting.tr,
                  style: const TextStyle(
                    color: AppColors.action2,
                    fontWeight: FontWeight.bold,
                  ))
            ]),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      showCloseIcon: true,
      duration: GetNumUtils(10).minutes,
    ));
  }

  @override
  onReady() async {
    super.onReady();
    await fcmNotificationHandler();
    handleShowCase();
  }

  Future<void> initialFetch(bool forcedRefresh) async {
    if (!forcedRefresh) {
      askForPreference();
    }
    // int currentIndex = categoriesTabController.index;

    if (forcedRefresh) {
      news.clear();
      // // sliderNews.clear();
      await Future.wait([
        fetchNews(forcedRefresh),
      ]);
    }
  }

  Future<void> refressSliderSlide() async {
    if (categoriesTabController.index > 1) {
      await fetchNewsByCategory(categoriesTabController.index - 2,
          cacheRequest: false, shuffle: true);
    } else {
      await initialFetch(true);
    }
    playSound();
  }

  Future<void> _fetchCategories(bool forcedRefresh) async {
    await _newsServices.fetchCategories().then(
      (value) async {
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
          initCategoryTabController(r.length + 2);
          categories.value = r;
          if (!forcedRefresh) return;
          if (categoriesTabController.index == 0) return;
          if (categoriesTabController.index == 1) return;
          if (r.isNotEmpty) {
            fetchNewsByCategory(categoriesTabController.index - 1,
                cacheRequest: false);
          }
        });
      },
    );
  }

  listenDynamicLink() async {
    _dynamicLinkSubs = Get.find<FirebaseDynamicLinks>().onLink.listen((event) {
      _handleDynamicLink(event);
    });

    final link = await Get.find<FirebaseDynamicLinks>().getInitialLink();

    if (link != null) {
      _handleDynamicLink(link);
    }
  }

  _handleDynamicLink(PendingDynamicLinkData link) async {
    // print("dynamic link found");
    if (link.link.queryParameters.containsKey('newsId')) {
      final newsId = link.link.queryParameters['newsId'];
      Get.find<Logger>().i(newsId);
      if (newsId == null) return;
      EasyLoading.show(status: "Loading...");
      final news = await Get.find<NewsServices>().getNewsByIds(ids: [
        newsId
      ]).then((value) => value.fold((l) => null, (r) => r.first));
      EasyLoading.dismiss();

      if (news != null) {
        if (Get.isRegistered<NewsStoriesController>()) {
          // print("NewsStories registered");
          final homeController = Get.find<NewsStoriesController>();
          homeController.newsOrThread.insert(
              homeController.currentNewsIndex.value,
              NewsOrThread.news(news: news));
        } else {
          Get.toNamed(Routes.NEWS_STORIES,
                  arguments: NewsOrThread.news(news: news))
              ?.then((value) => initialFetch(false));
        }
      }
      return;
    }

    if (link.link.queryParameters.containsKey('threadId')) {
      final threadId = link.link.queryParameters['threadId'];
      Get.find<Logger>().i(threadId);
      if (threadId == null) return;
      EasyLoading.show(status: "Loading...");
      final thread = await Get.find<NewsServices>()
          .getThreadByIds(ids: [threadId]).then((value) =>
              value.fold((l) => null, (r) => r.isNotEmpty ? r.first : null));
      EasyLoading.dismiss();

      if (thread != null) {
        if (Get.isRegistered<NewsStoriesController>()) {
          // print("NewsStories registered");
          final homeController = Get.find<NewsStoriesController>();
          homeController.newsOrThread.insert(
              homeController.currentNewsIndex.value,
              NewsOrThread.thread(thread: thread));
        } else {
          Get.toNamed(Routes.NEWS_STORIES,
                  arguments: NewsOrThread.thread(thread: thread))
              ?.then((value) => initialFetch(false));
        }
      }
      return;
    }
  }

  Future<void> fcmNotificationHandler() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await Get.find<NotificationServices>()
            .flutterLocalNotificationsPlugin
            .getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails != null) {
      if (notificationAppLaunchDetails.didNotificationLaunchApp &&
          notificationAppLaunchDetails.notificationResponse != null) {
        Get.find<NotificationServices>().handleForgroundNotificationClick(
            notificationAppLaunchDetails.notificationResponse!.payload!);
      }
    }
  }

  fetchMore() {
    if (categoriesTabController.index == 0) {
      fetchNews(true);
    } else if (categoriesTabController.index > 1) {
      fetchNewsByCategory(categoriesTabController.index - 2,
          cacheRequest: false);
    }
  }

  Future<void> fetchNews(bool forcedRefresh) async {
    if (isLoading.value) return;
    isLoading.value = true;

    await _newsServices
        .fetchNews(
            limit: _fetchNewsCount,
            existingIds: news.map((e) => e.id!).toList())
        .then((value) async {
      value.fold((l) async {
        isLoading.value = false;
        if (errorRetryCount > 0) {
          await fetchNews(forcedRefresh);
          errorRetryCount--;
        } else {
          Get.snackbar("Something Wrong!! Try Again Later", "",
              duration: 6.seconds,
              icon: const Icon(Icons.warning),
              backgroundColor: const Color.fromARGB(184, 255, 177, 171),
              snackPosition: SnackPosition.BOTTOM,
              messageText: const SizedBox());
        }
      }, (r) async {
        _fetchNewsCount = _fetchNewsCount + 20;
        log("news length from source ${r.length}");

        final existingNewsId = news.map((e) => e.id);

        final unWatchedNews = r.where((element) =>
            !readNewsIds.contains(element.id) &&
            !existingNewsId.contains(element.id));

        news.value = [
          ...news,
          ...unWatchedNews,
        ];

        isLoading.value = false;
      });
    });
    isLoading.value = false;
  }

  Future<void> fetchNewsByCategory(int index,
      {bool cacheRequest = true, bool shuffle = false}) async {
    if (categories.isNotEmpty) {
      final initialNewsWithCategoryState = newsByCategoryMap.value[index] ??
          const NewsWithLoading(isLoading: false);
      if (initialNewsWithCategoryState.isLoading) return;

      newsByCategoryMap.value = {
        ...newsByCategoryMap.value,
        index: initialNewsWithCategoryState.copyWith(
          isLoading: true,
        )
      };

      await _newsServices
          .fetchNewsByCategory(
              category: categories[index],
              limit: initialNewsWithCategoryState.limit,
              existingIds:
                  initialNewsWithCategoryState.news.map((e) => e.id!).toList())
          .then((value) {
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
          return null;
        }, (r) {
          final unWatchedNews =
              r.where((element) => !readNewsIds.contains(element.id)).toList();

          newsByCategoryMap.value = {
            ...newsByCategoryMap.value,
            index: initialNewsWithCategoryState.copyWith(
                isLoading: false,
                limit: initialNewsWithCategoryState.limit + 20,
                news: [...initialNewsWithCategoryState.news, ...unWatchedNews])
          };
        });
      });
    }
  }

  Future<void> reFetch() async {
    // await _newsServices.fetchBreakingNews().then((value) {
    //   value.fold((l) {}, (r) {
    //     breakingNews.value = r;
    //   });
    // });
    fetchTopics();
    await fetchNews(false);
    categoriesTabController.index = 0;
    // fetchNewsByCategory(categoryContentPageController.page?.toInt() ?? 0);
  }

  initCategoryTabController(int itemCount) {
    logger.i("Init Tabcontroller with $itemCount");
    if (!isCategoryTabInit) {
      categoriesTabController = TabController(length: itemCount, vsync: this);

      // categoriesTabController.addListener(() {
      //   // currentPage.value = categoriesTabController.index;
      // });
      if (itemCount > 2) {
        isCategoryTabInit = true;
      }
    }
  }

  @override
  void onClose() {
    _dynamicLinkSubs?.cancel();
    _localSessionSubs?.cancel();
    audioPlayer.dispose();
    super.onClose();
  }

  void onCategoriesPageChange(int value) {
    categoriesTabController.animateTo(value);
    if (value == 0) return;
    fetchNewsByCategory(value - 1);
  }

  // void onTopicsPageChange(int value) {
  //   topicsTabController.animateTo(value);
  //   fetchNewsByTopic(value);
  // }

  Future<List<News>> loadNewsByCategory(int index, int limit) {
    return _newsServices
        .fetchNewsByCategory(category: categories[index], limit: limit)
        .then((value) => value.fold(
              (l) {
                l.maybeMap(
                  orElse: () {
                    Get.snackbar(
                        "Could Not Fetch The Latest News, Some Issue.", "",
                        duration: 6.seconds,
                        icon: const Icon(Icons.error),
                        backgroundColor:
                            const Color.fromARGB(184, 255, 177, 171),
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
                return [];
              },
              (r) => r,
            ));
  }

  Future<List<News>> loadTopics(Topic topic, int limit) {
    return _newsServices
        .fetchNewsByTopic(topic: topic, limit: limit)
        .then((value) => value.fold(
              (l) => [],
              (r) => r,
            ));
  }

  Future<void> updateDuration(String s, int inMilliseconds) async {
    await _db.newsLogsDao.updateDurationWatched(s, inMilliseconds);
  }

  Future<void> sendThreadDuration(Thread news, Duration duration) async {
    await Get.find<NewsServices>().sendThreadReadLog(duration, news.id);
  }
}
