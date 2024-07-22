import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/constants.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:news_shots_app/generated/locales.g.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:timeago/timeago.dart' as timeago;

import 'text_scale_factors.dart';

extension DarkMode on GetInterface {
  toggleThemeMode() {
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  changeTextScaleFactor(TextScaleFactor textScaleFactor,
      {bool shouldUpdate = true}) {
    Constants.textScaleFactor.value = textScaleFactor;
    if (shouldUpdate) {
      Get.find<AppLocalDB>().localSessionsDao.updateFontSize(textScaleFactor);
    }
  }

  TextScaleFactor get getAppTextScaleFactor => Constants.textScaleFactor.value;
}

extension DateX on DateTime {
  String getDate({local = false}) {
    final DateFormat format = DateFormat("yMMMd");
    return format.format(local ? toLocal() : this);
  }

  String getTime({local = false}) {
    final DateFormat f = DateFormat.jm();
    return f.format(local ? toLocal() : this);
  }

  String getDateTime({local = false}) {
    final DateFormat format = DateFormat("yMMMd").add_jm();
    return format.format(local ? toLocal() : this);
  }

  bool get isToday {
    DateTime now = DateTime.now(); // current date and time
    return year == now.year && month == now.month && day == now.day;
  }

  String get getTimeAgo {
    // timeago.setLocaleMessages('hi', timeago.HiMessages());
    // return timeago.format(this, locale: Get.locale?.languageCode ?? 'en');
    final now = DateTime.now();
    final difference = now.difference(this);

    // Formatting for time and date

    if (difference < const Duration(hours: 2)) {
      return LocaleKeys.time_a_moment_ago.tr;
    } else if (difference >= const Duration(hours: 2) &&
        difference < const Duration(days: 1)) {
      return LocaleKeys.time_few_hours_ago.tr;
    } else {
      return LocaleKeys.time_a_while_ago.tr;
    }
  }

  // String get getTimeAgo {
  //   // timeago.setLocaleMessages('hi', timeago.HiMessages());
  //   // return timeago.format(this, locale: Get.locale?.languageCode ?? 'en');
  //   final now = DateTime.now();
  //   final difference = now.difference(this);

  //   // Formatting for time and date

  //   if (difference < const Duration(hours: 2)) {
  //     return LocaleKeys.time_a_moment_ago.tr;
  //   } else if (difference >= const Duration(hours: 2) &&
  //       difference < const Duration(hours: 5)) {
  //     return LocaleKeys.time_some_time_ago.tr;
  //   } else if (difference >= const Duration(hours: 5) && now.day == day) {
  //     String formattedTime = DateFormat('h:mm a').format(this);

  //     return formattedTime;
  //   } else if (now.day - day == 1) {
  //     return LocaleKeys.time_yesterday.tr;
  //   } else {
  //     String formattedDate = DateFormat('dd MMM').format(this);

  //     return formattedDate;
  //   }
  // }
}

extension LocaleX on Locale {
  String getLanguageString() {
    switch (languageCode) {
      case 'en':
        return "English";
      case 'hi':
        return "Hindi";
      default:
        return "English";
    }
  }

  bool isEnglish() {
    switch (languageCode) {
      case 'en':
        return true;
      case 'hi':
        return false;
      default:
        return true;
    }
  }
}

extension LocalSessionDataX on LocalSessionData {
  Future<bool> hasVersionUpdate() async {
    String? currentFcmToken;

    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (Platform.isIOS) {
        await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        currentFcmToken = await FirebaseMessaging.instance.getToken();
        log("Get Token: $currentFcmToken");
      } else {
        currentFcmToken = await FirebaseMessaging.instance.getToken();
        log("Get Token: $currentFcmToken");
      }

      final status = await Permission.notification.status;
      // final theme = Get.theme.
      // Clipboard.setData(ClipboardData(text: token ?? ""));
      debugPrint(
          "localNotificationPermission: ${notificationPermission?.name}");
      debugPrint("NotificationPermission: ${status.name}");
      debugPrint("localFcmtoken: $fcmToken");
      debugPrint("fcmtoken: $currentFcmToken");
      debugPrint("localAppVersion: $appVersion");
      debugPrint("appVersion: ${packageInfo.version}");
      if (appVersion == packageInfo.version &&
          fcmToken == currentFcmToken &&
          status == notificationPermission) {
        return false;
      } else {
        await Get.find<NewsServices>()
            .updateCurrentUser(
          version: packageInfo.version,
          token: currentFcmToken,
          permissionStatus: status,
          theme: theme,
        )
            .then((value) async {
          await Get.find<AppLocalDB>()
              .localSessionsDao
              .updateAppVersion(packageInfo.version, fcmToken, status);
        });

        return true;
      }
    } on Exception catch (e, s) {
      Get.find<Logger>()
          .e("Error in check has Version Update", error: e, stackTrace: s);
      return false;
    }
  }
}

enum NotificationPreference { all, normal, importantOnly, off }
