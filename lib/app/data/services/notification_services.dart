import 'dart:convert';
import 'dart:io';
import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/util_functions.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:news_shots_app/app/modules/news_stories/controllers/news_stories_controller.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../firebase_options.dart';
import '../../routes/app_pages.dart';
import '../core/analytics_custom_event.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  showNotification(message);

  debugPrint("Handling a background message: ${message.messageId}");
}

// @pragma('vm:entry-point')
// handleterminatedNotificationClick(NotificationResponse details) async {
//   if (Get.isRegistered<DiscoveryController>()) {
//     handleForgroundNotificationClick(details);
//   } else {
//     await Future.delayed(1.seconds);
//     handleterminatedNotificationClick(details);
//   }
// }

@pragma('vm:entry-point')
showNotification(RemoteMessage message) async {
  const String channelId = "news_shots_notification_channel";
  const String channelName = "important Notification channel";
  const String channelDescription =
      'This channel is used for important notifications.';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // print(message.toMap()['notification']);
  AndroidBitmap<Object>? image;
  if (message.notification != null) {
    // print(notification.android?.imageUrl);
  } else {
    // BigPictureStyleInformation? bigPictureStyleInformation;

    final notification =
        jsonDecode(message.data['notification']) as Map<String, dynamic>;

    // print(notification.hashCode);

    final title = notification['title'].toString();
    final imageUrl = notification['image'];
    final newsId = message.data['newsId'];

    if (imageUrl != null) {
      try {
        final response = await Dio().get<List<int>>(
          imageUrl!,
          options: Options(responseType: ResponseType.bytes),
        );
        if (response.data != null) {
          image = ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(response.data!),
          );
        }
      } on Exception catch (e, s) {
        Get.find<Logger>()
            .e("Error in fetch notification image", error: e, stackTrace: s);
      }
    }

    flutterLocalNotificationsPlugin.show(
      newsId.hashCode,
      title,
      "",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId, channelName,
          channelDescription: channelDescription,
          channelShowBadge: true,
          playSound: true,
          importance: Importance.max,
          priority: Priority.high,
          setAsGroupSummary: true,
          color: const Color(0xff272727),
          category: AndroidNotificationCategory.social,
          colorized: true,
          groupKey: newsId,
          styleInformation: image != null
              ? BigPictureStyleInformation(image, contentTitle: title)
              : null,

          // other properties...
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: jsonEncode(message.data),
    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance.logEvent(
        name: AnalyticsCustomEvent.notification_received.name,
        parameters: {
          "news_id": newsId,
          "news_title": title.substring(0, min(38, (title.length - 1))),
        });
  }
}

