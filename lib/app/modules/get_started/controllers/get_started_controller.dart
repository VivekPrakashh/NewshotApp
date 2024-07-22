import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/services/auth_services.dart';
import 'package:restart_app/restart_app.dart';

import '../../../routes/app_pages.dart';

class GetStartedController extends GetxController {
  // final PageController pageController = PageController();
  final selectedLocale = Rx(const Locale('hi'));
  final selectedTheme = Rx(ThemeMode.system);
  final isLoading = false.obs;
  final termAccepted = false.obs;
  final AuthServices _authServices;

  GetStartedController(this._authServices);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // pageController.dispose();
    super.onClose();
  }

  registerUser() async {
    isLoading.value = true;
    await _authServices
        .registerUser(
      language: selectedLocale.value,
      theme: selectedTheme.value,
    )
        .then((value) {
      value.fold((l) {
        l.maybeMap(
          orElse: () {
            Get.snackbar(
                "Unable to load. We apologize for the inconvenience.", "",
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
          noFcmToken: (value) {
            Get.dialog(
              AlertDialog(
                title: const Text(
                  "Something not right, Need restart 😥",
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  "Please check your internet and Restart",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Restart.restartApp();
                    },
                    child: const Text("Restart"),
                  )
                ],
              ),
              barrierDismissible: false,
            );
          },
        );
      }, (r) {
        Get.offAndToNamed(Routes.DISCOVERY);
        if (Get.locale!.isEnglish()) {
          FirebaseMessaging.instance.subscribeToTopic('ALL_USERS_ENGLISH');
        } else {
          FirebaseMessaging.instance.subscribeToTopic('ALL_USERS_HINDI');
        }
      });
    });

    isLoading.value = false;
  }
}
