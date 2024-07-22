import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/text_scale_factors.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/models/address.dart';
import 'package:permission_handler/permission_handler.dart';

import 'local_session.dart';
part 'local_session_dao.g.dart';

@DriftAccessor(tables: [LocalSession])
class LocalSessionsDao extends DatabaseAccessor<AppLocalDB>
    with _$LocalSessionsDaoMixin {
  LocalSessionsDao(super.attachedDatabase);

  Future<void> createSession({
    required String userId,
    required String token,
    required Address? address,
    required String languageCode,
    required ThemeMode theme,
    required String? fcmToken,
    required String? appVersion,
    TextScaleFactor? textScaleFactor,
  }) async {
    final LocalSessionCompanion data = LocalSessionCompanion(
        userId: Value(userId),
        address: Value(address),
        languageCode: Value(languageCode),
        token: Value(token),
        theme: Value(theme),
        rowid: const Value(0),
        fontSize: Value(textScaleFactor ?? const TextScaleFactor.normal()),
        fcmToken: Value(fcmToken),
        appVersion: Value(appVersion));
    await transaction(() async {
      await delete(localSession).go();
      await (into(localSession)).insert(data);
      // return null;
    });
  }

  Future<Either<Unit, LocalSessionData>> hasSession() async {
    final data = await select(localSession).getSingleOrNull();
    if (data != null) {
      return right(data);
    } else {
      return left(unit);
    }
  }

  Stream<Either<Unit, LocalSessionData>> getLocalSession() {
    return select(localSession)
        .watchSingleOrNull()
        .map((event) => event == null ? left(unit) : right(event));
  }

  updateLocale(String languageCode) async {
    await update(localSession)
        .write(LocalSessionCompanion(languageCode: Value(languageCode)));
  }

  updateThemeMode(ThemeMode theme) async {
    await update(localSession)
        .write(LocalSessionCompanion(theme: Value(theme)));
  }

  updateNotificationPreference(
      NotificationPreference notificationPreference) async {
    await update(localSession).write(LocalSessionCompanion(
        notificationPreference: Value(notificationPreference)));
  }

  updateFontSize(TextScaleFactor fontSize) async {
    await update(localSession)
        .write(LocalSessionCompanion(fontSize: Value(fontSize)));
  }

  Future<void> setLastFetchedThreadId(String id) async {
    await update(localSession)
        .write(LocalSessionCompanion(lastFatchedThreadId: Value(id)));
  }

  Future<String?> getLastFetchedThreadId() {
    return (selectOnly(localSession)
          ..addColumns([localSession.lastFatchedThreadId]))
        .map((p0) => p0.read(localSession.lastFatchedThreadId))
        .getSingle();
  }

  Future<RatingReminder?> getRatingReminder() async {
    return (await select(localSession).getSingleOrNull())?.ratingReminder;
  }

  Future<bool> shouldShowRatingDialog() async {
    final session = await select(localSession).getSingleOrNull();
    final rr = session?.ratingReminder;
    final lastAsked = session?.lastAskedRating;
    if (rr == null || lastAsked == null) return true;
    if (rr == RatingReminder.never) return false;
    if (rr == RatingReminder.nextWeek &&
        lastAsked.add(7.days).isBefore(DateTime.now())) return true;
    if (rr == RatingReminder.nextTwoDay &&
        lastAsked.add(2.days).isBefore(DateTime.now())) return true;
    return false;
  }

  setRatingReminder(RatingReminder ratingReminder) async {
    await update(localSession).write(LocalSessionCompanion(
        ratingReminder: Value(ratingReminder),
        lastAskedRating: Value(DateTime.now())));
  }

  Future<void> updateAppVersion(String version, String? fcmToken,
      PermissionStatus permissionStatus) async {
    await update(localSession).write(LocalSessionCompanion(
      appVersion: Value(version),
      fcmToken: Value(fcmToken),
      notificationPermission: Value(permissionStatus),
    ));
  }

  Future<void> syncFromServer({
    String? fcmToken,
    String? language,
    String? notificationPreference,
    String? appVersion,
    String? notificationPermissionStatus,
  }) async {
    printInfo(info: "Sync from server");

    PermissionStatus? permissionStatus;
    if (notificationPermissionStatus != null) {
      permissionStatus = PermissionStatus.values.firstWhereOrNull(
          (element) => element.name == notificationPermissionStatus);
    }

    await update(localSession).write(
      LocalSessionCompanion(
          appVersion: Value(appVersion),
          fcmToken: Value(fcmToken),
          languageCode:
              language == "hindi" ? const Value('hi') : const Value('en'),
          notificationPreference: switch (notificationPreference) {
            "all" => const Value(NotificationPreference.all),
            "normal" => const Value(NotificationPreference.normal),
            "importantOnly" =>
              const Value(NotificationPreference.importantOnly),
            "off" => const Value(NotificationPreference.off),
            String() => const Value(NotificationPreference.normal),
            null => const Value(NotificationPreference.normal),
          },
          notificationPermission: Value(permissionStatus)),
    );
  }

  setNotificationPermissionStatus(PermissionStatus status) async {
    await update(localSession)
        .write(LocalSessionCompanion(notificationPermission: Value(status)));
  }

  // Future<bool> shouldShowNotificationPermissionAlert() async {
  //   return ((await (selectOnly(localSession)
  //                 ..addColumns(
  //                     [localSession.notificationPermissionAlertShownCount]))
  //               .map((p0) =>
  //                   p0.read(localSession.notificationPermissionAlertShownCount))
  //               .getSingle()) ??
  //           0) <
  //       2;
  // }

  Future<void> setShowNotificationPermissionAlertCount(int count) async {
    await update(localSession).write(LocalSessionCompanion(
        notificationPermissionAlertShownCount: Value(count)));
  }

  Future<void> updateNewsMenuOption(bool hidden) async {
    await update(localSession)
        .write(LocalSessionCompanion(hideNewsOption: Value(hidden)));
  }

  Future<void> updatehideDoubtsOption(bool value) async {
    await update(localSession)
        .write(LocalSessionCompanion(hideDoubts: Value(value)));
  }

  Stream<bool?> getHideDoubtsStreams() {
    return (selectOnly(localSession)..addColumns([localSession.hideDoubts]))
        .map((p0) => p0.read(localSession.hideDoubts))
        .watchSingle();
  }
}
