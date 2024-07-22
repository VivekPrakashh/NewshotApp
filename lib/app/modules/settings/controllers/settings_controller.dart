import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:news_shots_app/app/modules/news_stories/controllers/news_stories_controller.dart';

class SettingsController extends GetxController {
  final appSettings = Rxn<LocalSessionData>();
  final AppLocalDB _db;

  StreamSubscription? _appSettingsSubs;

  SettingsController(this._db);

  @override
  void onInit() {
    _db.localSessionsDao.getLocalSession().listen((event) {
      event.fold((l) {}, (r) {
        appSettings.value = r;
      });
    });

    super.onInit();
  }

  handleLocaleChange() {
    if (Get.isRegistered<NewsStoriesController>()) {
      Get.find<NewsStoriesController>().handleLangaugeChange();
    }
    // print(Get.isPrepared<DiscoveryPageController>());
    // print("isRegistered ${Get.isRegistered<DiscoveryPageController>()}");
    // print(Get.isPrepared<DiscoveryPageController>());
    Get.find<DiscoveryController>().news.clear();
    // Get.find<DiscoveryController>().sliderNews.clear();
    _db.tempNewsCacheDao.emptyNewsOnLanguageChange().then((value) {
      if (!Get.isPrepared<DiscoveryController>() &&
          Get.isRegistered<DiscoveryController>()) {
        Get.find<DiscoveryController>().reFetch();
      }
    });

    // if (Get.isRegistered<DiscoveryPageController>()) {
    //   Get.find<DiscoveryPageController>().reFetch();
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _appSettingsSubs?.cancel();
    super.onClose();
  }

  updateLocale(Locale locale) async {
    EasyLoading.show(
        status: "Please Wait!!", maskType: EasyLoadingMaskType.black);
    await Get.find<NewsServices>()
        .updateCurrentUser(language: locale.getLanguageString())
        .then((value) {
      value.fold((l) {
        EasyLoading.showError(
            "Unable to change Language, Please Try Again Later. We apologize for the inconvenience");
        return null;
      }, (r) {
        Get.updateLocale(locale);
        // _db.localSessionsDao.updateLocale(locale.languageCode);
        if (locale.isEnglish()) {
          FirebaseMessaging.instance.subscribeToTopic('ALL_USERS_ENGLISH');
          FirebaseMessaging.instance.unsubscribeFromTopic('ALL_USERS_HINDI');
        } else {
          FirebaseMessaging.instance.subscribeToTopic('ALL_USERS_HINDI');
          FirebaseMessaging.instance.unsubscribeFromTopic('ALL_USERS_ENGLISH');
        }
        handleLocaleChange();
        return null;
      });
      EasyLoading.dismiss();
    });
  }

  updateTheme(ThemeMode theme) {
    _db.localSessionsDao.updateThemeMode(theme);
    Get.changeThemeMode(theme);
    Get.find<NewsServices>().updateCurrentUser(theme: theme);
  }

  updateNotificationPref(NotificationPreference notificationPreference) {
    _db.localSessionsDao.updateNotificationPreference(notificationPreference);
    Get.find<NewsServices>()
        .updateCurrentUser(notificationPreference: notificationPreference);
  }

  updateHideOption(bool hidden) async {
    await _db.localSessionsDao.updateNewsMenuOption(hidden);
  }
}
