import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/constants.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/core/analytics_custom_event.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/models/app_user_dto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/util_functions.dart';
import '../core/failures.dart';

class AuthServices extends GetxService {
  final AppLocalDB _db;
  final FirebaseAnalytics _analytics;
  final Logger _logger;

  final endpoint = "https://newsserver.tensionfreeparking.com";

  late final Dio client;

  AuthServices(
    this._db,
    this._analytics,
    this._logger,
  );

  @override
  onInit() async {
    client = Dio(BaseOptions(
      baseUrl: endpoint,

      connectTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60),
    ));

    super.onInit();
  }

  Future<Either<Unit, LocalSessionData>> checkAuth() {
    return _db.localSessionsDao.hasSession();
  }

  Future<String?> getVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    } on Exception catch (e, s) {
      _logger.e("Error in Get AppVersion", error: e, stackTrace: s);
      return null;
    }
  }

  Future<Either<InfraFailure, Unit>> registerUser(
      {Locale language = const Locale('hi'),
      ThemeMode theme = ThemeMode.system}) async {
    try {
      _analytics.logEvent(
          name: AnalyticsCustomEvent.tried_register.name,
          parameters: {
            "language": language.getLanguageString(),
            "theme": theme.name
          });
      String? fcmToken;
      try {
        if (Platform.isIOS) {
          NotificationSettings settings =
              await Get.find<FirebaseMessaging>().requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true,
          );

          if (settings.authorizationStatus == AuthorizationStatus.authorized) {
            fcmToken = await Get.find<FirebaseMessaging>().getToken();
            log("Get Token: $fcmToken");
          }
        } else {
          fcmToken = await Get.find<FirebaseMessaging>().getToken();
          log("Get Token: $fcmToken");
        }
      } catch (e, s) {
        _logger.e("Error in get fcm token while register",
            error: e, stackTrace: s);
      }

      if (Platform.isAndroid && fcmToken == null) {
        return left(const InfraFailure.noFcmToken());
      }

      final appVersion = await getVersion();
      final status = await Permission.notification.status;

      final res = await client.post('/api/user/register', data: {
        "language": language.getLanguageString().toLowerCase(),
        "fcmToken": fcmToken,
        "appVersion": appVersion,
        "notificationPermissionStatus": status.name,
        "theme": theme.name,
        "platform": Platform.operatingSystem,
      });

      _logger.i(res);

      if (res.statusCode == 200) {
        _analytics.logEvent(
            name: AnalyticsCustomEvent.tried_register_success.name,
            parameters: {
              "language": language.getLanguageString(),
              "theme": theme.name
            });
        final token = res.data['token'];
        final user = AppUserDto.fromJson(res.data['newUser']);

        await _db.localSessionsDao.createSession(
          userId: user.id,
          token: token,
          address: null,
          languageCode: language.languageCode,
          theme: theme,
          fcmToken: fcmToken,
          appVersion: appVersion,
          textScaleFactor: Constants.textScaleFactor.value,
        );
        _analytics.logEvent(
            name: AnalyticsCustomEvent.created_local_session.name,
            parameters: {
              "language": language.getLanguageString(),
              "user_id": user.id
            });
        Get.find<FirebaseAnalytics>().setUserId(
            id: user.id, callOptions: AnalyticsCallOptions(global: true));
        Get.find<FirebaseCrashlytics>().setUserIdentifier(user.id);
        return right(unit);
      }
      _logger.e(
        "UnExpected Response while register\nResponse:${res.data}",
      );

      return left(const InfraFailure.unexpected());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await pingExternal().then((value) {
          if (value) {
            _logger.e(
                "Client Internet Working \nError:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}\nresponse:${e.response?.data}",
                error: e.error,
                stackTrace: e.stackTrace);
            return left(const InfraFailure.serverError());
          } else {
            _logger.e("Client Internet Not Working",
                error: e.error, stackTrace: e.stackTrace);
            return left(const InfraFailure.noInternet());
          }
        });
        // return left(const InfraFailure.noInternet());
      }
      _analytics.logEvent(
        name: AnalyticsCustomEvent.tried_register_fail.name,
        parameters: {
          "language": language.languageCode,
          "theme": theme.name,
          "error_message": e.message ?? "Unknown Error",
          "error_response": e.response ?? "Unknown Response",
        },
      );
      _logger.e(
          "Error:${e.message}\nInfo: path:${e.requestOptions.path}\ndata:${e.requestOptions.data}",
          error: e.error,
          stackTrace: e.stackTrace);
      if (e.type == DioExceptionType.connectionError) {
        return left(const InfraFailure.noInternet());
      }
      return left(const InfraFailure.serverError());
    } on Exception catch (e, s) {
      _analytics.logEvent(
        name: AnalyticsCustomEvent.tried_register_fail.name,
        parameters: {
          "language": language.languageCode,
          "theme": theme.name,
          "error_message": e.toString(),
        },
      );
      _logger.e("Unexpected Error", error: e, stackTrace: s);
      return left(const InfraFailure.unexpected());
    }
  }
}
