import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/news/news.dart';
import '../../../data/services/auth_services.dart';
import 'package:in_app_update/in_app_update.dart';

class SplashController extends GetxController {
  final AuthServices _authServices;
  News? initialNews;
  Completer<void>? _completer;

  SplashController(
    this._authServices,
  );

  @override
  Future<void> onInit() async {
    _completer = Completer();
    checkForUpdate();
    Future.delayed(1.seconds).then((value) {
      _completer?.complete();
    });
    _authServices.checkAuth().then((value) {
      value.fold((l) async {
        await _completer?.future;
        Get.offAllNamed(Routes.GET_STARTED);
        // Permission.notification.request();
      }, (r) async {
        printInfo(
          info: r.toString(),
        );
        // print(r);
        final locale = Locale(r.languageCode);
        await Get.updateLocale(locale);
        Get.changeThemeMode(r.theme);
        Get.changeTextScaleFactor(r.fontSize, shouldUpdate: false);
        if (locale.isEnglish()) {
          FirebaseMessaging.instance.subscribeToTopic('ALL_USERS_ENGLISH');
        } else {
          FirebaseMessaging.instance.subscribeToTopic('ALL_USERS_HINDI');
        }

        await r.hasVersionUpdate().then((value) {
          if (value) {
            Get.find<Logger>().i("Has New update");
          }
        });
        // await _fetchCategories();
        // // await Get.find<NewsServices>()
        // //     .fetchNews(limit: 20)
        // //     .then((value) async {});
        await _completer?.future;
        Get.offNamed(Routes.DISCOVERY);
      });
    });

    super.onInit();
  }

  Future<void> _fetchCategories() async {
    final NewsServices newsServices = Get.find<NewsServices>();
    await newsServices.fetchCategories().then(
      (value) async {
        await value.fold((l) {}, (r) async {
          if (r.isNotEmpty) {
            // await newsServices
            //     .fetchNewsByCategory(category: r.first, limit: 10)
            //     .then((value) {});
          }
        });
      },
    );
  }

  checkForUpdate() async {
    if (kReleaseMode && Platform.isAndroid) {
      InAppUpdate.checkForUpdate().then(
        (value) {
          if (value.updateAvailability == UpdateAvailability.updateAvailable) {
            if (value.updatePriority == 5) {
              InAppUpdate.performImmediateUpdate().then((value) {
                if (value == AppUpdateResult.inAppUpdateFailed) {
                  InAppUpdate.startFlexibleUpdate().then((value) {
                    if (value == AppUpdateResult.success) {
                      InAppUpdate.completeFlexibleUpdate();
                    }
                  });
                }
              });
            } else {
              showUpdateAlert();
            }
          }
        },
      );
    } else if (Platform.isIOS) {
      final newVersion = NewVersionPlus(
        iOSId: 'com.revealInside',
        iOSAppStoreCountry: 'IN',
      );
      final status = await newVersion.getVersionStatus();
      if (status != null) {
        if (status.localVersion != status.storeVersion) {
          Get.dialog(CupertinoAlertDialog(
            title: const Text("Update App?"),
            content: Column(
              children: [
                Text(
                    "A new version is available! Version ${status.storeVersion} is now available-you have ${status.localVersion}."),
                const Text(
                  "Release Note:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(status.releaseNotes ?? "")
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  newVersion.launchAppStore(
                    status.appStoreLink,
                    launchMode: LaunchMode.externalApplication,
                  );
                  // Get.back();
                },
                child: const Text("UPDATE NOW"),
              )
            ],
          ));
        }
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showUpdateAlert() {
    Future.delayed(
      2.seconds,
      () {
        // Get.snackbar("title", "message");
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          closeIconColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 251, 228, 255),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Update Available",
                  style: Get.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  )),
              TextButton.icon(
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                ),
                onPressed: () async {
                  await InAppUpdate.startFlexibleUpdate().then((value) async {
                    if (value == AppUpdateResult.success) {
                      await InAppUpdate.completeFlexibleUpdate();
                    }
                  });
                  Get.closeAllSnackbars();
                },
                icon: const Icon(Icons.download),
                label: const Text("Install Now"),
              )
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          showCloseIcon: true,
          duration: GetNumUtils(10).minutes,
        ));
      },
    );
    // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    //   closeIconColor: Colors.black,
    //   backgroundColor: const Color.fromARGB(255, 251, 228, 255),
    //   content: RichText(
    //     text: TextSpan(
    //         style: Get.textTheme.titleMedium?.copyWith(
    //           color: Colors.black,
    //         ),
    //         children: []),
    //   ),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   showCloseIcon: true,
    //   duration: GetNumUtils(10).minutes,
    // ));
  }
}
