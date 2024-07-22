import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:news_shots_app/app/core/extenstions.dart';
// import 'package:news_shots_app/app/core/text_scale_factors.dart';
import 'package:news_shots_app/app/data/db/convertors/address_convertor.dart';
import 'package:news_shots_app/app/data/db/convertors/text_scale_factor_convertor.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalSession extends Table {
  TextColumn get userId => text().unique()();
  TextColumn get languageCode => text().withDefault(const Variable('hi'))();
  TextColumn get token => text()();
  TextColumn get appVersion => text().nullable()();
  TextColumn get fcmToken => text().nullable()();
  TextColumn get lastFatchedThreadId => text().nullable()();
  TextColumn get address => text().map(AddressConvertor()).nullable()();
  IntColumn get theme => intEnum<ThemeMode>()();
  TextColumn get fontSize => text().map(TextScaleFactorConvertor())();
  IntColumn get ratingReminder => intEnum<RatingReminder>().nullable()();
  DateTimeColumn get lastAskedRating => dateTime().nullable()();
  DateTimeColumn get lastRequestTime => dateTime().nullable()();
  DateTimeColumn get lastCategoryRequestTime => dateTime().nullable()();
  IntColumn get manualRefressCount =>
      integer().withDefault(const Variable(0))();
  IntColumn get notificationPreference => intEnum<NotificationPreference>()
      .withDefault(Variable(NotificationPreference.normal.index))();
  IntColumn get notificationPermission =>
      intEnum<PermissionStatus>().nullable()();
  IntColumn get notificationPermissionAlertShownCount =>
      integer().withDefault(const Variable(0))();
  BoolColumn get hideNewsOption =>
      boolean().withDefault(const Variable(false))();
  BoolColumn get hideDoubts => boolean().withDefault(const Variable(false))();
}

enum RatingReminder { nextTwoDay, nextWeek, never }
