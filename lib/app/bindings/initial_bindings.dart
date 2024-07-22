import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/services/auth_services.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseMessaging>(FirebaseMessaging.instance)
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    Get.put<FirebaseCrashlytics>(FirebaseCrashlytics.instance, permanent: true);
    Get.put<FirebaseAnalytics>(FirebaseAnalytics.instance, permanent: true);
    Get.put<FirebaseDynamicLinks>(FirebaseDynamicLinks.instance,
        permanent: true);
    Get.lazyPut<NewsServices>(() => NewsServices(Get.find()));
    Get.lazyPut<AuthServices>(
        () => AuthServices(Get.find(), Get.find(), Get.find()));
  }
}
