// import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:news_shots_app/app/routes/app_pages.dart';

// import '../../../firebase_options.dart';

// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
// bool isFlutterLocalNotificationsInitialized = false;
// late AndroidNotificationChannel channel;
// const String channelId = "news_shots_notification_channel";
// const String channelName = "important Notification channel";
// const String channelDescription =
//     'This channel is used for important notifications.';

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   // await setupFlutterNotifications();
//   print(message.data);

//   // showFlutterNotification(message);
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   print('Handling a background message ${message.messageId}');
// }

// Future<void> setupFlutterNotifications() async {
//   if (isFlutterLocalNotificationsInitialized) {
//     return;
//   }

//   channel = const AndroidNotificationChannel(
//     channelId, // id
//     channelName, // title
//     description: channelDescription, // description
//     importance: Importance.max,
//     playSound: true,
//     // sound: RawResourceAndroidNotificationSound('updates'),
//   );

//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('mipmap/ic_launcher');

//   InitializationSettings initializationSettings = const InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: DarwinInitializationSettings(),
//   );
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onDidReceiveNotificationResponse: (details) {
//       print("Notification clicked");
//       Future.delayed(
//         1000.milliseconds,
//         () {
//           Get.toNamed(Routes.LOGIN);
//         },
//       );
//     },
//   );

//   /// Create an Android Notification Channel.
//   ///
//   /// We use this channel in the `AndroidManifest.xml` file to override the
//   /// default FCM channel to enable heads up notifications.
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   /// Update the iOS foreground notification presentation options to allow
//   /// heads up notifications.
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   isFlutterLocalNotificationsInitialized = true;
// }

// void showFlutterNotification(RemoteMessage message) {
//   flutterLocalNotificationsPlugin.show(
//     0,
//     "notification.title",
//     "notification.body",
//     const NotificationDetails(
//       android: AndroidNotificationDetails(
//         "channel.id",
//         "channel.name",
//         channelDescription: "channel.description",
//         // icon: android.smallIcon,
//         channelShowBadge: true,
//         playSound: true,
//       ),
//     ),
//   );
//   // RemoteNotification? notification = message.notification;
//   // AndroidNotification? android = message.notification?.android;
//   // if (notification != null && android != null && !kIsWeb) {
//   //   flutterLocalNotificationsPlugin.show(
//   //     notification.hashCode,
//   //     "notification.title",
//   //     "notification.body",
//   //     NotificationDetails(
//   //       android: AndroidNotificationDetails(
//   //         "channel.id",
//   //         "channel.name",
//   //         channelDescription: "channel.description",
//   //         icon: android.smallIcon,
//   //         channelShowBadge: true,
//   //         playSound: true,
//   //       ),
//   //     ),
//   //   );
//   // }
// }

// // handleBackgroundMessage() {
// //   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
// //   handelForgroundNotification();
// // }

// handelForgroundNotification() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print(message.data);
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     if (notification != null && android != null) {
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon: android.smallIcon,
//             // channelShowBadge: true,
//             // playSound: true,
//           ),
//           // iOS: const DarwinNotificationDetails(),
//         ),
//         payload: json.encode(message.data),
//       );
//     } else {
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         "notification.title",
//         "notification.body",
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             // icon: android.smallIcon,
//             // channelShowBadge: true,
//             // playSound: true,
//           ),
//           // iOS: const DarwinNotificationDetails(),
//         ),
//         payload: json.encode(message.data),
//       );
//     }
//   });
// }

// class NewNotificationServices extends GetxService {}