class NotificationServices extends GetxService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const String channelId = "news_shots_notification_channel";
  static const String channelName = "important Notification channel";
  static const String channelDescription =
      'This channel is used for important notifications.';
  static String newMessageId = '';
  @override
  Future<void> onInit() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_notification_icon');

    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (res) =>
          handleForgroundNotificationClick(res.payload!),
      // onDidReceiveBackgroundNotificationResponse:
      //     handleterminatedNotificationClick,
    );
    const AndroidNotificationChannel updatesChannel =
        AndroidNotificationChannel(
      channelId, // id
      channelName, // title
      description: channelDescription, // description
      importance: Importance.max,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('updates'),
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(updatesChannel);

    handelForgroundNotification();
    // FirebaseMessaging.instance.requestPermission().then((value) {
    //   FirebaseMessaging.instance.subscribeToTopic('ALL_USERS');
    // });
    FirebaseMessaging.instance.subscribeToTopic('ALL_USERS');

    if (Platform.isIOS) {
      handleBackgroundNotificationClickNotTerminated();
    }

    super.onInit();
  }

  handleForgroundNotificationClick(String encodedPayload) async {
    try {
      if (!Get.isRegistered<NewsServices>()) {
        Get.put(NewsServices(Get.find()));
      }

      final hasInternet = await pingExternal();
      if (!hasInternet) {
        Get.snackbar("No internet", "please switch on the internet 😊",
            duration: 30.seconds,
            icon: const Icon(Icons.error),
            backgroundColor: const Color.fromARGB(184, 255, 177, 171),
            snackPosition: SnackPosition.BOTTOM,
            mainButton: TextButton(
                onPressed: () {
                  Get.closeCurrentSnackbar();
                  handleForgroundNotificationClick(encodedPayload);
                },
                child: const Text("Reload")));

        return;
      }

      // print("handleForgroundNotificationClick");
      final payload = jsonDecode(encodedPayload) as Map<String, dynamic>;
      final newsId = payload['newsId'] as String?;
      final categoryName = payload['categoryName'] as String?;
      Get.find<Logger>().i(newsId);
      if (newsId == null) return;
      EasyLoading.show(status: "Loading...");
      final news = await Get.find<NewsServices>().getNewsByIds(ids: [
        newsId
      ]).then((value) => value.fold((l) {
            l.maybeMap(
              orElse: () {
                Get.snackbar(
                    LocaleKeys.notification_click_error_message.trParams({
                      "category": categoryName ?? "",
                    }),
                    "",
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
          }, (r) => r.first));
      EasyLoading.dismiss();
      // Get.find<NewsServices>().sendNotificationClickEvent(newsId);
      if (news != null) {
        if (Get.isRegistered<NewsStoriesController>()) {
          Get.offNamedUntil(Routes.NEWS_STORIES, (route) => route.isFirst,
              arguments: NewsOrThread.news(news: news));
        } else {
          Get.toNamed(Routes.NEWS_STORIES,
              arguments: NewsOrThread.news(news: news));
        }

        FirebaseAnalytics.instance.logEvent(
            name: AnalyticsCustomEvent.notification_Clicked.name,
            parameters: {
              "news_id": newsId,
              "news_title":
                  news.title.substring(0, min(38, (news.title.length - 1))),
              "category": categoryName ?? "null",
            });
      }
    } catch (e, s) {
      EasyLoading.dismiss();

      Get.find<Logger>()
          .e("Error in handle forground message", error: e, stackTrace: s);
    }
  }

  handleBackgroundNotificationClickNotTerminated() {
    try {
      FirebaseMessaging.onMessageOpenedApp.listen((message) async {
        if (message.messageId != newMessageId) {
          handleForgroundNotificationClick(jsonEncode(message.data));
        }
        newMessageId = message.messageId!;
      });
    } catch (e, s) {
      EasyLoading.dismiss();

      Get.find<Logger>().e(
          "Error in handleBackgroundNotificationClickNotTerminated",
          error: e,
          stackTrace: s);
    }
  }

  handelForgroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("handelForgroundNotification");

      if (message.notification == null) {
        if (message.messageId == newMessageId) {
          return;
        }
        newMessageId = message.messageId ?? "";
        showNotification(message);
        return;
      }

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // print(message.toMap()['notification']);
      // BigPictureStyleInformation? bigPictureStyleInformation;
      AndroidBitmap<Object>? image;
      if (notification != null && android != null) {
        // print(notification.android?.imageUrl);

        if (android.imageUrl != null) {
          final response = await Dio().get<List<int>>(
            android.imageUrl!,
            options: Options(responseType: ResponseType.bytes),
          );
          if (response.data != null) {
            image = ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.data!),
            );

            // bigPictureStyleInformation = BigPictureStyleInformation(
            //   image,
            //   contentTitle: notification.title,
            //   htmlFormatTitle: true,
            //   hideExpandedLargeIcon: true,
            // );
          }
        }

        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          "",
          NotificationDetails(
            android: AndroidNotificationDetails(
              channelId, channelName,
              channelDescription: channelDescription,
              channelShowBadge: true,
              playSound: true,
              setAsGroupSummary: true,
              color: const Color(0xff272727),
              category: AndroidNotificationCategory.social,
              colorized: true,

              // icon: '@mipmap/notification_icon',
              largeIcon: image,
              // tag: notification.hashCode.toString(),
              groupKey: notification.hashCode.toString(),
              styleInformation: image != null
                  ? BigPictureStyleInformation(image,
                      contentTitle: notification.title)
                  : null,
              // styleInformation: bigPictureStyleInformation,

              // other properties...
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });
  }
}
