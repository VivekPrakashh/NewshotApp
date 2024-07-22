import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/bindings/initial_bindings.dart';
import 'package:news_shots_app/app/core/constants.dart';
import 'package:news_shots_app/app/core/text_scale_factors.dart';
import 'package:news_shots_app/app/core/themes.dart';
import 'package:news_shots_app/app/data/core/logger.dart';
import 'package:news_shots_app/app/data/core/show_case_constants.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/helper/ad_helper.dart';
// import 'app/data/services/log_services.dart';
import 'app/data/services/notification_services.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // for initializing facebook ads sdk
    AdHelper.init();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Get.put<LoggingService>(LoggingService());
    Get.put<Logger>(createLogger(), permanent: true);
    Get.put<AppLocalDB>(AppLocalDB(), permanent: true);
    await Get.put<NotificationServices>(NotificationServices()).onInit();
    await _initCrashlytics();
    runApp(
      const MyApp(),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    // LoggingService()
    //     .logError("UnHandled Error:${error.toString()}\nstack:$stack");
  });
}

Future _initCrashlytics() async {
  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (error) {
    FirebaseCrashlytics.instance.recordFlutterError(error);
    // LoggingService().logError("UnHandled Error:${error.toString()}");
  };
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  mapTooltipShow(GlobalKey key) async {
    if (ShowCaseActionsConstaints.newsRouteArrowActionKey == key) {
      await Get.find<AppLocalDB>()
          .showCaseActionsDao
          .markTooltipShown(ShowCaseActionsConstaints.newsRouteArrowAction);
      return;
    }

    if (ShowCaseActionsConstaints.newsFactsActionKey == key) {
      await Get.find<AppLocalDB>()
          .showCaseActionsDao
          .markTooltipShown(ShowCaseActionsConstaints.newsFactsAction);
      return;
    }
  }

  // // Function to calculate adjusted text scale factor
  // double calculateAdjustedTextScaleFactor(MediaQueryData deviceData) {
  //   // Slope and y-intercept from the linear equation
  //   const double m = -0.325;
  //   const double b = 1.975;

  //   // Calculate textScaleFactor based on devicePixelRatio
  //   double textScaleFactor = m * deviceData.devicePixelRatio + b;

  //   // Return the calculated textScaleFactor
  //   print(textScaleFactor);
  //   return textScaleFactor;
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        // RouteLoggingObserver(),
      ],
      locale: const Locale('hi'),
      fallbackLocale: const Locale('hi'),
      translationsKeys: AppTranslation.translations,
      initialBinding: InitialBindings(),
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      title: "Reveal Inside",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(
        builder: (context, child) => Obx(() {
          final mediaQuery = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaler: TextScaler.linear(Constants.textScaleFactor.value
                      .getTextScaleFactor(mediaQuery) ??
                  1),
            ),
            child: child!,

            // info: we are not using as of now may be used in future
            // child: ShowCaseWidget(
            //   onComplete: (p0, p1) {
            //     mapTooltipShow(p1);
            //   },
            //   builder: Builder(builder: (context) => child!),
            // ),
          );
        }),
      ),
    );
  }
}
