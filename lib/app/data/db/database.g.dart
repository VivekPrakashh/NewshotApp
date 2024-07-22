// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocalSessionTable extends LocalSession
    with TableInfo<$LocalSessionTable, LocalSessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSessionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _languageCodeMeta =
      const VerificationMeta('languageCode');
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
      'language_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Variable('hi'));
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _appVersionMeta =
      const VerificationMeta('appVersion');
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
      'app_version', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fcmTokenMeta =
      const VerificationMeta('fcmToken');
  @override
  late final GeneratedColumn<String> fcmToken = GeneratedColumn<String>(
      'fcm_token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastFatchedThreadIdMeta =
      const VerificationMeta('lastFatchedThreadId');
  @override
  late final GeneratedColumn<String> lastFatchedThreadId =
      GeneratedColumn<String>('last_fatched_thread_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumnWithTypeConverter<Address?, String> address =
      GeneratedColumn<String>('address', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Address?>($LocalSessionTable.$converteraddressn);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumnWithTypeConverter<ThemeMode, int> theme =
      GeneratedColumn<int>('theme', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ThemeMode>($LocalSessionTable.$convertertheme);
  static const VerificationMeta _fontSizeMeta =
      const VerificationMeta('fontSize');
  @override
  late final GeneratedColumnWithTypeConverter<TextScaleFactor, String>
      fontSize = GeneratedColumn<String>('font_size', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TextScaleFactor>(
              $LocalSessionTable.$converterfontSize);
  static const VerificationMeta _ratingReminderMeta =
      const VerificationMeta('ratingReminder');
  @override
  late final GeneratedColumnWithTypeConverter<RatingReminder?, int>
      ratingReminder = GeneratedColumn<int>(
              'rating_reminder', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<RatingReminder?>(
              $LocalSessionTable.$converterratingRemindern);
  static const VerificationMeta _lastAskedRatingMeta =
      const VerificationMeta('lastAskedRating');
  @override
  late final GeneratedColumn<DateTime> lastAskedRating =
      GeneratedColumn<DateTime>('last_asked_rating', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastRequestTimeMeta =
      const VerificationMeta('lastRequestTime');
  @override
  late final GeneratedColumn<DateTime> lastRequestTime =
      GeneratedColumn<DateTime>('last_request_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastCategoryRequestTimeMeta =
      const VerificationMeta('lastCategoryRequestTime');
  @override
  late final GeneratedColumn<DateTime> lastCategoryRequestTime =
      GeneratedColumn<DateTime>('last_category_request_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _manualRefressCountMeta =
      const VerificationMeta('manualRefressCount');
  @override
  late final GeneratedColumn<int> manualRefressCount = GeneratedColumn<int>(
      'manual_refress_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Variable(0));
  static const VerificationMeta _notificationPreferenceMeta =
      const VerificationMeta('notificationPreference');
  @override
  late final GeneratedColumnWithTypeConverter<NotificationPreference, int>
      notificationPreference = GeneratedColumn<int>(
              'notification_preference', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Variable(NotificationPreference.normal.index))
          .withConverter<NotificationPreference>(
              $LocalSessionTable.$converternotificationPreference);
  static const VerificationMeta _notificationPermissionMeta =
      const VerificationMeta('notificationPermission');
  @override
  late final GeneratedColumnWithTypeConverter<PermissionStatus?, int>
      notificationPermission = GeneratedColumn<int>(
              'notification_permission', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<PermissionStatus?>(
              $LocalSessionTable.$converternotificationPermissionn);
  static const VerificationMeta _notificationPermissionAlertShownCountMeta =
      const VerificationMeta('notificationPermissionAlertShownCount');
  @override
  late final GeneratedColumn<int> notificationPermissionAlertShownCount =
      GeneratedColumn<int>(
          'notification_permission_alert_shown_count', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Variable(0));
  static const VerificationMeta _hideNewsOptionMeta =
      const VerificationMeta('hideNewsOption');
  @override
  late final GeneratedColumn<bool> hideNewsOption = GeneratedColumn<bool>(
      'hide_news_option', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("hide_news_option" IN (0, 1))'),
      defaultValue: const Variable(false));
  static const VerificationMeta _hideDoubtsMeta =
      const VerificationMeta('hideDoubts');
  @override
  late final GeneratedColumn<bool> hideDoubts = GeneratedColumn<bool>(
      'hide_doubts', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hide_doubts" IN (0, 1))'),
      defaultValue: const Variable(false));
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        languageCode,
        token,
        appVersion,
        fcmToken,
        lastFatchedThreadId,
        address,
        theme,
        fontSize,
        ratingReminder,
        lastAskedRating,
        lastRequestTime,
        lastCategoryRequestTime,
        manualRefressCount,
        notificationPreference,
        notificationPermission,
        notificationPermissionAlertShownCount,
        hideNewsOption,
        hideDoubts
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_session';
  @override
  VerificationContext validateIntegrity(Insertable<LocalSessionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
          _languageCodeMeta,
          languageCode.isAcceptableOrUnknown(
              data['language_code']!, _languageCodeMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('app_version')) {
      context.handle(
          _appVersionMeta,
          appVersion.isAcceptableOrUnknown(
              data['app_version']!, _appVersionMeta));
    }
    if (data.containsKey('fcm_token')) {
      context.handle(_fcmTokenMeta,
          fcmToken.isAcceptableOrUnknown(data['fcm_token']!, _fcmTokenMeta));
    }
    if (data.containsKey('last_fatched_thread_id')) {
      context.handle(
          _lastFatchedThreadIdMeta,
          lastFatchedThreadId.isAcceptableOrUnknown(
              data['last_fatched_thread_id']!, _lastFatchedThreadIdMeta));
    }
    context.handle(_addressMeta, const VerificationResult.success());
    context.handle(_themeMeta, const VerificationResult.success());
    context.handle(_fontSizeMeta, const VerificationResult.success());
    context.handle(_ratingReminderMeta, const VerificationResult.success());
    if (data.containsKey('last_asked_rating')) {
      context.handle(
          _lastAskedRatingMeta,
          lastAskedRating.isAcceptableOrUnknown(
              data['last_asked_rating']!, _lastAskedRatingMeta));
    }
    if (data.containsKey('last_request_time')) {
      context.handle(
          _lastRequestTimeMeta,
          lastRequestTime.isAcceptableOrUnknown(
              data['last_request_time']!, _lastRequestTimeMeta));
    }
    if (data.containsKey('last_category_request_time')) {
      context.handle(
          _lastCategoryRequestTimeMeta,
          lastCategoryRequestTime.isAcceptableOrUnknown(
              data['last_category_request_time']!,
              _lastCategoryRequestTimeMeta));
    }
    if (data.containsKey('manual_refress_count')) {
      context.handle(
          _manualRefressCountMeta,
          manualRefressCount.isAcceptableOrUnknown(
              data['manual_refress_count']!, _manualRefressCountMeta));
    }
    context.handle(
        _notificationPreferenceMeta, const VerificationResult.success());
    context.handle(
        _notificationPermissionMeta, const VerificationResult.success());
    if (data.containsKey('notification_permission_alert_shown_count')) {
      context.handle(
          _notificationPermissionAlertShownCountMeta,
          notificationPermissionAlertShownCount.isAcceptableOrUnknown(
              data['notification_permission_alert_shown_count']!,
              _notificationPermissionAlertShownCountMeta));
    }
    if (data.containsKey('hide_news_option')) {
      context.handle(
          _hideNewsOptionMeta,
          hideNewsOption.isAcceptableOrUnknown(
              data['hide_news_option']!, _hideNewsOptionMeta));
    }
    if (data.containsKey('hide_doubts')) {
      context.handle(
          _hideDoubtsMeta,
          hideDoubts.isAcceptableOrUnknown(
              data['hide_doubts']!, _hideDoubtsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LocalSessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSessionData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      languageCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_code'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      appVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_version']),
      fcmToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fcm_token']),
      lastFatchedThreadId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}last_fatched_thread_id']),
      address: $LocalSessionTable.$converteraddressn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])),
      theme: $LocalSessionTable.$convertertheme.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme'])!),
      fontSize: $LocalSessionTable.$converterfontSize.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_size'])!),
      ratingReminder: $LocalSessionTable.$converterratingRemindern.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}rating_reminder'])),
      lastAskedRating: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_asked_rating']),
      lastRequestTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_request_time']),
      lastCategoryRequestTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_category_request_time']),
      manualRefressCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}manual_refress_count'])!,
      notificationPreference: $LocalSessionTable
          .$converternotificationPreference
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.int,
              data['${effectivePrefix}notification_preference'])!),
      notificationPermission: $LocalSessionTable
          .$converternotificationPermissionn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.int,
              data['${effectivePrefix}notification_permission'])),
      notificationPermissionAlertShownCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}notification_permission_alert_shown_count'])!,
      hideNewsOption: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hide_news_option'])!,
      hideDoubts: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hide_doubts'])!,
    );
  }

  @override
  $LocalSessionTable createAlias(String alias) {
    return $LocalSessionTable(attachedDatabase, alias);
  }

  static TypeConverter<Address, String> $converteraddress = AddressConvertor();
  static TypeConverter<Address?, String?> $converteraddressn =
      NullAwareTypeConverter.wrap($converteraddress);
  static JsonTypeConverter2<ThemeMode, int, int> $convertertheme =
      const EnumIndexConverter<ThemeMode>(ThemeMode.values);
  static TypeConverter<TextScaleFactor, String> $converterfontSize =
      TextScaleFactorConvertor();
  static JsonTypeConverter2<RatingReminder, int, int> $converterratingReminder =
      const EnumIndexConverter<RatingReminder>(RatingReminder.values);
  static JsonTypeConverter2<RatingReminder?, int?, int?>
      $converterratingRemindern =
      JsonTypeConverter2.asNullable($converterratingReminder);
  static JsonTypeConverter2<NotificationPreference, int, int>
      $converternotificationPreference =
      const EnumIndexConverter<NotificationPreference>(
          NotificationPreference.values);
  static JsonTypeConverter2<PermissionStatus, int, int>
      $converternotificationPermission =
      const EnumIndexConverter<PermissionStatus>(PermissionStatus.values);
  static JsonTypeConverter2<PermissionStatus?, int?, int?>
      $converternotificationPermissionn =
      JsonTypeConverter2.asNullable($converternotificationPermission);
}

class LocalSessionData extends DataClass
    implements Insertable<LocalSessionData> {
  final String userId;
  final String languageCode;
  final String token;
  final String? appVersion;
  final String? fcmToken;
  final String? lastFatchedThreadId;
  final Address? address;
  final ThemeMode theme;
  final TextScaleFactor fontSize;
  final RatingReminder? ratingReminder;
  final DateTime? lastAskedRating;
  final DateTime? lastRequestTime;
  final DateTime? lastCategoryRequestTime;
  final int manualRefressCount;
  final NotificationPreference notificationPreference;
  final PermissionStatus? notificationPermission;
  final int notificationPermissionAlertShownCount;
  final bool hideNewsOption;
  final bool hideDoubts;
  const LocalSessionData(
      {required this.userId,
      required this.languageCode,
      required this.token,
      this.appVersion,
      this.fcmToken,
      this.lastFatchedThreadId,
      this.address,
      required this.theme,
      required this.fontSize,
      this.ratingReminder,
      this.lastAskedRating,
      this.lastRequestTime,
      this.lastCategoryRequestTime,
      required this.manualRefressCount,
      required this.notificationPreference,
      this.notificationPermission,
      required this.notificationPermissionAlertShownCount,
      required this.hideNewsOption,
      required this.hideDoubts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['language_code'] = Variable<String>(languageCode);
    map['token'] = Variable<String>(token);
    if (!nullToAbsent || appVersion != null) {
      map['app_version'] = Variable<String>(appVersion);
    }
    if (!nullToAbsent || fcmToken != null) {
      map['fcm_token'] = Variable<String>(fcmToken);
    }
    if (!nullToAbsent || lastFatchedThreadId != null) {
      map['last_fatched_thread_id'] = Variable<String>(lastFatchedThreadId);
    }
    if (!nullToAbsent || address != null) {
      final converter = $LocalSessionTable.$converteraddressn;
      map['address'] = Variable<String>(converter.toSql(address));
    }
    {
      final converter = $LocalSessionTable.$convertertheme;
      map['theme'] = Variable<int>(converter.toSql(theme));
    }
    {
      final converter = $LocalSessionTable.$converterfontSize;
      map['font_size'] = Variable<String>(converter.toSql(fontSize));
    }
    if (!nullToAbsent || ratingReminder != null) {
      final converter = $LocalSessionTable.$converterratingRemindern;
      map['rating_reminder'] = Variable<int>(converter.toSql(ratingReminder));
    }
    if (!nullToAbsent || lastAskedRating != null) {
      map['last_asked_rating'] = Variable<DateTime>(lastAskedRating);
    }
    if (!nullToAbsent || lastRequestTime != null) {
      map['last_request_time'] = Variable<DateTime>(lastRequestTime);
    }
    if (!nullToAbsent || lastCategoryRequestTime != null) {
      map['last_category_request_time'] =
          Variable<DateTime>(lastCategoryRequestTime);
    }
    map['manual_refress_count'] = Variable<int>(manualRefressCount);
    {
      final converter = $LocalSessionTable.$converternotificationPreference;
      map['notification_preference'] =
          Variable<int>(converter.toSql(notificationPreference));
    }
    if (!nullToAbsent || notificationPermission != null) {
      final converter = $LocalSessionTable.$converternotificationPermissionn;
      map['notification_permission'] =
          Variable<int>(converter.toSql(notificationPermission));
    }
    map['notification_permission_alert_shown_count'] =
        Variable<int>(notificationPermissionAlertShownCount);
    map['hide_news_option'] = Variable<bool>(hideNewsOption);
    map['hide_doubts'] = Variable<bool>(hideDoubts);
    return map;
  }

  LocalSessionCompanion toCompanion(bool nullToAbsent) {
    return LocalSessionCompanion(
      userId: Value(userId),
      languageCode: Value(languageCode),
      token: Value(token),
      appVersion: appVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(appVersion),
      fcmToken: fcmToken == null && nullToAbsent
          ? const Value.absent()
          : Value(fcmToken),
      lastFatchedThreadId: lastFatchedThreadId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastFatchedThreadId),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      theme: Value(theme),
      fontSize: Value(fontSize),
      ratingReminder: ratingReminder == null && nullToAbsent
          ? const Value.absent()
          : Value(ratingReminder),
      lastAskedRating: lastAskedRating == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAskedRating),
      lastRequestTime: lastRequestTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRequestTime),
      lastCategoryRequestTime: lastCategoryRequestTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCategoryRequestTime),
      manualRefressCount: Value(manualRefressCount),
      notificationPreference: Value(notificationPreference),
      notificationPermission: notificationPermission == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationPermission),
      notificationPermissionAlertShownCount:
          Value(notificationPermissionAlertShownCount),
      hideNewsOption: Value(hideNewsOption),
      hideDoubts: Value(hideDoubts),
    );
  }

  factory LocalSessionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSessionData(
      userId: serializer.fromJson<String>(json['userId']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      token: serializer.fromJson<String>(json['token']),
      appVersion: serializer.fromJson<String?>(json['appVersion']),
      fcmToken: serializer.fromJson<String?>(json['fcmToken']),
      lastFatchedThreadId:
          serializer.fromJson<String?>(json['lastFatchedThreadId']),
      address: serializer.fromJson<Address?>(json['address']),
      theme: $LocalSessionTable.$convertertheme
          .fromJson(serializer.fromJson<int>(json['theme'])),
      fontSize: serializer.fromJson<TextScaleFactor>(json['fontSize']),
      ratingReminder: $LocalSessionTable.$converterratingRemindern
          .fromJson(serializer.fromJson<int?>(json['ratingReminder'])),
      lastAskedRating: serializer.fromJson<DateTime?>(json['lastAskedRating']),
      lastRequestTime: serializer.fromJson<DateTime?>(json['lastRequestTime']),
      lastCategoryRequestTime:
          serializer.fromJson<DateTime?>(json['lastCategoryRequestTime']),
      manualRefressCount: serializer.fromJson<int>(json['manualRefressCount']),
      notificationPreference: $LocalSessionTable
          .$converternotificationPreference
          .fromJson(serializer.fromJson<int>(json['notificationPreference'])),
      notificationPermission: $LocalSessionTable
          .$converternotificationPermissionn
          .fromJson(serializer.fromJson<int?>(json['notificationPermission'])),
      notificationPermissionAlertShownCount: serializer
          .fromJson<int>(json['notificationPermissionAlertShownCount']),
      hideNewsOption: serializer.fromJson<bool>(json['hideNewsOption']),
      hideDoubts: serializer.fromJson<bool>(json['hideDoubts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'languageCode': serializer.toJson<String>(languageCode),
      'token': serializer.toJson<String>(token),
      'appVersion': serializer.toJson<String?>(appVersion),
      'fcmToken': serializer.toJson<String?>(fcmToken),
      'lastFatchedThreadId': serializer.toJson<String?>(lastFatchedThreadId),
      'address': serializer.toJson<Address?>(address),
      'theme': serializer
          .toJson<int>($LocalSessionTable.$convertertheme.toJson(theme)),
      'fontSize': serializer.toJson<TextScaleFactor>(fontSize),
      'ratingReminder': serializer.toJson<int?>(
          $LocalSessionTable.$converterratingRemindern.toJson(ratingReminder)),
      'lastAskedRating': serializer.toJson<DateTime?>(lastAskedRating),
      'lastRequestTime': serializer.toJson<DateTime?>(lastRequestTime),
      'lastCategoryRequestTime':
          serializer.toJson<DateTime?>(lastCategoryRequestTime),
      'manualRefressCount': serializer.toJson<int>(manualRefressCount),
      'notificationPreference': serializer.toJson<int>($LocalSessionTable
          .$converternotificationPreference
          .toJson(notificationPreference)),
      'notificationPermission': serializer.toJson<int?>($LocalSessionTable
          .$converternotificationPermissionn
          .toJson(notificationPermission)),
      'notificationPermissionAlertShownCount':
          serializer.toJson<int>(notificationPermissionAlertShownCount),
      'hideNewsOption': serializer.toJson<bool>(hideNewsOption),
      'hideDoubts': serializer.toJson<bool>(hideDoubts),
    };
  }

  LocalSessionData copyWith(
          {String? userId,
          String? languageCode,
          String? token,
          Value<String?> appVersion = const Value.absent(),
          Value<String?> fcmToken = const Value.absent(),
          Value<String?> lastFatchedThreadId = const Value.absent(),
          Value<Address?> address = const Value.absent(),
          ThemeMode? theme,
          TextScaleFactor? fontSize,
          Value<RatingReminder?> ratingReminder = const Value.absent(),
          Value<DateTime?> lastAskedRating = const Value.absent(),
          Value<DateTime?> lastRequestTime = const Value.absent(),
          Value<DateTime?> lastCategoryRequestTime = const Value.absent(),
          int? manualRefressCount,
          NotificationPreference? notificationPreference,
          Value<PermissionStatus?> notificationPermission =
              const Value.absent(),
          int? notificationPermissionAlertShownCount,
          bool? hideNewsOption,
          bool? hideDoubts}) =>
      LocalSessionData(
        userId: userId ?? this.userId,
        languageCode: languageCode ?? this.languageCode,
        token: token ?? this.token,
        appVersion: appVersion.present ? appVersion.value : this.appVersion,
        fcmToken: fcmToken.present ? fcmToken.value : this.fcmToken,
        lastFatchedThreadId: lastFatchedThreadId.present
            ? lastFatchedThreadId.value
            : this.lastFatchedThreadId,
        address: address.present ? address.value : this.address,
        theme: theme ?? this.theme,
        fontSize: fontSize ?? this.fontSize,
        ratingReminder:
            ratingReminder.present ? ratingReminder.value : this.ratingReminder,
        lastAskedRating: lastAskedRating.present
            ? lastAskedRating.value
            : this.lastAskedRating,
        lastRequestTime: lastRequestTime.present
            ? lastRequestTime.value
            : this.lastRequestTime,
        lastCategoryRequestTime: lastCategoryRequestTime.present
            ? lastCategoryRequestTime.value
            : this.lastCategoryRequestTime,
        manualRefressCount: manualRefressCount ?? this.manualRefressCount,
        notificationPreference:
            notificationPreference ?? this.notificationPreference,
        notificationPermission: notificationPermission.present
            ? notificationPermission.value
            : this.notificationPermission,
        notificationPermissionAlertShownCount:
            notificationPermissionAlertShownCount ??
                this.notificationPermissionAlertShownCount,
        hideNewsOption: hideNewsOption ?? this.hideNewsOption,
        hideDoubts: hideDoubts ?? this.hideDoubts,
      );
  @override
  String toString() {
    return (StringBuffer('LocalSessionData(')
          ..write('userId: $userId, ')
          ..write('languageCode: $languageCode, ')
          ..write('token: $token, ')
          ..write('appVersion: $appVersion, ')
          ..write('fcmToken: $fcmToken, ')
          ..write('lastFatchedThreadId: $lastFatchedThreadId, ')
          ..write('address: $address, ')
          ..write('theme: $theme, ')
          ..write('fontSize: $fontSize, ')
          ..write('ratingReminder: $ratingReminder, ')
          ..write('lastAskedRating: $lastAskedRating, ')
          ..write('lastRequestTime: $lastRequestTime, ')
          ..write('lastCategoryRequestTime: $lastCategoryRequestTime, ')
          ..write('manualRefressCount: $manualRefressCount, ')
          ..write('notificationPreference: $notificationPreference, ')
          ..write('notificationPermission: $notificationPermission, ')
          ..write(
              'notificationPermissionAlertShownCount: $notificationPermissionAlertShownCount, ')
          ..write('hideNewsOption: $hideNewsOption, ')
          ..write('hideDoubts: $hideDoubts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      languageCode,
      token,
      appVersion,
      fcmToken,
      lastFatchedThreadId,
      address,
      theme,
      fontSize,
      ratingReminder,
      lastAskedRating,
      lastRequestTime,
      lastCategoryRequestTime,
      manualRefressCount,
      notificationPreference,
      notificationPermission,
      notificationPermissionAlertShownCount,
      hideNewsOption,
      hideDoubts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSessionData &&
          other.userId == this.userId &&
          other.languageCode == this.languageCode &&
          other.token == this.token &&
          other.appVersion == this.appVersion &&
          other.fcmToken == this.fcmToken &&
          other.lastFatchedThreadId == this.lastFatchedThreadId &&
          other.address == this.address &&
          other.theme == this.theme &&
          other.fontSize == this.fontSize &&
          other.ratingReminder == this.ratingReminder &&
          other.lastAskedRating == this.lastAskedRating &&
          other.lastRequestTime == this.lastRequestTime &&
          other.lastCategoryRequestTime == this.lastCategoryRequestTime &&
          other.manualRefressCount == this.manualRefressCount &&
          other.notificationPreference == this.notificationPreference &&
          other.notificationPermission == this.notificationPermission &&
          other.notificationPermissionAlertShownCount ==
              this.notificationPermissionAlertShownCount &&
          other.hideNewsOption == this.hideNewsOption &&
          other.hideDoubts == this.hideDoubts);
}

class LocalSessionCompanion extends UpdateCompanion<LocalSessionData> {
  final Value<String> userId;
  final Value<String> languageCode;
  final Value<String> token;
  final Value<String?> appVersion;
  final Value<String?> fcmToken;
  final Value<String?> lastFatchedThreadId;
  final Value<Address?> address;
  final Value<ThemeMode> theme;
  final Value<TextScaleFactor> fontSize;
  final Value<RatingReminder?> ratingReminder;
  final Value<DateTime?> lastAskedRating;
  final Value<DateTime?> lastRequestTime;
  final Value<DateTime?> lastCategoryRequestTime;
  final Value<int> manualRefressCount;
  final Value<NotificationPreference> notificationPreference;
  final Value<PermissionStatus?> notificationPermission;
  final Value<int> notificationPermissionAlertShownCount;
  final Value<bool> hideNewsOption;
  final Value<bool> hideDoubts;
  final Value<int> rowid;
  const LocalSessionCompanion({
    this.userId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.token = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.fcmToken = const Value.absent(),
    this.lastFatchedThreadId = const Value.absent(),
    this.address = const Value.absent(),
    this.theme = const Value.absent(),
    this.fontSize = const Value.absent(),
    this.ratingReminder = const Value.absent(),
    this.lastAskedRating = const Value.absent(),
    this.lastRequestTime = const Value.absent(),
    this.lastCategoryRequestTime = const Value.absent(),
    this.manualRefressCount = const Value.absent(),
    this.notificationPreference = const Value.absent(),
    this.notificationPermission = const Value.absent(),
    this.notificationPermissionAlertShownCount = const Value.absent(),
    this.hideNewsOption = const Value.absent(),
    this.hideDoubts = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalSessionCompanion.insert({
    required String userId,
    this.languageCode = const Value.absent(),
    required String token,
    this.appVersion = const Value.absent(),
    this.fcmToken = const Value.absent(),
    this.lastFatchedThreadId = const Value.absent(),
    this.address = const Value.absent(),
    required ThemeMode theme,
    required TextScaleFactor fontSize,
    this.ratingReminder = const Value.absent(),
    this.lastAskedRating = const Value.absent(),
    this.lastRequestTime = const Value.absent(),
    this.lastCategoryRequestTime = const Value.absent(),
    this.manualRefressCount = const Value.absent(),
    this.notificationPreference = const Value.absent(),
    this.notificationPermission = const Value.absent(),
    this.notificationPermissionAlertShownCount = const Value.absent(),
    this.hideNewsOption = const Value.absent(),
    this.hideDoubts = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        token = Value(token),
        theme = Value(theme),
        fontSize = Value(fontSize);
  static Insertable<LocalSessionData> custom({
    Expression<String>? userId,
    Expression<String>? languageCode,
    Expression<String>? token,
    Expression<String>? appVersion,
    Expression<String>? fcmToken,
    Expression<String>? lastFatchedThreadId,
    Expression<String>? address,
    Expression<int>? theme,
    Expression<String>? fontSize,
    Expression<int>? ratingReminder,
    Expression<DateTime>? lastAskedRating,
    Expression<DateTime>? lastRequestTime,
    Expression<DateTime>? lastCategoryRequestTime,
    Expression<int>? manualRefressCount,
    Expression<int>? notificationPreference,
    Expression<int>? notificationPermission,
    Expression<int>? notificationPermissionAlertShownCount,
    Expression<bool>? hideNewsOption,
    Expression<bool>? hideDoubts,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (languageCode != null) 'language_code': languageCode,
      if (token != null) 'token': token,
      if (appVersion != null) 'app_version': appVersion,
      if (fcmToken != null) 'fcm_token': fcmToken,
      if (lastFatchedThreadId != null)
        'last_fatched_thread_id': lastFatchedThreadId,
      if (address != null) 'address': address,
      if (theme != null) 'theme': theme,
      if (fontSize != null) 'font_size': fontSize,
      if (ratingReminder != null) 'rating_reminder': ratingReminder,
      if (lastAskedRating != null) 'last_asked_rating': lastAskedRating,
      if (lastRequestTime != null) 'last_request_time': lastRequestTime,
      if (lastCategoryRequestTime != null)
        'last_category_request_time': lastCategoryRequestTime,
      if (manualRefressCount != null)
        'manual_refress_count': manualRefressCount,
      if (notificationPreference != null)
        'notification_preference': notificationPreference,
      if (notificationPermission != null)
        'notification_permission': notificationPermission,
      if (notificationPermissionAlertShownCount != null)
        'notification_permission_alert_shown_count':
            notificationPermissionAlertShownCount,
      if (hideNewsOption != null) 'hide_news_option': hideNewsOption,
      if (hideDoubts != null) 'hide_doubts': hideDoubts,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalSessionCompanion copyWith(
      {Value<String>? userId,
      Value<String>? languageCode,
      Value<String>? token,
      Value<String?>? appVersion,
      Value<String?>? fcmToken,
      Value<String?>? lastFatchedThreadId,
      Value<Address?>? address,
      Value<ThemeMode>? theme,
      Value<TextScaleFactor>? fontSize,
      Value<RatingReminder?>? ratingReminder,
      Value<DateTime?>? lastAskedRating,
      Value<DateTime?>? lastRequestTime,
      Value<DateTime?>? lastCategoryRequestTime,
      Value<int>? manualRefressCount,
      Value<NotificationPreference>? notificationPreference,
      Value<PermissionStatus?>? notificationPermission,
      Value<int>? notificationPermissionAlertShownCount,
      Value<bool>? hideNewsOption,
      Value<bool>? hideDoubts,
      Value<int>? rowid}) {
    return LocalSessionCompanion(
      userId: userId ?? this.userId,
      languageCode: languageCode ?? this.languageCode,
      token: token ?? this.token,
      appVersion: appVersion ?? this.appVersion,
      fcmToken: fcmToken ?? this.fcmToken,
      lastFatchedThreadId: lastFatchedThreadId ?? this.lastFatchedThreadId,
      address: address ?? this.address,
      theme: theme ?? this.theme,
      fontSize: fontSize ?? this.fontSize,
      ratingReminder: ratingReminder ?? this.ratingReminder,
      lastAskedRating: lastAskedRating ?? this.lastAskedRating,
      lastRequestTime: lastRequestTime ?? this.lastRequestTime,
      lastCategoryRequestTime:
          lastCategoryRequestTime ?? this.lastCategoryRequestTime,
      manualRefressCount: manualRefressCount ?? this.manualRefressCount,
      notificationPreference:
          notificationPreference ?? this.notificationPreference,
      notificationPermission:
          notificationPermission ?? this.notificationPermission,
      notificationPermissionAlertShownCount:
          notificationPermissionAlertShownCount ??
              this.notificationPermissionAlertShownCount,
      hideNewsOption: hideNewsOption ?? this.hideNewsOption,
      hideDoubts: hideDoubts ?? this.hideDoubts,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    if (fcmToken.present) {
      map['fcm_token'] = Variable<String>(fcmToken.value);
    }
    if (lastFatchedThreadId.present) {
      map['last_fatched_thread_id'] =
          Variable<String>(lastFatchedThreadId.value);
    }
    if (address.present) {
      final converter = $LocalSessionTable.$converteraddressn;

      map['address'] = Variable<String>(converter.toSql(address.value));
    }
    if (theme.present) {
      final converter = $LocalSessionTable.$convertertheme;

      map['theme'] = Variable<int>(converter.toSql(theme.value));
    }
    if (fontSize.present) {
      final converter = $LocalSessionTable.$converterfontSize;

      map['font_size'] = Variable<String>(converter.toSql(fontSize.value));
    }
    if (ratingReminder.present) {
      final converter = $LocalSessionTable.$converterratingRemindern;

      map['rating_reminder'] =
          Variable<int>(converter.toSql(ratingReminder.value));
    }
    if (lastAskedRating.present) {
      map['last_asked_rating'] = Variable<DateTime>(lastAskedRating.value);
    }
    if (lastRequestTime.present) {
      map['last_request_time'] = Variable<DateTime>(lastRequestTime.value);
    }
    if (lastCategoryRequestTime.present) {
      map['last_category_request_time'] =
          Variable<DateTime>(lastCategoryRequestTime.value);
    }
    if (manualRefressCount.present) {
      map['manual_refress_count'] = Variable<int>(manualRefressCount.value);
    }
    if (notificationPreference.present) {
      final converter = $LocalSessionTable.$converternotificationPreference;

      map['notification_preference'] =
          Variable<int>(converter.toSql(notificationPreference.value));
    }
    if (notificationPermission.present) {
      final converter = $LocalSessionTable.$converternotificationPermissionn;

      map['notification_permission'] =
          Variable<int>(converter.toSql(notificationPermission.value));
    }
    if (notificationPermissionAlertShownCount.present) {
      map['notification_permission_alert_shown_count'] =
          Variable<int>(notificationPermissionAlertShownCount.value);
    }
    if (hideNewsOption.present) {
      map['hide_news_option'] = Variable<bool>(hideNewsOption.value);
    }
    if (hideDoubts.present) {
      map['hide_doubts'] = Variable<bool>(hideDoubts.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSessionCompanion(')
          ..write('userId: $userId, ')
          ..write('languageCode: $languageCode, ')
          ..write('token: $token, ')
          ..write('appVersion: $appVersion, ')
          ..write('fcmToken: $fcmToken, ')
          ..write('lastFatchedThreadId: $lastFatchedThreadId, ')
          ..write('address: $address, ')
          ..write('theme: $theme, ')
          ..write('fontSize: $fontSize, ')
          ..write('ratingReminder: $ratingReminder, ')
          ..write('lastAskedRating: $lastAskedRating, ')
          ..write('lastRequestTime: $lastRequestTime, ')
          ..write('lastCategoryRequestTime: $lastCategoryRequestTime, ')
          ..write('manualRefressCount: $manualRefressCount, ')
          ..write('notificationPreference: $notificationPreference, ')
          ..write('notificationPermission: $notificationPermission, ')
          ..write(
              'notificationPermissionAlertShownCount: $notificationPermissionAlertShownCount, ')
          ..write('hideNewsOption: $hideNewsOption, ')
          ..write('hideDoubts: $hideDoubts, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NewsLogsTable extends NewsLogs with TableInfo<$NewsLogsTable, NewsLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _pollAnswerMeta =
      const VerificationMeta('pollAnswer');
  @override
  late final GeneratedColumn<String> pollAnswer = GeneratedColumn<String>(
      'poll_answer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _durationWatchedMeta =
      const VerificationMeta('durationWatched');
  @override
  late final GeneratedColumn<int> durationWatched = GeneratedColumn<int>(
      'duration_watched', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Variable(0));
  static const VerificationMeta _isNewsMeta = const VerificationMeta('isNews');
  @override
  late final GeneratedColumn<bool> isNews = GeneratedColumn<bool>(
      'is_news', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_news" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [newsId, pollAnswer, createdAt, updatedAt, durationWatched, isNews];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_logs';
  @override
  VerificationContext validateIntegrity(Insertable<NewsLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('poll_answer')) {
      context.handle(
          _pollAnswerMeta,
          pollAnswer.isAcceptableOrUnknown(
              data['poll_answer']!, _pollAnswerMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('duration_watched')) {
      context.handle(
          _durationWatchedMeta,
          durationWatched.isAcceptableOrUnknown(
              data['duration_watched']!, _durationWatchedMeta));
    }
    if (data.containsKey('is_news')) {
      context.handle(_isNewsMeta,
          isNews.isAcceptableOrUnknown(data['is_news']!, _isNewsMeta));
    } else if (isInserting) {
      context.missing(_isNewsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  NewsLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsLog(
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      pollAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poll_answer']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      durationWatched: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_watched'])!,
      isNews: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_news'])!,
    );
  }

  @override
  $NewsLogsTable createAlias(String alias) {
    return $NewsLogsTable(attachedDatabase, alias);
  }
}

class NewsLog extends DataClass implements Insertable<NewsLog> {
  final String newsId;
  final String? pollAnswer;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int durationWatched;
  final bool isNews;
  const NewsLog(
      {required this.newsId,
      this.pollAnswer,
      required this.createdAt,
      required this.updatedAt,
      required this.durationWatched,
      required this.isNews});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_id'] = Variable<String>(newsId);
    if (!nullToAbsent || pollAnswer != null) {
      map['poll_answer'] = Variable<String>(pollAnswer);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['duration_watched'] = Variable<int>(durationWatched);
    map['is_news'] = Variable<bool>(isNews);
    return map;
  }

  NewsLogsCompanion toCompanion(bool nullToAbsent) {
    return NewsLogsCompanion(
      newsId: Value(newsId),
      pollAnswer: pollAnswer == null && nullToAbsent
          ? const Value.absent()
          : Value(pollAnswer),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      durationWatched: Value(durationWatched),
      isNews: Value(isNews),
    );
  }

  factory NewsLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsLog(
      newsId: serializer.fromJson<String>(json['newsId']),
      pollAnswer: serializer.fromJson<String?>(json['pollAnswer']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      durationWatched: serializer.fromJson<int>(json['durationWatched']),
      isNews: serializer.fromJson<bool>(json['isNews']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsId': serializer.toJson<String>(newsId),
      'pollAnswer': serializer.toJson<String?>(pollAnswer),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'durationWatched': serializer.toJson<int>(durationWatched),
      'isNews': serializer.toJson<bool>(isNews),
    };
  }

  NewsLog copyWith(
          {String? newsId,
          Value<String?> pollAnswer = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? durationWatched,
          bool? isNews}) =>
      NewsLog(
        newsId: newsId ?? this.newsId,
        pollAnswer: pollAnswer.present ? pollAnswer.value : this.pollAnswer,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        durationWatched: durationWatched ?? this.durationWatched,
        isNews: isNews ?? this.isNews,
      );
  @override
  String toString() {
    return (StringBuffer('NewsLog(')
          ..write('newsId: $newsId, ')
          ..write('pollAnswer: $pollAnswer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('durationWatched: $durationWatched, ')
          ..write('isNews: $isNews')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      newsId, pollAnswer, createdAt, updatedAt, durationWatched, isNews);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsLog &&
          other.newsId == this.newsId &&
          other.pollAnswer == this.pollAnswer &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.durationWatched == this.durationWatched &&
          other.isNews == this.isNews);
}

class NewsLogsCompanion extends UpdateCompanion<NewsLog> {
  final Value<String> newsId;
  final Value<String?> pollAnswer;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> durationWatched;
  final Value<bool> isNews;
  final Value<int> rowid;
  const NewsLogsCompanion({
    this.newsId = const Value.absent(),
    this.pollAnswer = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.durationWatched = const Value.absent(),
    this.isNews = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsLogsCompanion.insert({
    required String newsId,
    this.pollAnswer = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.durationWatched = const Value.absent(),
    required bool isNews,
    this.rowid = const Value.absent(),
  })  : newsId = Value(newsId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        isNews = Value(isNews);
  static Insertable<NewsLog> custom({
    Expression<String>? newsId,
    Expression<String>? pollAnswer,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? durationWatched,
    Expression<bool>? isNews,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (newsId != null) 'news_id': newsId,
      if (pollAnswer != null) 'poll_answer': pollAnswer,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (durationWatched != null) 'duration_watched': durationWatched,
      if (isNews != null) 'is_news': isNews,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsLogsCompanion copyWith(
      {Value<String>? newsId,
      Value<String?>? pollAnswer,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? durationWatched,
      Value<bool>? isNews,
      Value<int>? rowid}) {
    return NewsLogsCompanion(
      newsId: newsId ?? this.newsId,
      pollAnswer: pollAnswer ?? this.pollAnswer,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      durationWatched: durationWatched ?? this.durationWatched,
      isNews: isNews ?? this.isNews,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (pollAnswer.present) {
      map['poll_answer'] = Variable<String>(pollAnswer.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (durationWatched.present) {
      map['duration_watched'] = Variable<int>(durationWatched.value);
    }
    if (isNews.present) {
      map['is_news'] = Variable<bool>(isNews.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsLogsCompanion(')
          ..write('newsId: $newsId, ')
          ..write('pollAnswer: $pollAnswer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('durationWatched: $durationWatched, ')
          ..write('isNews: $isNews, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnreadNewsTable extends UnreadNews
    with TableInfo<$UnreadNewsTable, UnreadNew> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnreadNewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category?, String> category =
      GeneratedColumn<String>('category', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Category?>($UnreadNewsTable.$convertercategoryn);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedOnMeta =
      const VerificationMeta('publishedOn');
  @override
  late final GeneratedColumn<DateTime> publishedOn = GeneratedColumn<DateTime>(
      'published_on', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($UnreadNewsTable.$convertertags);
  static const VerificationMeta _faqMeta = const VerificationMeta('faq');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsFaq>, String> faq =
      GeneratedColumn<String>('faq', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<NewsFaq>>($UnreadNewsTable.$converterfaq);
  static const VerificationMeta _pollMeta = const VerificationMeta('poll');
  @override
  late final GeneratedColumnWithTypeConverter<Poll?, String> poll =
      GeneratedColumn<String>('poll', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Poll?>($UnreadNewsTable.$converterpolln);
  static const VerificationMeta _doubtsMeta = const VerificationMeta('doubts');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsDoubts>?, String>
      doubts = GeneratedColumn<String>('doubts', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<NewsDoubts>?>($UnreadNewsTable.$converterdoubtsn);
  static const VerificationMeta _sectionsMeta =
      const VerificationMeta('sections');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsSection>?, String>
      sections = GeneratedColumn<String>('sections', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<NewsSection>?>(
              $UnreadNewsTable.$convertersectionsn);
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _formattedDescriptionMeta =
      const VerificationMeta('formattedDescription');
  @override
  late final GeneratedColumn<String> formattedDescription =
      GeneratedColumn<String>('formatted_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumnWithTypeConverter<Source?, String> source =
      GeneratedColumn<String>('source', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Source?>($UnreadNewsTable.$convertersourcen);
  static const VerificationMeta _pollApprovedMeta =
      const VerificationMeta('pollApproved');
  @override
  late final GeneratedColumn<bool> pollApproved = GeneratedColumn<bool>(
      'poll_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("poll_approved" IN (0, 1))'));
  static const VerificationMeta _quizApprovedMeta =
      const VerificationMeta('quizApproved');
  @override
  late final GeneratedColumn<bool> quizApproved = GeneratedColumn<bool>(
      'quiz_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("quiz_approved" IN (0, 1))'));
  static const VerificationMeta _faqApprovedMeta =
      const VerificationMeta('faqApproved');
  @override
  late final GeneratedColumn<bool> faqApproved = GeneratedColumn<bool>(
      'faq_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("faq_approved" IN (0, 1))'));
  static const VerificationMeta _notificationTitleMeta =
      const VerificationMeta('notificationTitle');
  @override
  late final GeneratedColumn<String> notificationTitle =
      GeneratedColumn<String>('notification_title', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _xUrlMeta = const VerificationMeta('xUrl');
  @override
  late final GeneratedColumn<String> xUrl = GeneratedColumn<String>(
      'x_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        newsId,
        title,
        description,
        category,
        language,
        url,
        urlToImage,
        priority,
        publishedOn,
        createdAt,
        updatedAt,
        tags,
        faq,
        poll,
        doubts,
        sections,
        originalTitle,
        formattedDescription,
        source,
        pollApproved,
        quizApproved,
        faqApproved,
        notificationTitle,
        xUrl
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unread_news';
  @override
  VerificationContext validateIntegrity(Insertable<UnreadNew> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_categoryMeta, const VerificationResult.success());
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('published_on')) {
      context.handle(
          _publishedOnMeta,
          publishedOn.isAcceptableOrUnknown(
              data['published_on']!, _publishedOnMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_faqMeta, const VerificationResult.success());
    context.handle(_pollMeta, const VerificationResult.success());
    context.handle(_doubtsMeta, const VerificationResult.success());
    context.handle(_sectionsMeta, const VerificationResult.success());
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('formatted_description')) {
      context.handle(
          _formattedDescriptionMeta,
          formattedDescription.isAcceptableOrUnknown(
              data['formatted_description']!, _formattedDescriptionMeta));
    }
    context.handle(_sourceMeta, const VerificationResult.success());
    if (data.containsKey('poll_approved')) {
      context.handle(
          _pollApprovedMeta,
          pollApproved.isAcceptableOrUnknown(
              data['poll_approved']!, _pollApprovedMeta));
    }
    if (data.containsKey('quiz_approved')) {
      context.handle(
          _quizApprovedMeta,
          quizApproved.isAcceptableOrUnknown(
              data['quiz_approved']!, _quizApprovedMeta));
    }
    if (data.containsKey('faq_approved')) {
      context.handle(
          _faqApprovedMeta,
          faqApproved.isAcceptableOrUnknown(
              data['faq_approved']!, _faqApprovedMeta));
    }
    if (data.containsKey('notification_title')) {
      context.handle(
          _notificationTitleMeta,
          notificationTitle.isAcceptableOrUnknown(
              data['notification_title']!, _notificationTitleMeta));
    }
    if (data.containsKey('x_url')) {
      context.handle(
          _xUrlMeta, xUrl.isAcceptableOrUnknown(data['x_url']!, _xUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UnreadNew map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnreadNew(
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: $UnreadNewsTable.$convertercategoryn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority']),
      publishedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_on']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      tags: $UnreadNewsTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      faq: $UnreadNewsTable.$converterfaq.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faq'])!),
      poll: $UnreadNewsTable.$converterpolln.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poll'])),
      doubts: $UnreadNewsTable.$converterdoubtsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doubts'])),
      sections: $UnreadNewsTable.$convertersectionsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sections'])),
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title']),
      formattedDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}formatted_description']),
      source: $UnreadNewsTable.$convertersourcen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])),
      pollApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}poll_approved']),
      quizApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}quiz_approved']),
      faqApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}faq_approved']),
      notificationTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}notification_title']),
      xUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}x_url']),
    );
  }

  @override
  $UnreadNewsTable createAlias(String alias) {
    return $UnreadNewsTable(attachedDatabase, alias);
  }

  static TypeConverter<Category, String> $convertercategory =
      CategoryConvertor();
  static TypeConverter<Category?, String?> $convertercategoryn =
      NullAwareTypeConverter.wrap($convertercategory);
  static TypeConverter<List<String>, String> $convertertags =
      StringListConvertor();
  static TypeConverter<List<NewsFaq>, String> $converterfaq =
      FaqListConvertor();
  static TypeConverter<Poll, String> $converterpoll = PollConvertor();
  static TypeConverter<Poll?, String?> $converterpolln =
      NullAwareTypeConverter.wrap($converterpoll);
  static TypeConverter<List<NewsDoubts>, String> $converterdoubts =
      GenericListConvertor(
          fromJson: (json) => NewsDoubts.fromJson(json),
          toJson: (fact) => fact.toJson());
  static TypeConverter<List<NewsDoubts>?, String?> $converterdoubtsn =
      NullAwareTypeConverter.wrap($converterdoubts);
  static TypeConverter<List<NewsSection>, String> $convertersections =
      GenericListConvertor(
          fromJson: (json) => NewsSection.fromJson(json),
          toJson: (section) => section.toJson());
  static TypeConverter<List<NewsSection>?, String?> $convertersectionsn =
      NullAwareTypeConverter.wrap($convertersections);
  static TypeConverter<Source, String> $convertersource = GenericConvertor(
      fromJson: (json) => Source.fromJson(json),
      toJson: (fact) => fact.toJson());
  static TypeConverter<Source?, String?> $convertersourcen =
      NullAwareTypeConverter.wrap($convertersource);
}

class UnreadNew extends DataClass implements Insertable<UnreadNew> {
  final String newsId;
  final String title;
  final String description;
  final Category? category;
  final String? language;
  final String? url;
  final String? urlToImage;
  final String? priority;
  final DateTime? publishedOn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String> tags;
  final List<NewsFaq> faq;
  final Poll? poll;
  final List<NewsDoubts>? doubts;
  final List<NewsSection>? sections;
  final String? originalTitle;
  final String? formattedDescription;
  final Source? source;
  final bool? pollApproved;
  final bool? quizApproved;
  final bool? faqApproved;
  final String? notificationTitle;
  final String? xUrl;
  const UnreadNew(
      {required this.newsId,
      required this.title,
      required this.description,
      this.category,
      this.language,
      this.url,
      this.urlToImage,
      this.priority,
      this.publishedOn,
      this.createdAt,
      this.updatedAt,
      required this.tags,
      required this.faq,
      this.poll,
      this.doubts,
      this.sections,
      this.originalTitle,
      this.formattedDescription,
      this.source,
      this.pollApproved,
      this.quizApproved,
      this.faqApproved,
      this.notificationTitle,
      this.xUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_id'] = Variable<String>(newsId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || category != null) {
      final converter = $UnreadNewsTable.$convertercategoryn;
      map['category'] = Variable<String>(converter.toSql(category));
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<String>(priority);
    }
    if (!nullToAbsent || publishedOn != null) {
      map['published_on'] = Variable<DateTime>(publishedOn);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    {
      final converter = $UnreadNewsTable.$convertertags;
      map['tags'] = Variable<String>(converter.toSql(tags));
    }
    {
      final converter = $UnreadNewsTable.$converterfaq;
      map['faq'] = Variable<String>(converter.toSql(faq));
    }
    if (!nullToAbsent || poll != null) {
      final converter = $UnreadNewsTable.$converterpolln;
      map['poll'] = Variable<String>(converter.toSql(poll));
    }
    if (!nullToAbsent || doubts != null) {
      final converter = $UnreadNewsTable.$converterdoubtsn;
      map['doubts'] = Variable<String>(converter.toSql(doubts));
    }
    if (!nullToAbsent || sections != null) {
      final converter = $UnreadNewsTable.$convertersectionsn;
      map['sections'] = Variable<String>(converter.toSql(sections));
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || formattedDescription != null) {
      map['formatted_description'] = Variable<String>(formattedDescription);
    }
    if (!nullToAbsent || source != null) {
      final converter = $UnreadNewsTable.$convertersourcen;
      map['source'] = Variable<String>(converter.toSql(source));
    }
    if (!nullToAbsent || pollApproved != null) {
      map['poll_approved'] = Variable<bool>(pollApproved);
    }
    if (!nullToAbsent || quizApproved != null) {
      map['quiz_approved'] = Variable<bool>(quizApproved);
    }
    if (!nullToAbsent || faqApproved != null) {
      map['faq_approved'] = Variable<bool>(faqApproved);
    }
    if (!nullToAbsent || notificationTitle != null) {
      map['notification_title'] = Variable<String>(notificationTitle);
    }
    if (!nullToAbsent || xUrl != null) {
      map['x_url'] = Variable<String>(xUrl);
    }
    return map;
  }

  UnreadNewsCompanion toCompanion(bool nullToAbsent) {
    return UnreadNewsCompanion(
      newsId: Value(newsId),
      title: Value(title),
      description: Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      publishedOn: publishedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedOn),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      tags: Value(tags),
      faq: Value(faq),
      poll: poll == null && nullToAbsent ? const Value.absent() : Value(poll),
      doubts:
          doubts == null && nullToAbsent ? const Value.absent() : Value(doubts),
      sections: sections == null && nullToAbsent
          ? const Value.absent()
          : Value(sections),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      formattedDescription: formattedDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(formattedDescription),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      pollApproved: pollApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(pollApproved),
      quizApproved: quizApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(quizApproved),
      faqApproved: faqApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(faqApproved),
      notificationTitle: notificationTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationTitle),
      xUrl: xUrl == null && nullToAbsent ? const Value.absent() : Value(xUrl),
    );
  }

  factory UnreadNew.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnreadNew(
      newsId: serializer.fromJson<String>(json['newsId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<Category?>(json['category']),
      language: serializer.fromJson<String?>(json['language']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      priority: serializer.fromJson<String?>(json['priority']),
      publishedOn: serializer.fromJson<DateTime?>(json['publishedOn']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      faq: serializer.fromJson<List<NewsFaq>>(json['faq']),
      poll: serializer.fromJson<Poll?>(json['poll']),
      doubts: serializer.fromJson<List<NewsDoubts>?>(json['doubts']),
      sections: serializer.fromJson<List<NewsSection>?>(json['sections']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      formattedDescription:
          serializer.fromJson<String?>(json['formattedDescription']),
      source: serializer.fromJson<Source?>(json['source']),
      pollApproved: serializer.fromJson<bool?>(json['pollApproved']),
      quizApproved: serializer.fromJson<bool?>(json['quizApproved']),
      faqApproved: serializer.fromJson<bool?>(json['faqApproved']),
      notificationTitle:
          serializer.fromJson<String?>(json['notificationTitle']),
      xUrl: serializer.fromJson<String?>(json['xUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsId': serializer.toJson<String>(newsId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<Category?>(category),
      'language': serializer.toJson<String?>(language),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'priority': serializer.toJson<String?>(priority),
      'publishedOn': serializer.toJson<DateTime?>(publishedOn),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'tags': serializer.toJson<List<String>>(tags),
      'faq': serializer.toJson<List<NewsFaq>>(faq),
      'poll': serializer.toJson<Poll?>(poll),
      'doubts': serializer.toJson<List<NewsDoubts>?>(doubts),
      'sections': serializer.toJson<List<NewsSection>?>(sections),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'formattedDescription': serializer.toJson<String?>(formattedDescription),
      'source': serializer.toJson<Source?>(source),
      'pollApproved': serializer.toJson<bool?>(pollApproved),
      'quizApproved': serializer.toJson<bool?>(quizApproved),
      'faqApproved': serializer.toJson<bool?>(faqApproved),
      'notificationTitle': serializer.toJson<String?>(notificationTitle),
      'xUrl': serializer.toJson<String?>(xUrl),
    };
  }

  UnreadNew copyWith(
          {String? newsId,
          String? title,
          String? description,
          Value<Category?> category = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> urlToImage = const Value.absent(),
          Value<String?> priority = const Value.absent(),
          Value<DateTime?> publishedOn = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          List<String>? tags,
          List<NewsFaq>? faq,
          Value<Poll?> poll = const Value.absent(),
          Value<List<NewsDoubts>?> doubts = const Value.absent(),
          Value<List<NewsSection>?> sections = const Value.absent(),
          Value<String?> originalTitle = const Value.absent(),
          Value<String?> formattedDescription = const Value.absent(),
          Value<Source?> source = const Value.absent(),
          Value<bool?> pollApproved = const Value.absent(),
          Value<bool?> quizApproved = const Value.absent(),
          Value<bool?> faqApproved = const Value.absent(),
          Value<String?> notificationTitle = const Value.absent(),
          Value<String?> xUrl = const Value.absent()}) =>
      UnreadNew(
        newsId: newsId ?? this.newsId,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category.present ? category.value : this.category,
        language: language.present ? language.value : this.language,
        url: url.present ? url.value : this.url,
        urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
        priority: priority.present ? priority.value : this.priority,
        publishedOn: publishedOn.present ? publishedOn.value : this.publishedOn,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        tags: tags ?? this.tags,
        faq: faq ?? this.faq,
        poll: poll.present ? poll.value : this.poll,
        doubts: doubts.present ? doubts.value : this.doubts,
        sections: sections.present ? sections.value : this.sections,
        originalTitle:
            originalTitle.present ? originalTitle.value : this.originalTitle,
        formattedDescription: formattedDescription.present
            ? formattedDescription.value
            : this.formattedDescription,
        source: source.present ? source.value : this.source,
        pollApproved:
            pollApproved.present ? pollApproved.value : this.pollApproved,
        quizApproved:
            quizApproved.present ? quizApproved.value : this.quizApproved,
        faqApproved: faqApproved.present ? faqApproved.value : this.faqApproved,
        notificationTitle: notificationTitle.present
            ? notificationTitle.value
            : this.notificationTitle,
        xUrl: xUrl.present ? xUrl.value : this.xUrl,
      );
  @override
  String toString() {
    return (StringBuffer('UnreadNew(')
          ..write('newsId: $newsId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('priority: $priority, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('faq: $faq, ')
          ..write('poll: $poll, ')
          ..write('doubts: $doubts, ')
          ..write('sections: $sections, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('formattedDescription: $formattedDescription, ')
          ..write('source: $source, ')
          ..write('pollApproved: $pollApproved, ')
          ..write('quizApproved: $quizApproved, ')
          ..write('faqApproved: $faqApproved, ')
          ..write('notificationTitle: $notificationTitle, ')
          ..write('xUrl: $xUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        newsId,
        title,
        description,
        category,
        language,
        url,
        urlToImage,
        priority,
        publishedOn,
        createdAt,
        updatedAt,
        tags,
        faq,
        poll,
        doubts,
        sections,
        originalTitle,
        formattedDescription,
        source,
        pollApproved,
        quizApproved,
        faqApproved,
        notificationTitle,
        xUrl
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnreadNew &&
          other.newsId == this.newsId &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.language == this.language &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.priority == this.priority &&
          other.publishedOn == this.publishedOn &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.tags == this.tags &&
          other.faq == this.faq &&
          other.poll == this.poll &&
          other.doubts == this.doubts &&
          other.sections == this.sections &&
          other.originalTitle == this.originalTitle &&
          other.formattedDescription == this.formattedDescription &&
          other.source == this.source &&
          other.pollApproved == this.pollApproved &&
          other.quizApproved == this.quizApproved &&
          other.faqApproved == this.faqApproved &&
          other.notificationTitle == this.notificationTitle &&
          other.xUrl == this.xUrl);
}

class UnreadNewsCompanion extends UpdateCompanion<UnreadNew> {
  final Value<String> newsId;
  final Value<String> title;
  final Value<String> description;
  final Value<Category?> category;
  final Value<String?> language;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<String?> priority;
  final Value<DateTime?> publishedOn;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<List<String>> tags;
  final Value<List<NewsFaq>> faq;
  final Value<Poll?> poll;
  final Value<List<NewsDoubts>?> doubts;
  final Value<List<NewsSection>?> sections;
  final Value<String?> originalTitle;
  final Value<String?> formattedDescription;
  final Value<Source?> source;
  final Value<bool?> pollApproved;
  final Value<bool?> quizApproved;
  final Value<bool?> faqApproved;
  final Value<String?> notificationTitle;
  final Value<String?> xUrl;
  final Value<int> rowid;
  const UnreadNewsCompanion({
    this.newsId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.priority = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.faq = const Value.absent(),
    this.poll = const Value.absent(),
    this.doubts = const Value.absent(),
    this.sections = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.formattedDescription = const Value.absent(),
    this.source = const Value.absent(),
    this.pollApproved = const Value.absent(),
    this.quizApproved = const Value.absent(),
    this.faqApproved = const Value.absent(),
    this.notificationTitle = const Value.absent(),
    this.xUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnreadNewsCompanion.insert({
    required String newsId,
    required String title,
    required String description,
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.priority = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required List<String> tags,
    required List<NewsFaq> faq,
    this.poll = const Value.absent(),
    this.doubts = const Value.absent(),
    this.sections = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.formattedDescription = const Value.absent(),
    this.source = const Value.absent(),
    this.pollApproved = const Value.absent(),
    this.quizApproved = const Value.absent(),
    this.faqApproved = const Value.absent(),
    this.notificationTitle = const Value.absent(),
    this.xUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : newsId = Value(newsId),
        title = Value(title),
        description = Value(description),
        tags = Value(tags),
        faq = Value(faq);
  static Insertable<UnreadNew> custom({
    Expression<String>? newsId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? language,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? priority,
    Expression<DateTime>? publishedOn,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? tags,
    Expression<String>? faq,
    Expression<String>? poll,
    Expression<String>? doubts,
    Expression<String>? sections,
    Expression<String>? originalTitle,
    Expression<String>? formattedDescription,
    Expression<String>? source,
    Expression<bool>? pollApproved,
    Expression<bool>? quizApproved,
    Expression<bool>? faqApproved,
    Expression<String>? notificationTitle,
    Expression<String>? xUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (newsId != null) 'news_id': newsId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (language != null) 'language': language,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (priority != null) 'priority': priority,
      if (publishedOn != null) 'published_on': publishedOn,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (tags != null) 'tags': tags,
      if (faq != null) 'faq': faq,
      if (poll != null) 'poll': poll,
      if (doubts != null) 'doubts': doubts,
      if (sections != null) 'sections': sections,
      if (originalTitle != null) 'original_title': originalTitle,
      if (formattedDescription != null)
        'formatted_description': formattedDescription,
      if (source != null) 'source': source,
      if (pollApproved != null) 'poll_approved': pollApproved,
      if (quizApproved != null) 'quiz_approved': quizApproved,
      if (faqApproved != null) 'faq_approved': faqApproved,
      if (notificationTitle != null) 'notification_title': notificationTitle,
      if (xUrl != null) 'x_url': xUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnreadNewsCompanion copyWith(
      {Value<String>? newsId,
      Value<String>? title,
      Value<String>? description,
      Value<Category?>? category,
      Value<String?>? language,
      Value<String?>? url,
      Value<String?>? urlToImage,
      Value<String?>? priority,
      Value<DateTime?>? publishedOn,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<List<String>>? tags,
      Value<List<NewsFaq>>? faq,
      Value<Poll?>? poll,
      Value<List<NewsDoubts>?>? doubts,
      Value<List<NewsSection>?>? sections,
      Value<String?>? originalTitle,
      Value<String?>? formattedDescription,
      Value<Source?>? source,
      Value<bool?>? pollApproved,
      Value<bool?>? quizApproved,
      Value<bool?>? faqApproved,
      Value<String?>? notificationTitle,
      Value<String?>? xUrl,
      Value<int>? rowid}) {
    return UnreadNewsCompanion(
      newsId: newsId ?? this.newsId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      language: language ?? this.language,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      priority: priority ?? this.priority,
      publishedOn: publishedOn ?? this.publishedOn,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
      faq: faq ?? this.faq,
      poll: poll ?? this.poll,
      doubts: doubts ?? this.doubts,
      sections: sections ?? this.sections,
      originalTitle: originalTitle ?? this.originalTitle,
      formattedDescription: formattedDescription ?? this.formattedDescription,
      source: source ?? this.source,
      pollApproved: pollApproved ?? this.pollApproved,
      quizApproved: quizApproved ?? this.quizApproved,
      faqApproved: faqApproved ?? this.faqApproved,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      xUrl: xUrl ?? this.xUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      final converter = $UnreadNewsTable.$convertercategoryn;

      map['category'] = Variable<String>(converter.toSql(category.value));
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (publishedOn.present) {
      map['published_on'] = Variable<DateTime>(publishedOn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (tags.present) {
      final converter = $UnreadNewsTable.$convertertags;

      map['tags'] = Variable<String>(converter.toSql(tags.value));
    }
    if (faq.present) {
      final converter = $UnreadNewsTable.$converterfaq;

      map['faq'] = Variable<String>(converter.toSql(faq.value));
    }
    if (poll.present) {
      final converter = $UnreadNewsTable.$converterpolln;

      map['poll'] = Variable<String>(converter.toSql(poll.value));
    }
    if (doubts.present) {
      final converter = $UnreadNewsTable.$converterdoubtsn;

      map['doubts'] = Variable<String>(converter.toSql(doubts.value));
    }
    if (sections.present) {
      final converter = $UnreadNewsTable.$convertersectionsn;

      map['sections'] = Variable<String>(converter.toSql(sections.value));
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (formattedDescription.present) {
      map['formatted_description'] =
          Variable<String>(formattedDescription.value);
    }
    if (source.present) {
      final converter = $UnreadNewsTable.$convertersourcen;

      map['source'] = Variable<String>(converter.toSql(source.value));
    }
    if (pollApproved.present) {
      map['poll_approved'] = Variable<bool>(pollApproved.value);
    }
    if (quizApproved.present) {
      map['quiz_approved'] = Variable<bool>(quizApproved.value);
    }
    if (faqApproved.present) {
      map['faq_approved'] = Variable<bool>(faqApproved.value);
    }
    if (notificationTitle.present) {
      map['notification_title'] = Variable<String>(notificationTitle.value);
    }
    if (xUrl.present) {
      map['x_url'] = Variable<String>(xUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnreadNewsCompanion(')
          ..write('newsId: $newsId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('priority: $priority, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('faq: $faq, ')
          ..write('poll: $poll, ')
          ..write('doubts: $doubts, ')
          ..write('sections: $sections, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('formattedDescription: $formattedDescription, ')
          ..write('source: $source, ')
          ..write('pollApproved: $pollApproved, ')
          ..write('quizApproved: $quizApproved, ')
          ..write('faqApproved: $faqApproved, ')
          ..write('notificationTitle: $notificationTitle, ')
          ..write('xUrl: $xUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NewsBookmarksTable extends NewsBookmarks
    with TableInfo<$NewsBookmarksTable, NewsBookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsBookmarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isNewsMeta = const VerificationMeta('isNews');
  @override
  late final GeneratedColumn<bool> isNews = GeneratedColumn<bool>(
      'is_news', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_news" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Variable(DateTime.now()));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Variable(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [newsId, categoryId, isNews, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_bookmarks';
  @override
  VerificationContext validateIntegrity(Insertable<NewsBookmark> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('is_news')) {
      context.handle(_isNewsMeta,
          isNews.isAcceptableOrUnknown(data['is_news']!, _isNewsMeta));
    } else if (isInserting) {
      context.missing(_isNewsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsId};
  @override
  NewsBookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsBookmark(
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      isNews: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_news'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NewsBookmarksTable createAlias(String alias) {
    return $NewsBookmarksTable(attachedDatabase, alias);
  }
}

class NewsBookmark extends DataClass implements Insertable<NewsBookmark> {
  final String newsId;
  final String? categoryId;
  final bool isNews;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NewsBookmark(
      {required this.newsId,
      this.categoryId,
      required this.isNews,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_id'] = Variable<String>(newsId);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['is_news'] = Variable<bool>(isNews);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NewsBookmarksCompanion toCompanion(bool nullToAbsent) {
    return NewsBookmarksCompanion(
      newsId: Value(newsId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      isNews: Value(isNews),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NewsBookmark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsBookmark(
      newsId: serializer.fromJson<String>(json['newsId']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      isNews: serializer.fromJson<bool>(json['isNews']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsId': serializer.toJson<String>(newsId),
      'categoryId': serializer.toJson<String?>(categoryId),
      'isNews': serializer.toJson<bool>(isNews),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NewsBookmark copyWith(
          {String? newsId,
          Value<String?> categoryId = const Value.absent(),
          bool? isNews,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      NewsBookmark(
        newsId: newsId ?? this.newsId,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        isNews: isNews ?? this.isNews,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NewsBookmark(')
          ..write('newsId: $newsId, ')
          ..write('categoryId: $categoryId, ')
          ..write('isNews: $isNews, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(newsId, categoryId, isNews, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsBookmark &&
          other.newsId == this.newsId &&
          other.categoryId == this.categoryId &&
          other.isNews == this.isNews &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NewsBookmarksCompanion extends UpdateCompanion<NewsBookmark> {
  final Value<String> newsId;
  final Value<String?> categoryId;
  final Value<bool> isNews;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NewsBookmarksCompanion({
    this.newsId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isNews = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsBookmarksCompanion.insert({
    required String newsId,
    this.categoryId = const Value.absent(),
    required bool isNews,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : newsId = Value(newsId),
        isNews = Value(isNews);
  static Insertable<NewsBookmark> custom({
    Expression<String>? newsId,
    Expression<String>? categoryId,
    Expression<bool>? isNews,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (newsId != null) 'news_id': newsId,
      if (categoryId != null) 'category_id': categoryId,
      if (isNews != null) 'is_news': isNews,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsBookmarksCompanion copyWith(
      {Value<String>? newsId,
      Value<String?>? categoryId,
      Value<bool>? isNews,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return NewsBookmarksCompanion(
      newsId: newsId ?? this.newsId,
      categoryId: categoryId ?? this.categoryId,
      isNews: isNews ?? this.isNews,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (isNews.present) {
      map['is_news'] = Variable<bool>(isNews.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsBookmarksCompanion(')
          ..write('newsId: $newsId, ')
          ..write('categoryId: $categoryId, ')
          ..write('isNews: $isNews, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnreadThreadTable extends UnreadThread
    with TableInfo<$UnreadThreadTable, UnreadThreadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnreadThreadTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _publishedOnMeta =
      const VerificationMeta('publishedOn');
  @override
  late final GeneratedColumn<DateTime> publishedOn = GeneratedColumn<DateTime>(
      'published_on', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _factsMeta = const VerificationMeta('facts');
  @override
  late final GeneratedColumnWithTypeConverter<List<Fact>?, String> facts =
      GeneratedColumn<String>('facts', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<Fact>?>($UnreadThreadTable.$converterfactsn);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> tags =
      GeneratedColumn<String>('tags', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($UnreadThreadTable.$convertertagsn);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumnWithTypeConverter<ThreadSource?, String> source =
      GeneratedColumn<String>('source', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<ThreadSource?>($UnreadThreadTable.$convertersourcen);
  static const VerificationMeta _backgroundImgUrlMeta =
      const VerificationMeta('backgroundImgUrl');
  @override
  late final GeneratedColumn<String> backgroundImgUrl = GeneratedColumn<String>(
      'background_img_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _threadTitleMeta =
      const VerificationMeta('threadTitle');
  @override
  late final GeneratedColumn<String> threadTitle = GeneratedColumn<String>(
      'thread_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleHeaderMeta =
      const VerificationMeta('titleHeader');
  @override
  late final GeneratedColumn<String> titleHeader = GeneratedColumn<String>(
      'title_header', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleFooterMeta =
      const VerificationMeta('titleFooter');
  @override
  late final GeneratedColumn<String> titleFooter = GeneratedColumn<String>(
      'title_footer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentTitleMeta =
      const VerificationMeta('contentTitle');
  @override
  late final GeneratedColumn<String> contentTitle = GeneratedColumn<String>(
      'content_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Variable("english"));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        publishedOn,
        facts,
        tags,
        source,
        backgroundImgUrl,
        threadTitle,
        titleHeader,
        titleFooter,
        contentTitle,
        language
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unread_thread';
  @override
  VerificationContext validateIntegrity(Insertable<UnreadThreadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('published_on')) {
      context.handle(
          _publishedOnMeta,
          publishedOn.isAcceptableOrUnknown(
              data['published_on']!, _publishedOnMeta));
    }
    context.handle(_factsMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_sourceMeta, const VerificationResult.success());
    if (data.containsKey('background_img_url')) {
      context.handle(
          _backgroundImgUrlMeta,
          backgroundImgUrl.isAcceptableOrUnknown(
              data['background_img_url']!, _backgroundImgUrlMeta));
    }
    if (data.containsKey('thread_title')) {
      context.handle(
          _threadTitleMeta,
          threadTitle.isAcceptableOrUnknown(
              data['thread_title']!, _threadTitleMeta));
    }
    if (data.containsKey('title_header')) {
      context.handle(
          _titleHeaderMeta,
          titleHeader.isAcceptableOrUnknown(
              data['title_header']!, _titleHeaderMeta));
    }
    if (data.containsKey('title_footer')) {
      context.handle(
          _titleFooterMeta,
          titleFooter.isAcceptableOrUnknown(
              data['title_footer']!, _titleFooterMeta));
    }
    if (data.containsKey('content_title')) {
      context.handle(
          _contentTitleMeta,
          contentTitle.isAcceptableOrUnknown(
              data['content_title']!, _contentTitleMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UnreadThreadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnreadThreadData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      publishedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_on']),
      facts: $UnreadThreadTable.$converterfactsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}facts'])),
      tags: $UnreadThreadTable.$convertertagsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])),
      source: $UnreadThreadTable.$convertersourcen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])),
      backgroundImgUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}background_img_url']),
      threadTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thread_title']),
      titleHeader: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title_header']),
      titleFooter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title_footer']),
      contentTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_title']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
    );
  }

  @override
  $UnreadThreadTable createAlias(String alias) {
    return $UnreadThreadTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Fact>, String> $converterfacts =
      GenericListConvertor(
          fromJson: (json) => Fact.fromJson(json),
          toJson: (fact) => fact.toJson());
  static TypeConverter<List<Fact>?, String?> $converterfactsn =
      NullAwareTypeConverter.wrap($converterfacts);
  static TypeConverter<List<String>, String> $convertertags =
      StringListConvertor();
  static TypeConverter<List<String>?, String?> $convertertagsn =
      NullAwareTypeConverter.wrap($convertertags);
  static TypeConverter<ThreadSource, String> $convertersource =
      GenericConvertor(
          fromJson: (json) => ThreadSource.fromJson(json),
          toJson: (thread) => thread.toJson());
  static TypeConverter<ThreadSource?, String?> $convertersourcen =
      NullAwareTypeConverter.wrap($convertersource);
}

class UnreadThreadData extends DataClass
    implements Insertable<UnreadThreadData> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? publishedOn;
  final List<Fact>? facts;
  final List<String>? tags;
  final ThreadSource? source;
  final String? backgroundImgUrl;
  final String? threadTitle;
  final String? titleHeader;
  final String? titleFooter;
  final String? contentTitle;
  final String language;
  const UnreadThreadData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.publishedOn,
      this.facts,
      this.tags,
      this.source,
      this.backgroundImgUrl,
      this.threadTitle,
      this.titleHeader,
      this.titleFooter,
      this.contentTitle,
      required this.language});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || publishedOn != null) {
      map['published_on'] = Variable<DateTime>(publishedOn);
    }
    if (!nullToAbsent || facts != null) {
      final converter = $UnreadThreadTable.$converterfactsn;
      map['facts'] = Variable<String>(converter.toSql(facts));
    }
    if (!nullToAbsent || tags != null) {
      final converter = $UnreadThreadTable.$convertertagsn;
      map['tags'] = Variable<String>(converter.toSql(tags));
    }
    if (!nullToAbsent || source != null) {
      final converter = $UnreadThreadTable.$convertersourcen;
      map['source'] = Variable<String>(converter.toSql(source));
    }
    if (!nullToAbsent || backgroundImgUrl != null) {
      map['background_img_url'] = Variable<String>(backgroundImgUrl);
    }
    if (!nullToAbsent || threadTitle != null) {
      map['thread_title'] = Variable<String>(threadTitle);
    }
    if (!nullToAbsent || titleHeader != null) {
      map['title_header'] = Variable<String>(titleHeader);
    }
    if (!nullToAbsent || titleFooter != null) {
      map['title_footer'] = Variable<String>(titleFooter);
    }
    if (!nullToAbsent || contentTitle != null) {
      map['content_title'] = Variable<String>(contentTitle);
    }
    map['language'] = Variable<String>(language);
    return map;
  }

  UnreadThreadCompanion toCompanion(bool nullToAbsent) {
    return UnreadThreadCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      publishedOn: publishedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedOn),
      facts:
          facts == null && nullToAbsent ? const Value.absent() : Value(facts),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      backgroundImgUrl: backgroundImgUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(backgroundImgUrl),
      threadTitle: threadTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(threadTitle),
      titleHeader: titleHeader == null && nullToAbsent
          ? const Value.absent()
          : Value(titleHeader),
      titleFooter: titleFooter == null && nullToAbsent
          ? const Value.absent()
          : Value(titleFooter),
      contentTitle: contentTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(contentTitle),
      language: Value(language),
    );
  }

  factory UnreadThreadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnreadThreadData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      publishedOn: serializer.fromJson<DateTime?>(json['publishedOn']),
      facts: serializer.fromJson<List<Fact>?>(json['facts']),
      tags: serializer.fromJson<List<String>?>(json['tags']),
      source: serializer.fromJson<ThreadSource?>(json['source']),
      backgroundImgUrl: serializer.fromJson<String?>(json['backgroundImgUrl']),
      threadTitle: serializer.fromJson<String?>(json['threadTitle']),
      titleHeader: serializer.fromJson<String?>(json['titleHeader']),
      titleFooter: serializer.fromJson<String?>(json['titleFooter']),
      contentTitle: serializer.fromJson<String?>(json['contentTitle']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'publishedOn': serializer.toJson<DateTime?>(publishedOn),
      'facts': serializer.toJson<List<Fact>?>(facts),
      'tags': serializer.toJson<List<String>?>(tags),
      'source': serializer.toJson<ThreadSource?>(source),
      'backgroundImgUrl': serializer.toJson<String?>(backgroundImgUrl),
      'threadTitle': serializer.toJson<String?>(threadTitle),
      'titleHeader': serializer.toJson<String?>(titleHeader),
      'titleFooter': serializer.toJson<String?>(titleFooter),
      'contentTitle': serializer.toJson<String?>(contentTitle),
      'language': serializer.toJson<String>(language),
    };
  }

  UnreadThreadData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> publishedOn = const Value.absent(),
          Value<List<Fact>?> facts = const Value.absent(),
          Value<List<String>?> tags = const Value.absent(),
          Value<ThreadSource?> source = const Value.absent(),
          Value<String?> backgroundImgUrl = const Value.absent(),
          Value<String?> threadTitle = const Value.absent(),
          Value<String?> titleHeader = const Value.absent(),
          Value<String?> titleFooter = const Value.absent(),
          Value<String?> contentTitle = const Value.absent(),
          String? language}) =>
      UnreadThreadData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedOn: publishedOn.present ? publishedOn.value : this.publishedOn,
        facts: facts.present ? facts.value : this.facts,
        tags: tags.present ? tags.value : this.tags,
        source: source.present ? source.value : this.source,
        backgroundImgUrl: backgroundImgUrl.present
            ? backgroundImgUrl.value
            : this.backgroundImgUrl,
        threadTitle: threadTitle.present ? threadTitle.value : this.threadTitle,
        titleHeader: titleHeader.present ? titleHeader.value : this.titleHeader,
        titleFooter: titleFooter.present ? titleFooter.value : this.titleFooter,
        contentTitle:
            contentTitle.present ? contentTitle.value : this.contentTitle,
        language: language ?? this.language,
      );
  @override
  String toString() {
    return (StringBuffer('UnreadThreadData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('facts: $facts, ')
          ..write('tags: $tags, ')
          ..write('source: $source, ')
          ..write('backgroundImgUrl: $backgroundImgUrl, ')
          ..write('threadTitle: $threadTitle, ')
          ..write('titleHeader: $titleHeader, ')
          ..write('titleFooter: $titleFooter, ')
          ..write('contentTitle: $contentTitle, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      publishedOn,
      facts,
      tags,
      source,
      backgroundImgUrl,
      threadTitle,
      titleHeader,
      titleFooter,
      contentTitle,
      language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnreadThreadData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.publishedOn == this.publishedOn &&
          other.facts == this.facts &&
          other.tags == this.tags &&
          other.source == this.source &&
          other.backgroundImgUrl == this.backgroundImgUrl &&
          other.threadTitle == this.threadTitle &&
          other.titleHeader == this.titleHeader &&
          other.titleFooter == this.titleFooter &&
          other.contentTitle == this.contentTitle &&
          other.language == this.language);
}

class UnreadThreadCompanion extends UpdateCompanion<UnreadThreadData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> publishedOn;
  final Value<List<Fact>?> facts;
  final Value<List<String>?> tags;
  final Value<ThreadSource?> source;
  final Value<String?> backgroundImgUrl;
  final Value<String?> threadTitle;
  final Value<String?> titleHeader;
  final Value<String?> titleFooter;
  final Value<String?> contentTitle;
  final Value<String> language;
  final Value<int> rowid;
  const UnreadThreadCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.facts = const Value.absent(),
    this.tags = const Value.absent(),
    this.source = const Value.absent(),
    this.backgroundImgUrl = const Value.absent(),
    this.threadTitle = const Value.absent(),
    this.titleHeader = const Value.absent(),
    this.titleFooter = const Value.absent(),
    this.contentTitle = const Value.absent(),
    this.language = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnreadThreadCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.publishedOn = const Value.absent(),
    this.facts = const Value.absent(),
    this.tags = const Value.absent(),
    this.source = const Value.absent(),
    this.backgroundImgUrl = const Value.absent(),
    this.threadTitle = const Value.absent(),
    this.titleHeader = const Value.absent(),
    this.titleFooter = const Value.absent(),
    this.contentTitle = const Value.absent(),
    this.language = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UnreadThreadData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? publishedOn,
    Expression<String>? facts,
    Expression<String>? tags,
    Expression<String>? source,
    Expression<String>? backgroundImgUrl,
    Expression<String>? threadTitle,
    Expression<String>? titleHeader,
    Expression<String>? titleFooter,
    Expression<String>? contentTitle,
    Expression<String>? language,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (publishedOn != null) 'published_on': publishedOn,
      if (facts != null) 'facts': facts,
      if (tags != null) 'tags': tags,
      if (source != null) 'source': source,
      if (backgroundImgUrl != null) 'background_img_url': backgroundImgUrl,
      if (threadTitle != null) 'thread_title': threadTitle,
      if (titleHeader != null) 'title_header': titleHeader,
      if (titleFooter != null) 'title_footer': titleFooter,
      if (contentTitle != null) 'content_title': contentTitle,
      if (language != null) 'language': language,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnreadThreadCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? publishedOn,
      Value<List<Fact>?>? facts,
      Value<List<String>?>? tags,
      Value<ThreadSource?>? source,
      Value<String?>? backgroundImgUrl,
      Value<String?>? threadTitle,
      Value<String?>? titleHeader,
      Value<String?>? titleFooter,
      Value<String?>? contentTitle,
      Value<String>? language,
      Value<int>? rowid}) {
    return UnreadThreadCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedOn: publishedOn ?? this.publishedOn,
      facts: facts ?? this.facts,
      tags: tags ?? this.tags,
      source: source ?? this.source,
      backgroundImgUrl: backgroundImgUrl ?? this.backgroundImgUrl,
      threadTitle: threadTitle ?? this.threadTitle,
      titleHeader: titleHeader ?? this.titleHeader,
      titleFooter: titleFooter ?? this.titleFooter,
      contentTitle: contentTitle ?? this.contentTitle,
      language: language ?? this.language,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (publishedOn.present) {
      map['published_on'] = Variable<DateTime>(publishedOn.value);
    }
    if (facts.present) {
      final converter = $UnreadThreadTable.$converterfactsn;

      map['facts'] = Variable<String>(converter.toSql(facts.value));
    }
    if (tags.present) {
      final converter = $UnreadThreadTable.$convertertagsn;

      map['tags'] = Variable<String>(converter.toSql(tags.value));
    }
    if (source.present) {
      final converter = $UnreadThreadTable.$convertersourcen;

      map['source'] = Variable<String>(converter.toSql(source.value));
    }
    if (backgroundImgUrl.present) {
      map['background_img_url'] = Variable<String>(backgroundImgUrl.value);
    }
    if (threadTitle.present) {
      map['thread_title'] = Variable<String>(threadTitle.value);
    }
    if (titleHeader.present) {
      map['title_header'] = Variable<String>(titleHeader.value);
    }
    if (titleFooter.present) {
      map['title_footer'] = Variable<String>(titleFooter.value);
    }
    if (contentTitle.present) {
      map['content_title'] = Variable<String>(contentTitle.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnreadThreadCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('facts: $facts, ')
          ..write('tags: $tags, ')
          ..write('source: $source, ')
          ..write('backgroundImgUrl: $backgroundImgUrl, ')
          ..write('threadTitle: $threadTitle, ')
          ..write('titleHeader: $titleHeader, ')
          ..write('titleFooter: $titleFooter, ')
          ..write('contentTitle: $contentTitle, ')
          ..write('language: $language, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShowCaseActionsTable extends ShowCaseActions
    with TableInfo<$ShowCaseActionsTable, ShowCaseAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShowCaseActionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actionIdMeta =
      const VerificationMeta('actionId');
  @override
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
      'action_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasShownToolTipMeta =
      const VerificationMeta('hasShownToolTip');
  @override
  late final GeneratedColumn<bool> hasShownToolTip = GeneratedColumn<bool>(
      'has_shown_tool_tip', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_shown_tool_tip" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasActionTapMeta =
      const VerificationMeta('hasActionTap');
  @override
  late final GeneratedColumn<bool> hasActionTap = GeneratedColumn<bool>(
      'has_action_tap', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_action_tap" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [actionId, hasShownToolTip, hasActionTap];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'show_case_actions';
  @override
  VerificationContext validateIntegrity(Insertable<ShowCaseAction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('action_id')) {
      context.handle(_actionIdMeta,
          actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta));
    } else if (isInserting) {
      context.missing(_actionIdMeta);
    }
    if (data.containsKey('has_shown_tool_tip')) {
      context.handle(
          _hasShownToolTipMeta,
          hasShownToolTip.isAcceptableOrUnknown(
              data['has_shown_tool_tip']!, _hasShownToolTipMeta));
    }
    if (data.containsKey('has_action_tap')) {
      context.handle(
          _hasActionTapMeta,
          hasActionTap.isAcceptableOrUnknown(
              data['has_action_tap']!, _hasActionTapMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actionId};
  @override
  ShowCaseAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShowCaseAction(
      actionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_id'])!,
      hasShownToolTip: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_shown_tool_tip'])!,
      hasActionTap: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_action_tap'])!,
    );
  }

  @override
  $ShowCaseActionsTable createAlias(String alias) {
    return $ShowCaseActionsTable(attachedDatabase, alias);
  }
}

class ShowCaseAction extends DataClass implements Insertable<ShowCaseAction> {
  final String actionId;
  final bool hasShownToolTip;
  final bool hasActionTap;
  const ShowCaseAction(
      {required this.actionId,
      required this.hasShownToolTip,
      required this.hasActionTap});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['action_id'] = Variable<String>(actionId);
    map['has_shown_tool_tip'] = Variable<bool>(hasShownToolTip);
    map['has_action_tap'] = Variable<bool>(hasActionTap);
    return map;
  }

  ShowCaseActionsCompanion toCompanion(bool nullToAbsent) {
    return ShowCaseActionsCompanion(
      actionId: Value(actionId),
      hasShownToolTip: Value(hasShownToolTip),
      hasActionTap: Value(hasActionTap),
    );
  }

  factory ShowCaseAction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShowCaseAction(
      actionId: serializer.fromJson<String>(json['actionId']),
      hasShownToolTip: serializer.fromJson<bool>(json['hasShownToolTip']),
      hasActionTap: serializer.fromJson<bool>(json['hasActionTap']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actionId': serializer.toJson<String>(actionId),
      'hasShownToolTip': serializer.toJson<bool>(hasShownToolTip),
      'hasActionTap': serializer.toJson<bool>(hasActionTap),
    };
  }

  ShowCaseAction copyWith(
          {String? actionId, bool? hasShownToolTip, bool? hasActionTap}) =>
      ShowCaseAction(
        actionId: actionId ?? this.actionId,
        hasShownToolTip: hasShownToolTip ?? this.hasShownToolTip,
        hasActionTap: hasActionTap ?? this.hasActionTap,
      );
  @override
  String toString() {
    return (StringBuffer('ShowCaseAction(')
          ..write('actionId: $actionId, ')
          ..write('hasShownToolTip: $hasShownToolTip, ')
          ..write('hasActionTap: $hasActionTap')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(actionId, hasShownToolTip, hasActionTap);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowCaseAction &&
          other.actionId == this.actionId &&
          other.hasShownToolTip == this.hasShownToolTip &&
          other.hasActionTap == this.hasActionTap);
}

class ShowCaseActionsCompanion extends UpdateCompanion<ShowCaseAction> {
  final Value<String> actionId;
  final Value<bool> hasShownToolTip;
  final Value<bool> hasActionTap;
  final Value<int> rowid;
  const ShowCaseActionsCompanion({
    this.actionId = const Value.absent(),
    this.hasShownToolTip = const Value.absent(),
    this.hasActionTap = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShowCaseActionsCompanion.insert({
    required String actionId,
    this.hasShownToolTip = const Value.absent(),
    this.hasActionTap = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : actionId = Value(actionId);
  static Insertable<ShowCaseAction> custom({
    Expression<String>? actionId,
    Expression<bool>? hasShownToolTip,
    Expression<bool>? hasActionTap,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actionId != null) 'action_id': actionId,
      if (hasShownToolTip != null) 'has_shown_tool_tip': hasShownToolTip,
      if (hasActionTap != null) 'has_action_tap': hasActionTap,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShowCaseActionsCompanion copyWith(
      {Value<String>? actionId,
      Value<bool>? hasShownToolTip,
      Value<bool>? hasActionTap,
      Value<int>? rowid}) {
    return ShowCaseActionsCompanion(
      actionId: actionId ?? this.actionId,
      hasShownToolTip: hasShownToolTip ?? this.hasShownToolTip,
      hasActionTap: hasActionTap ?? this.hasActionTap,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actionId.present) {
      map['action_id'] = Variable<String>(actionId.value);
    }
    if (hasShownToolTip.present) {
      map['has_shown_tool_tip'] = Variable<bool>(hasShownToolTip.value);
    }
    if (hasActionTap.present) {
      map['has_action_tap'] = Variable<bool>(hasActionTap.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowCaseActionsCompanion(')
          ..write('actionId: $actionId, ')
          ..write('hasShownToolTip: $hasShownToolTip, ')
          ..write('hasActionTap: $hasActionTap, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TempNewsCachesTable extends TempNewsCaches
    with TableInfo<$TempNewsCachesTable, TempNewsCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TempNewsCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category?, String> category =
      GeneratedColumn<String>('category', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Category?>($TempNewsCachesTable.$convertercategoryn);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedOnMeta =
      const VerificationMeta('publishedOn');
  @override
  late final GeneratedColumn<DateTime> publishedOn = GeneratedColumn<DateTime>(
      'published_on', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TempNewsCachesTable.$convertertags);
  static const VerificationMeta _faqMeta = const VerificationMeta('faq');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsFaq>, String> faq =
      GeneratedColumn<String>('faq', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<NewsFaq>>($TempNewsCachesTable.$converterfaq);
  static const VerificationMeta _pollMeta = const VerificationMeta('poll');
  @override
  late final GeneratedColumnWithTypeConverter<Poll?, String> poll =
      GeneratedColumn<String>('poll', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Poll?>($TempNewsCachesTable.$converterpolln);
  static const VerificationMeta _doubtsMeta = const VerificationMeta('doubts');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsDoubts>?, String>
      doubts = GeneratedColumn<String>('doubts', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<NewsDoubts>?>(
              $TempNewsCachesTable.$converterdoubtsn);
  static const VerificationMeta _sectionsMeta =
      const VerificationMeta('sections');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsSection>?, String>
      sections = GeneratedColumn<String>('sections', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<NewsSection>?>(
              $TempNewsCachesTable.$convertersectionsn);
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _formattedDescriptionMeta =
      const VerificationMeta('formattedDescription');
  @override
  late final GeneratedColumn<String> formattedDescription =
      GeneratedColumn<String>('formatted_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumnWithTypeConverter<Source?, String> source =
      GeneratedColumn<String>('source', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Source?>($TempNewsCachesTable.$convertersourcen);
  static const VerificationMeta _pollApprovedMeta =
      const VerificationMeta('pollApproved');
  @override
  late final GeneratedColumn<bool> pollApproved = GeneratedColumn<bool>(
      'poll_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("poll_approved" IN (0, 1))'));
  static const VerificationMeta _quizApprovedMeta =
      const VerificationMeta('quizApproved');
  @override
  late final GeneratedColumn<bool> quizApproved = GeneratedColumn<bool>(
      'quiz_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("quiz_approved" IN (0, 1))'));
  static const VerificationMeta _faqApprovedMeta =
      const VerificationMeta('faqApproved');
  @override
  late final GeneratedColumn<bool> faqApproved = GeneratedColumn<bool>(
      'faq_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("faq_approved" IN (0, 1))'));
  static const VerificationMeta _notificationTitleMeta =
      const VerificationMeta('notificationTitle');
  @override
  late final GeneratedColumn<String> notificationTitle =
      GeneratedColumn<String>('notification_title', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        newsId,
        title,
        description,
        category,
        language,
        url,
        urlToImage,
        priority,
        publishedOn,
        createdAt,
        updatedAt,
        tags,
        faq,
        poll,
        doubts,
        sections,
        originalTitle,
        formattedDescription,
        source,
        pollApproved,
        quizApproved,
        faqApproved,
        notificationTitle
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'temp_news_caches';
  @override
  VerificationContext validateIntegrity(Insertable<TempNewsCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_categoryMeta, const VerificationResult.success());
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('published_on')) {
      context.handle(
          _publishedOnMeta,
          publishedOn.isAcceptableOrUnknown(
              data['published_on']!, _publishedOnMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_faqMeta, const VerificationResult.success());
    context.handle(_pollMeta, const VerificationResult.success());
    context.handle(_doubtsMeta, const VerificationResult.success());
    context.handle(_sectionsMeta, const VerificationResult.success());
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('formatted_description')) {
      context.handle(
          _formattedDescriptionMeta,
          formattedDescription.isAcceptableOrUnknown(
              data['formatted_description']!, _formattedDescriptionMeta));
    }
    context.handle(_sourceMeta, const VerificationResult.success());
    if (data.containsKey('poll_approved')) {
      context.handle(
          _pollApprovedMeta,
          pollApproved.isAcceptableOrUnknown(
              data['poll_approved']!, _pollApprovedMeta));
    }
    if (data.containsKey('quiz_approved')) {
      context.handle(
          _quizApprovedMeta,
          quizApproved.isAcceptableOrUnknown(
              data['quiz_approved']!, _quizApprovedMeta));
    }
    if (data.containsKey('faq_approved')) {
      context.handle(
          _faqApprovedMeta,
          faqApproved.isAcceptableOrUnknown(
              data['faq_approved']!, _faqApprovedMeta));
    }
    if (data.containsKey('notification_title')) {
      context.handle(
          _notificationTitleMeta,
          notificationTitle.isAcceptableOrUnknown(
              data['notification_title']!, _notificationTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TempNewsCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TempNewsCache(
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: $TempNewsCachesTable.$convertercategoryn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}category'])),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority']),
      publishedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_on']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      tags: $TempNewsCachesTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      faq: $TempNewsCachesTable.$converterfaq.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faq'])!),
      poll: $TempNewsCachesTable.$converterpolln.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poll'])),
      doubts: $TempNewsCachesTable.$converterdoubtsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doubts'])),
      sections: $TempNewsCachesTable.$convertersectionsn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}sections'])),
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title']),
      formattedDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}formatted_description']),
      source: $TempNewsCachesTable.$convertersourcen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])),
      pollApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}poll_approved']),
      quizApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}quiz_approved']),
      faqApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}faq_approved']),
      notificationTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}notification_title']),
    );
  }

  @override
  $TempNewsCachesTable createAlias(String alias) {
    return $TempNewsCachesTable(attachedDatabase, alias);
  }

  static TypeConverter<Category, String> $convertercategory =
      CategoryConvertor();
  static TypeConverter<Category?, String?> $convertercategoryn =
      NullAwareTypeConverter.wrap($convertercategory);
  static TypeConverter<List<String>, String> $convertertags =
      StringListConvertor();
  static TypeConverter<List<NewsFaq>, String> $converterfaq =
      FaqListConvertor();
  static TypeConverter<Poll, String> $converterpoll = PollConvertor();
  static TypeConverter<Poll?, String?> $converterpolln =
      NullAwareTypeConverter.wrap($converterpoll);
  static TypeConverter<List<NewsDoubts>, String> $converterdoubts =
      GenericListConvertor(
          fromJson: (json) => NewsDoubts.fromJson(json),
          toJson: (fact) => fact.toJson());
  static TypeConverter<List<NewsDoubts>?, String?> $converterdoubtsn =
      NullAwareTypeConverter.wrap($converterdoubts);
  static TypeConverter<List<NewsSection>, String> $convertersections =
      GenericListConvertor(
          fromJson: (json) => NewsSection.fromJson(json),
          toJson: (section) => section.toJson());
  static TypeConverter<List<NewsSection>?, String?> $convertersectionsn =
      NullAwareTypeConverter.wrap($convertersections);
  static TypeConverter<Source, String> $convertersource = GenericConvertor(
      fromJson: (json) => Source.fromJson(json),
      toJson: (fact) => fact.toJson());
  static TypeConverter<Source?, String?> $convertersourcen =
      NullAwareTypeConverter.wrap($convertersource);
}

class TempNewsCache extends DataClass implements Insertable<TempNewsCache> {
  final String newsId;
  final String title;
  final String description;
  final Category? category;
  final String? language;
  final String? url;
  final String? urlToImage;
  final String? priority;
  final DateTime? publishedOn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String> tags;
  final List<NewsFaq> faq;
  final Poll? poll;
  final List<NewsDoubts>? doubts;
  final List<NewsSection>? sections;
  final String? originalTitle;
  final String? formattedDescription;
  final Source? source;
  final bool? pollApproved;
  final bool? quizApproved;
  final bool? faqApproved;
  final String? notificationTitle;
  const TempNewsCache(
      {required this.newsId,
      required this.title,
      required this.description,
      this.category,
      this.language,
      this.url,
      this.urlToImage,
      this.priority,
      this.publishedOn,
      this.createdAt,
      this.updatedAt,
      required this.tags,
      required this.faq,
      this.poll,
      this.doubts,
      this.sections,
      this.originalTitle,
      this.formattedDescription,
      this.source,
      this.pollApproved,
      this.quizApproved,
      this.faqApproved,
      this.notificationTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_id'] = Variable<String>(newsId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || category != null) {
      final converter = $TempNewsCachesTable.$convertercategoryn;
      map['category'] = Variable<String>(converter.toSql(category));
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<String>(priority);
    }
    if (!nullToAbsent || publishedOn != null) {
      map['published_on'] = Variable<DateTime>(publishedOn);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    {
      final converter = $TempNewsCachesTable.$convertertags;
      map['tags'] = Variable<String>(converter.toSql(tags));
    }
    {
      final converter = $TempNewsCachesTable.$converterfaq;
      map['faq'] = Variable<String>(converter.toSql(faq));
    }
    if (!nullToAbsent || poll != null) {
      final converter = $TempNewsCachesTable.$converterpolln;
      map['poll'] = Variable<String>(converter.toSql(poll));
    }
    if (!nullToAbsent || doubts != null) {
      final converter = $TempNewsCachesTable.$converterdoubtsn;
      map['doubts'] = Variable<String>(converter.toSql(doubts));
    }
    if (!nullToAbsent || sections != null) {
      final converter = $TempNewsCachesTable.$convertersectionsn;
      map['sections'] = Variable<String>(converter.toSql(sections));
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || formattedDescription != null) {
      map['formatted_description'] = Variable<String>(formattedDescription);
    }
    if (!nullToAbsent || source != null) {
      final converter = $TempNewsCachesTable.$convertersourcen;
      map['source'] = Variable<String>(converter.toSql(source));
    }
    if (!nullToAbsent || pollApproved != null) {
      map['poll_approved'] = Variable<bool>(pollApproved);
    }
    if (!nullToAbsent || quizApproved != null) {
      map['quiz_approved'] = Variable<bool>(quizApproved);
    }
    if (!nullToAbsent || faqApproved != null) {
      map['faq_approved'] = Variable<bool>(faqApproved);
    }
    if (!nullToAbsent || notificationTitle != null) {
      map['notification_title'] = Variable<String>(notificationTitle);
    }
    return map;
  }

  TempNewsCachesCompanion toCompanion(bool nullToAbsent) {
    return TempNewsCachesCompanion(
      newsId: Value(newsId),
      title: Value(title),
      description: Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      publishedOn: publishedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedOn),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      tags: Value(tags),
      faq: Value(faq),
      poll: poll == null && nullToAbsent ? const Value.absent() : Value(poll),
      doubts:
          doubts == null && nullToAbsent ? const Value.absent() : Value(doubts),
      sections: sections == null && nullToAbsent
          ? const Value.absent()
          : Value(sections),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      formattedDescription: formattedDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(formattedDescription),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      pollApproved: pollApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(pollApproved),
      quizApproved: quizApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(quizApproved),
      faqApproved: faqApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(faqApproved),
      notificationTitle: notificationTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationTitle),
    );
  }

  factory TempNewsCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TempNewsCache(
      newsId: serializer.fromJson<String>(json['newsId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<Category?>(json['category']),
      language: serializer.fromJson<String?>(json['language']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      priority: serializer.fromJson<String?>(json['priority']),
      publishedOn: serializer.fromJson<DateTime?>(json['publishedOn']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      faq: serializer.fromJson<List<NewsFaq>>(json['faq']),
      poll: serializer.fromJson<Poll?>(json['poll']),
      doubts: serializer.fromJson<List<NewsDoubts>?>(json['doubts']),
      sections: serializer.fromJson<List<NewsSection>?>(json['sections']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      formattedDescription:
          serializer.fromJson<String?>(json['formattedDescription']),
      source: serializer.fromJson<Source?>(json['source']),
      pollApproved: serializer.fromJson<bool?>(json['pollApproved']),
      quizApproved: serializer.fromJson<bool?>(json['quizApproved']),
      faqApproved: serializer.fromJson<bool?>(json['faqApproved']),
      notificationTitle:
          serializer.fromJson<String?>(json['notificationTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsId': serializer.toJson<String>(newsId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<Category?>(category),
      'language': serializer.toJson<String?>(language),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'priority': serializer.toJson<String?>(priority),
      'publishedOn': serializer.toJson<DateTime?>(publishedOn),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'tags': serializer.toJson<List<String>>(tags),
      'faq': serializer.toJson<List<NewsFaq>>(faq),
      'poll': serializer.toJson<Poll?>(poll),
      'doubts': serializer.toJson<List<NewsDoubts>?>(doubts),
      'sections': serializer.toJson<List<NewsSection>?>(sections),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'formattedDescription': serializer.toJson<String?>(formattedDescription),
      'source': serializer.toJson<Source?>(source),
      'pollApproved': serializer.toJson<bool?>(pollApproved),
      'quizApproved': serializer.toJson<bool?>(quizApproved),
      'faqApproved': serializer.toJson<bool?>(faqApproved),
      'notificationTitle': serializer.toJson<String?>(notificationTitle),
    };
  }

  TempNewsCache copyWith(
          {String? newsId,
          String? title,
          String? description,
          Value<Category?> category = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> urlToImage = const Value.absent(),
          Value<String?> priority = const Value.absent(),
          Value<DateTime?> publishedOn = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          List<String>? tags,
          List<NewsFaq>? faq,
          Value<Poll?> poll = const Value.absent(),
          Value<List<NewsDoubts>?> doubts = const Value.absent(),
          Value<List<NewsSection>?> sections = const Value.absent(),
          Value<String?> originalTitle = const Value.absent(),
          Value<String?> formattedDescription = const Value.absent(),
          Value<Source?> source = const Value.absent(),
          Value<bool?> pollApproved = const Value.absent(),
          Value<bool?> quizApproved = const Value.absent(),
          Value<bool?> faqApproved = const Value.absent(),
          Value<String?> notificationTitle = const Value.absent()}) =>
      TempNewsCache(
        newsId: newsId ?? this.newsId,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category.present ? category.value : this.category,
        language: language.present ? language.value : this.language,
        url: url.present ? url.value : this.url,
        urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
        priority: priority.present ? priority.value : this.priority,
        publishedOn: publishedOn.present ? publishedOn.value : this.publishedOn,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        tags: tags ?? this.tags,
        faq: faq ?? this.faq,
        poll: poll.present ? poll.value : this.poll,
        doubts: doubts.present ? doubts.value : this.doubts,
        sections: sections.present ? sections.value : this.sections,
        originalTitle:
            originalTitle.present ? originalTitle.value : this.originalTitle,
        formattedDescription: formattedDescription.present
            ? formattedDescription.value
            : this.formattedDescription,
        source: source.present ? source.value : this.source,
        pollApproved:
            pollApproved.present ? pollApproved.value : this.pollApproved,
        quizApproved:
            quizApproved.present ? quizApproved.value : this.quizApproved,
        faqApproved: faqApproved.present ? faqApproved.value : this.faqApproved,
        notificationTitle: notificationTitle.present
            ? notificationTitle.value
            : this.notificationTitle,
      );
  @override
  String toString() {
    return (StringBuffer('TempNewsCache(')
          ..write('newsId: $newsId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('priority: $priority, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('faq: $faq, ')
          ..write('poll: $poll, ')
          ..write('doubts: $doubts, ')
          ..write('sections: $sections, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('formattedDescription: $formattedDescription, ')
          ..write('source: $source, ')
          ..write('pollApproved: $pollApproved, ')
          ..write('quizApproved: $quizApproved, ')
          ..write('faqApproved: $faqApproved, ')
          ..write('notificationTitle: $notificationTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        newsId,
        title,
        description,
        category,
        language,
        url,
        urlToImage,
        priority,
        publishedOn,
        createdAt,
        updatedAt,
        tags,
        faq,
        poll,
        doubts,
        sections,
        originalTitle,
        formattedDescription,
        source,
        pollApproved,
        quizApproved,
        faqApproved,
        notificationTitle
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TempNewsCache &&
          other.newsId == this.newsId &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.language == this.language &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.priority == this.priority &&
          other.publishedOn == this.publishedOn &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.tags == this.tags &&
          other.faq == this.faq &&
          other.poll == this.poll &&
          other.doubts == this.doubts &&
          other.sections == this.sections &&
          other.originalTitle == this.originalTitle &&
          other.formattedDescription == this.formattedDescription &&
          other.source == this.source &&
          other.pollApproved == this.pollApproved &&
          other.quizApproved == this.quizApproved &&
          other.faqApproved == this.faqApproved &&
          other.notificationTitle == this.notificationTitle);
}

class TempNewsCachesCompanion extends UpdateCompanion<TempNewsCache> {
  final Value<String> newsId;
  final Value<String> title;
  final Value<String> description;
  final Value<Category?> category;
  final Value<String?> language;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<String?> priority;
  final Value<DateTime?> publishedOn;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<List<String>> tags;
  final Value<List<NewsFaq>> faq;
  final Value<Poll?> poll;
  final Value<List<NewsDoubts>?> doubts;
  final Value<List<NewsSection>?> sections;
  final Value<String?> originalTitle;
  final Value<String?> formattedDescription;
  final Value<Source?> source;
  final Value<bool?> pollApproved;
  final Value<bool?> quizApproved;
  final Value<bool?> faqApproved;
  final Value<String?> notificationTitle;
  final Value<int> rowid;
  const TempNewsCachesCompanion({
    this.newsId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.priority = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.faq = const Value.absent(),
    this.poll = const Value.absent(),
    this.doubts = const Value.absent(),
    this.sections = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.formattedDescription = const Value.absent(),
    this.source = const Value.absent(),
    this.pollApproved = const Value.absent(),
    this.quizApproved = const Value.absent(),
    this.faqApproved = const Value.absent(),
    this.notificationTitle = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TempNewsCachesCompanion.insert({
    required String newsId,
    required String title,
    required String description,
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.priority = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required List<String> tags,
    required List<NewsFaq> faq,
    this.poll = const Value.absent(),
    this.doubts = const Value.absent(),
    this.sections = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.formattedDescription = const Value.absent(),
    this.source = const Value.absent(),
    this.pollApproved = const Value.absent(),
    this.quizApproved = const Value.absent(),
    this.faqApproved = const Value.absent(),
    this.notificationTitle = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : newsId = Value(newsId),
        title = Value(title),
        description = Value(description),
        tags = Value(tags),
        faq = Value(faq);
  static Insertable<TempNewsCache> custom({
    Expression<String>? newsId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? language,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? priority,
    Expression<DateTime>? publishedOn,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? tags,
    Expression<String>? faq,
    Expression<String>? poll,
    Expression<String>? doubts,
    Expression<String>? sections,
    Expression<String>? originalTitle,
    Expression<String>? formattedDescription,
    Expression<String>? source,
    Expression<bool>? pollApproved,
    Expression<bool>? quizApproved,
    Expression<bool>? faqApproved,
    Expression<String>? notificationTitle,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (newsId != null) 'news_id': newsId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (language != null) 'language': language,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (priority != null) 'priority': priority,
      if (publishedOn != null) 'published_on': publishedOn,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (tags != null) 'tags': tags,
      if (faq != null) 'faq': faq,
      if (poll != null) 'poll': poll,
      if (doubts != null) 'doubts': doubts,
      if (sections != null) 'sections': sections,
      if (originalTitle != null) 'original_title': originalTitle,
      if (formattedDescription != null)
        'formatted_description': formattedDescription,
      if (source != null) 'source': source,
      if (pollApproved != null) 'poll_approved': pollApproved,
      if (quizApproved != null) 'quiz_approved': quizApproved,
      if (faqApproved != null) 'faq_approved': faqApproved,
      if (notificationTitle != null) 'notification_title': notificationTitle,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TempNewsCachesCompanion copyWith(
      {Value<String>? newsId,
      Value<String>? title,
      Value<String>? description,
      Value<Category?>? category,
      Value<String?>? language,
      Value<String?>? url,
      Value<String?>? urlToImage,
      Value<String?>? priority,
      Value<DateTime?>? publishedOn,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<List<String>>? tags,
      Value<List<NewsFaq>>? faq,
      Value<Poll?>? poll,
      Value<List<NewsDoubts>?>? doubts,
      Value<List<NewsSection>?>? sections,
      Value<String?>? originalTitle,
      Value<String?>? formattedDescription,
      Value<Source?>? source,
      Value<bool?>? pollApproved,
      Value<bool?>? quizApproved,
      Value<bool?>? faqApproved,
      Value<String?>? notificationTitle,
      Value<int>? rowid}) {
    return TempNewsCachesCompanion(
      newsId: newsId ?? this.newsId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      language: language ?? this.language,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      priority: priority ?? this.priority,
      publishedOn: publishedOn ?? this.publishedOn,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
      faq: faq ?? this.faq,
      poll: poll ?? this.poll,
      doubts: doubts ?? this.doubts,
      sections: sections ?? this.sections,
      originalTitle: originalTitle ?? this.originalTitle,
      formattedDescription: formattedDescription ?? this.formattedDescription,
      source: source ?? this.source,
      pollApproved: pollApproved ?? this.pollApproved,
      quizApproved: quizApproved ?? this.quizApproved,
      faqApproved: faqApproved ?? this.faqApproved,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      final converter = $TempNewsCachesTable.$convertercategoryn;

      map['category'] = Variable<String>(converter.toSql(category.value));
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (publishedOn.present) {
      map['published_on'] = Variable<DateTime>(publishedOn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (tags.present) {
      final converter = $TempNewsCachesTable.$convertertags;

      map['tags'] = Variable<String>(converter.toSql(tags.value));
    }
    if (faq.present) {
      final converter = $TempNewsCachesTable.$converterfaq;

      map['faq'] = Variable<String>(converter.toSql(faq.value));
    }
    if (poll.present) {
      final converter = $TempNewsCachesTable.$converterpolln;

      map['poll'] = Variable<String>(converter.toSql(poll.value));
    }
    if (doubts.present) {
      final converter = $TempNewsCachesTable.$converterdoubtsn;

      map['doubts'] = Variable<String>(converter.toSql(doubts.value));
    }
    if (sections.present) {
      final converter = $TempNewsCachesTable.$convertersectionsn;

      map['sections'] = Variable<String>(converter.toSql(sections.value));
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (formattedDescription.present) {
      map['formatted_description'] =
          Variable<String>(formattedDescription.value);
    }
    if (source.present) {
      final converter = $TempNewsCachesTable.$convertersourcen;

      map['source'] = Variable<String>(converter.toSql(source.value));
    }
    if (pollApproved.present) {
      map['poll_approved'] = Variable<bool>(pollApproved.value);
    }
    if (quizApproved.present) {
      map['quiz_approved'] = Variable<bool>(quizApproved.value);
    }
    if (faqApproved.present) {
      map['faq_approved'] = Variable<bool>(faqApproved.value);
    }
    if (notificationTitle.present) {
      map['notification_title'] = Variable<String>(notificationTitle.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TempNewsCachesCompanion(')
          ..write('newsId: $newsId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('priority: $priority, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('faq: $faq, ')
          ..write('poll: $poll, ')
          ..write('doubts: $doubts, ')
          ..write('sections: $sections, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('formattedDescription: $formattedDescription, ')
          ..write('source: $source, ')
          ..write('pollApproved: $pollApproved, ')
          ..write('quizApproved: $quizApproved, ')
          ..write('faqApproved: $faqApproved, ')
          ..write('notificationTitle: $notificationTitle, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryNewsCacheTable extends CategoryNewsCache
    with TableInfo<$CategoryNewsCacheTable, CategoryNewsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryNewsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category?, String> category =
      GeneratedColumn<String>('category', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Category?>(
              $CategoryNewsCacheTable.$convertercategoryn);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedOnMeta =
      const VerificationMeta('publishedOn');
  @override
  late final GeneratedColumn<DateTime> publishedOn = GeneratedColumn<DateTime>(
      'published_on', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($CategoryNewsCacheTable.$convertertags);
  static const VerificationMeta _faqMeta = const VerificationMeta('faq');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsFaq>, String> faq =
      GeneratedColumn<String>('faq', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<NewsFaq>>($CategoryNewsCacheTable.$converterfaq);
  static const VerificationMeta _pollMeta = const VerificationMeta('poll');
  @override
  late final GeneratedColumnWithTypeConverter<Poll?, String> poll =
      GeneratedColumn<String>('poll', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Poll?>($CategoryNewsCacheTable.$converterpolln);
  static const VerificationMeta _doubtsMeta = const VerificationMeta('doubts');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsDoubts>?, String>
      doubts = GeneratedColumn<String>('doubts', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<NewsDoubts>?>(
              $CategoryNewsCacheTable.$converterdoubtsn);
  static const VerificationMeta _sectionsMeta =
      const VerificationMeta('sections');
  @override
  late final GeneratedColumnWithTypeConverter<List<NewsSection>?, String>
      sections = GeneratedColumn<String>('sections', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<NewsSection>?>(
              $CategoryNewsCacheTable.$convertersectionsn);
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _formattedDescriptionMeta =
      const VerificationMeta('formattedDescription');
  @override
  late final GeneratedColumn<String> formattedDescription =
      GeneratedColumn<String>('formatted_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumnWithTypeConverter<Source?, String> source =
      GeneratedColumn<String>('source', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Source?>($CategoryNewsCacheTable.$convertersourcen);
  static const VerificationMeta _pollApprovedMeta =
      const VerificationMeta('pollApproved');
  @override
  late final GeneratedColumn<bool> pollApproved = GeneratedColumn<bool>(
      'poll_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("poll_approved" IN (0, 1))'));
  static const VerificationMeta _quizApprovedMeta =
      const VerificationMeta('quizApproved');
  @override
  late final GeneratedColumn<bool> quizApproved = GeneratedColumn<bool>(
      'quiz_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("quiz_approved" IN (0, 1))'));
  static const VerificationMeta _faqApprovedMeta =
      const VerificationMeta('faqApproved');
  @override
  late final GeneratedColumn<bool> faqApproved = GeneratedColumn<bool>(
      'faq_approved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("faq_approved" IN (0, 1))'));
  static const VerificationMeta _notificationTitleMeta =
      const VerificationMeta('notificationTitle');
  @override
  late final GeneratedColumn<String> notificationTitle =
      GeneratedColumn<String>('notification_title', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        newsId,
        categoryId,
        title,
        description,
        category,
        language,
        url,
        urlToImage,
        priority,
        publishedOn,
        createdAt,
        updatedAt,
        tags,
        faq,
        poll,
        doubts,
        sections,
        originalTitle,
        formattedDescription,
        source,
        pollApproved,
        quizApproved,
        faqApproved,
        notificationTitle
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_news_cache';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoryNewsCacheData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_categoryMeta, const VerificationResult.success());
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('published_on')) {
      context.handle(
          _publishedOnMeta,
          publishedOn.isAcceptableOrUnknown(
              data['published_on']!, _publishedOnMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_faqMeta, const VerificationResult.success());
    context.handle(_pollMeta, const VerificationResult.success());
    context.handle(_doubtsMeta, const VerificationResult.success());
    context.handle(_sectionsMeta, const VerificationResult.success());
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('formatted_description')) {
      context.handle(
          _formattedDescriptionMeta,
          formattedDescription.isAcceptableOrUnknown(
              data['formatted_description']!, _formattedDescriptionMeta));
    }
    context.handle(_sourceMeta, const VerificationResult.success());
    if (data.containsKey('poll_approved')) {
      context.handle(
          _pollApprovedMeta,
          pollApproved.isAcceptableOrUnknown(
              data['poll_approved']!, _pollApprovedMeta));
    }
    if (data.containsKey('quiz_approved')) {
      context.handle(
          _quizApprovedMeta,
          quizApproved.isAcceptableOrUnknown(
              data['quiz_approved']!, _quizApprovedMeta));
    }
    if (data.containsKey('faq_approved')) {
      context.handle(
          _faqApprovedMeta,
          faqApproved.isAcceptableOrUnknown(
              data['faq_approved']!, _faqApprovedMeta));
    }
    if (data.containsKey('notification_title')) {
      context.handle(
          _notificationTitleMeta,
          notificationTitle.isAcceptableOrUnknown(
              data['notification_title']!, _notificationTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CategoryNewsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryNewsCacheData(
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: $CategoryNewsCacheTable.$convertercategoryn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}category'])),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority']),
      publishedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_on']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      tags: $CategoryNewsCacheTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      faq: $CategoryNewsCacheTable.$converterfaq.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faq'])!),
      poll: $CategoryNewsCacheTable.$converterpolln.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poll'])),
      doubts: $CategoryNewsCacheTable.$converterdoubtsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doubts'])),
      sections: $CategoryNewsCacheTable.$convertersectionsn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}sections'])),
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title']),
      formattedDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}formatted_description']),
      source: $CategoryNewsCacheTable.$convertersourcen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])),
      pollApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}poll_approved']),
      quizApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}quiz_approved']),
      faqApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}faq_approved']),
      notificationTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}notification_title']),
    );
  }

  @override
  $CategoryNewsCacheTable createAlias(String alias) {
    return $CategoryNewsCacheTable(attachedDatabase, alias);
  }

  static TypeConverter<Category, String> $convertercategory =
      CategoryConvertor();
  static TypeConverter<Category?, String?> $convertercategoryn =
      NullAwareTypeConverter.wrap($convertercategory);
  static TypeConverter<List<String>, String> $convertertags =
      StringListConvertor();
  static TypeConverter<List<NewsFaq>, String> $converterfaq =
      FaqListConvertor();
  static TypeConverter<Poll, String> $converterpoll = PollConvertor();
  static TypeConverter<Poll?, String?> $converterpolln =
      NullAwareTypeConverter.wrap($converterpoll);
  static TypeConverter<List<NewsDoubts>, String> $converterdoubts =
      GenericListConvertor(
          fromJson: (json) => NewsDoubts.fromJson(json),
          toJson: (doubt) => doubt.toJson());
  static TypeConverter<List<NewsDoubts>?, String?> $converterdoubtsn =
      NullAwareTypeConverter.wrap($converterdoubts);
  static TypeConverter<List<NewsSection>, String> $convertersections =
      GenericListConvertor(
          fromJson: (json) => NewsSection.fromJson(json),
          toJson: (section) => section.toJson());
  static TypeConverter<List<NewsSection>?, String?> $convertersectionsn =
      NullAwareTypeConverter.wrap($convertersections);
  static TypeConverter<Source, String> $convertersource = GenericConvertor(
      fromJson: (json) => Source.fromJson(json),
      toJson: (fact) => fact.toJson());
  static TypeConverter<Source?, String?> $convertersourcen =
      NullAwareTypeConverter.wrap($convertersource);
}

class CategoryNewsCacheData extends DataClass
    implements Insertable<CategoryNewsCacheData> {
  final String newsId;
  final String categoryId;
  final String title;
  final String description;
  final Category? category;
  final String? language;
  final String? url;
  final String? urlToImage;
  final String? priority;
  final DateTime? publishedOn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String> tags;
  final List<NewsFaq> faq;
  final Poll? poll;
  final List<NewsDoubts>? doubts;
  final List<NewsSection>? sections;
  final String? originalTitle;
  final String? formattedDescription;
  final Source? source;
  final bool? pollApproved;
  final bool? quizApproved;
  final bool? faqApproved;
  final String? notificationTitle;
  const CategoryNewsCacheData(
      {required this.newsId,
      required this.categoryId,
      required this.title,
      required this.description,
      this.category,
      this.language,
      this.url,
      this.urlToImage,
      this.priority,
      this.publishedOn,
      this.createdAt,
      this.updatedAt,
      required this.tags,
      required this.faq,
      this.poll,
      this.doubts,
      this.sections,
      this.originalTitle,
      this.formattedDescription,
      this.source,
      this.pollApproved,
      this.quizApproved,
      this.faqApproved,
      this.notificationTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_id'] = Variable<String>(newsId);
    map['category_id'] = Variable<String>(categoryId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || category != null) {
      final converter = $CategoryNewsCacheTable.$convertercategoryn;
      map['category'] = Variable<String>(converter.toSql(category));
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<String>(priority);
    }
    if (!nullToAbsent || publishedOn != null) {
      map['published_on'] = Variable<DateTime>(publishedOn);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    {
      final converter = $CategoryNewsCacheTable.$convertertags;
      map['tags'] = Variable<String>(converter.toSql(tags));
    }
    {
      final converter = $CategoryNewsCacheTable.$converterfaq;
      map['faq'] = Variable<String>(converter.toSql(faq));
    }
    if (!nullToAbsent || poll != null) {
      final converter = $CategoryNewsCacheTable.$converterpolln;
      map['poll'] = Variable<String>(converter.toSql(poll));
    }
    if (!nullToAbsent || doubts != null) {
      final converter = $CategoryNewsCacheTable.$converterdoubtsn;
      map['doubts'] = Variable<String>(converter.toSql(doubts));
    }
    if (!nullToAbsent || sections != null) {
      final converter = $CategoryNewsCacheTable.$convertersectionsn;
      map['sections'] = Variable<String>(converter.toSql(sections));
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || formattedDescription != null) {
      map['formatted_description'] = Variable<String>(formattedDescription);
    }
    if (!nullToAbsent || source != null) {
      final converter = $CategoryNewsCacheTable.$convertersourcen;
      map['source'] = Variable<String>(converter.toSql(source));
    }
    if (!nullToAbsent || pollApproved != null) {
      map['poll_approved'] = Variable<bool>(pollApproved);
    }
    if (!nullToAbsent || quizApproved != null) {
      map['quiz_approved'] = Variable<bool>(quizApproved);
    }
    if (!nullToAbsent || faqApproved != null) {
      map['faq_approved'] = Variable<bool>(faqApproved);
    }
    if (!nullToAbsent || notificationTitle != null) {
      map['notification_title'] = Variable<String>(notificationTitle);
    }
    return map;
  }

  CategoryNewsCacheCompanion toCompanion(bool nullToAbsent) {
    return CategoryNewsCacheCompanion(
      newsId: Value(newsId),
      categoryId: Value(categoryId),
      title: Value(title),
      description: Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      publishedOn: publishedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedOn),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      tags: Value(tags),
      faq: Value(faq),
      poll: poll == null && nullToAbsent ? const Value.absent() : Value(poll),
      doubts:
          doubts == null && nullToAbsent ? const Value.absent() : Value(doubts),
      sections: sections == null && nullToAbsent
          ? const Value.absent()
          : Value(sections),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      formattedDescription: formattedDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(formattedDescription),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      pollApproved: pollApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(pollApproved),
      quizApproved: quizApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(quizApproved),
      faqApproved: faqApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(faqApproved),
      notificationTitle: notificationTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationTitle),
    );
  }

  factory CategoryNewsCacheData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryNewsCacheData(
      newsId: serializer.fromJson<String>(json['newsId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<Category?>(json['category']),
      language: serializer.fromJson<String?>(json['language']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      priority: serializer.fromJson<String?>(json['priority']),
      publishedOn: serializer.fromJson<DateTime?>(json['publishedOn']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      faq: serializer.fromJson<List<NewsFaq>>(json['faq']),
      poll: serializer.fromJson<Poll?>(json['poll']),
      doubts: serializer.fromJson<List<NewsDoubts>?>(json['doubts']),
      sections: serializer.fromJson<List<NewsSection>?>(json['sections']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      formattedDescription:
          serializer.fromJson<String?>(json['formattedDescription']),
      source: serializer.fromJson<Source?>(json['source']),
      pollApproved: serializer.fromJson<bool?>(json['pollApproved']),
      quizApproved: serializer.fromJson<bool?>(json['quizApproved']),
      faqApproved: serializer.fromJson<bool?>(json['faqApproved']),
      notificationTitle:
          serializer.fromJson<String?>(json['notificationTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsId': serializer.toJson<String>(newsId),
      'categoryId': serializer.toJson<String>(categoryId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<Category?>(category),
      'language': serializer.toJson<String?>(language),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'priority': serializer.toJson<String?>(priority),
      'publishedOn': serializer.toJson<DateTime?>(publishedOn),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'tags': serializer.toJson<List<String>>(tags),
      'faq': serializer.toJson<List<NewsFaq>>(faq),
      'poll': serializer.toJson<Poll?>(poll),
      'doubts': serializer.toJson<List<NewsDoubts>?>(doubts),
      'sections': serializer.toJson<List<NewsSection>?>(sections),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'formattedDescription': serializer.toJson<String?>(formattedDescription),
      'source': serializer.toJson<Source?>(source),
      'pollApproved': serializer.toJson<bool?>(pollApproved),
      'quizApproved': serializer.toJson<bool?>(quizApproved),
      'faqApproved': serializer.toJson<bool?>(faqApproved),
      'notificationTitle': serializer.toJson<String?>(notificationTitle),
    };
  }

  CategoryNewsCacheData copyWith(
          {String? newsId,
          String? categoryId,
          String? title,
          String? description,
          Value<Category?> category = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> urlToImage = const Value.absent(),
          Value<String?> priority = const Value.absent(),
          Value<DateTime?> publishedOn = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          List<String>? tags,
          List<NewsFaq>? faq,
          Value<Poll?> poll = const Value.absent(),
          Value<List<NewsDoubts>?> doubts = const Value.absent(),
          Value<List<NewsSection>?> sections = const Value.absent(),
          Value<String?> originalTitle = const Value.absent(),
          Value<String?> formattedDescription = const Value.absent(),
          Value<Source?> source = const Value.absent(),
          Value<bool?> pollApproved = const Value.absent(),
          Value<bool?> quizApproved = const Value.absent(),
          Value<bool?> faqApproved = const Value.absent(),
          Value<String?> notificationTitle = const Value.absent()}) =>
      CategoryNewsCacheData(
        newsId: newsId ?? this.newsId,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category.present ? category.value : this.category,
        language: language.present ? language.value : this.language,
        url: url.present ? url.value : this.url,
        urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
        priority: priority.present ? priority.value : this.priority,
        publishedOn: publishedOn.present ? publishedOn.value : this.publishedOn,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        tags: tags ?? this.tags,
        faq: faq ?? this.faq,
        poll: poll.present ? poll.value : this.poll,
        doubts: doubts.present ? doubts.value : this.doubts,
        sections: sections.present ? sections.value : this.sections,
        originalTitle:
            originalTitle.present ? originalTitle.value : this.originalTitle,
        formattedDescription: formattedDescription.present
            ? formattedDescription.value
            : this.formattedDescription,
        source: source.present ? source.value : this.source,
        pollApproved:
            pollApproved.present ? pollApproved.value : this.pollApproved,
        quizApproved:
            quizApproved.present ? quizApproved.value : this.quizApproved,
        faqApproved: faqApproved.present ? faqApproved.value : this.faqApproved,
        notificationTitle: notificationTitle.present
            ? notificationTitle.value
            : this.notificationTitle,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryNewsCacheData(')
          ..write('newsId: $newsId, ')
          ..write('categoryId: $categoryId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('priority: $priority, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('faq: $faq, ')
          ..write('poll: $poll, ')
          ..write('doubts: $doubts, ')
          ..write('sections: $sections, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('formattedDescription: $formattedDescription, ')
          ..write('source: $source, ')
          ..write('pollApproved: $pollApproved, ')
          ..write('quizApproved: $quizApproved, ')
          ..write('faqApproved: $faqApproved, ')
          ..write('notificationTitle: $notificationTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        newsId,
        categoryId,
        title,
        description,
        category,
        language,
        url,
        urlToImage,
        priority,
        publishedOn,
        createdAt,
        updatedAt,
        tags,
        faq,
        poll,
        doubts,
        sections,
        originalTitle,
        formattedDescription,
        source,
        pollApproved,
        quizApproved,
        faqApproved,
        notificationTitle
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryNewsCacheData &&
          other.newsId == this.newsId &&
          other.categoryId == this.categoryId &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.language == this.language &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.priority == this.priority &&
          other.publishedOn == this.publishedOn &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.tags == this.tags &&
          other.faq == this.faq &&
          other.poll == this.poll &&
          other.doubts == this.doubts &&
          other.sections == this.sections &&
          other.originalTitle == this.originalTitle &&
          other.formattedDescription == this.formattedDescription &&
          other.source == this.source &&
          other.pollApproved == this.pollApproved &&
          other.quizApproved == this.quizApproved &&
          other.faqApproved == this.faqApproved &&
          other.notificationTitle == this.notificationTitle);
}

class CategoryNewsCacheCompanion
    extends UpdateCompanion<CategoryNewsCacheData> {
  final Value<String> newsId;
  final Value<String> categoryId;
  final Value<String> title;
  final Value<String> description;
  final Value<Category?> category;
  final Value<String?> language;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<String?> priority;
  final Value<DateTime?> publishedOn;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<List<String>> tags;
  final Value<List<NewsFaq>> faq;
  final Value<Poll?> poll;
  final Value<List<NewsDoubts>?> doubts;
  final Value<List<NewsSection>?> sections;
  final Value<String?> originalTitle;
  final Value<String?> formattedDescription;
  final Value<Source?> source;
  final Value<bool?> pollApproved;
  final Value<bool?> quizApproved;
  final Value<bool?> faqApproved;
  final Value<String?> notificationTitle;
  final Value<int> rowid;
  const CategoryNewsCacheCompanion({
    this.newsId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.priority = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.faq = const Value.absent(),
    this.poll = const Value.absent(),
    this.doubts = const Value.absent(),
    this.sections = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.formattedDescription = const Value.absent(),
    this.source = const Value.absent(),
    this.pollApproved = const Value.absent(),
    this.quizApproved = const Value.absent(),
    this.faqApproved = const Value.absent(),
    this.notificationTitle = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryNewsCacheCompanion.insert({
    required String newsId,
    required String categoryId,
    required String title,
    required String description,
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.priority = const Value.absent(),
    this.publishedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required List<String> tags,
    required List<NewsFaq> faq,
    this.poll = const Value.absent(),
    this.doubts = const Value.absent(),
    this.sections = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.formattedDescription = const Value.absent(),
    this.source = const Value.absent(),
    this.pollApproved = const Value.absent(),
    this.quizApproved = const Value.absent(),
    this.faqApproved = const Value.absent(),
    this.notificationTitle = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : newsId = Value(newsId),
        categoryId = Value(categoryId),
        title = Value(title),
        description = Value(description),
        tags = Value(tags),
        faq = Value(faq);
  static Insertable<CategoryNewsCacheData> custom({
    Expression<String>? newsId,
    Expression<String>? categoryId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? language,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? priority,
    Expression<DateTime>? publishedOn,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? tags,
    Expression<String>? faq,
    Expression<String>? poll,
    Expression<String>? doubts,
    Expression<String>? sections,
    Expression<String>? originalTitle,
    Expression<String>? formattedDescription,
    Expression<String>? source,
    Expression<bool>? pollApproved,
    Expression<bool>? quizApproved,
    Expression<bool>? faqApproved,
    Expression<String>? notificationTitle,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (newsId != null) 'news_id': newsId,
      if (categoryId != null) 'category_id': categoryId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (language != null) 'language': language,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (priority != null) 'priority': priority,
      if (publishedOn != null) 'published_on': publishedOn,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (tags != null) 'tags': tags,
      if (faq != null) 'faq': faq,
      if (poll != null) 'poll': poll,
      if (doubts != null) 'doubts': doubts,
      if (sections != null) 'sections': sections,
      if (originalTitle != null) 'original_title': originalTitle,
      if (formattedDescription != null)
        'formatted_description': formattedDescription,
      if (source != null) 'source': source,
      if (pollApproved != null) 'poll_approved': pollApproved,
      if (quizApproved != null) 'quiz_approved': quizApproved,
      if (faqApproved != null) 'faq_approved': faqApproved,
      if (notificationTitle != null) 'notification_title': notificationTitle,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryNewsCacheCompanion copyWith(
      {Value<String>? newsId,
      Value<String>? categoryId,
      Value<String>? title,
      Value<String>? description,
      Value<Category?>? category,
      Value<String?>? language,
      Value<String?>? url,
      Value<String?>? urlToImage,
      Value<String?>? priority,
      Value<DateTime?>? publishedOn,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<List<String>>? tags,
      Value<List<NewsFaq>>? faq,
      Value<Poll?>? poll,
      Value<List<NewsDoubts>?>? doubts,
      Value<List<NewsSection>?>? sections,
      Value<String?>? originalTitle,
      Value<String?>? formattedDescription,
      Value<Source?>? source,
      Value<bool?>? pollApproved,
      Value<bool?>? quizApproved,
      Value<bool?>? faqApproved,
      Value<String?>? notificationTitle,
      Value<int>? rowid}) {
    return CategoryNewsCacheCompanion(
      newsId: newsId ?? this.newsId,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      language: language ?? this.language,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      priority: priority ?? this.priority,
      publishedOn: publishedOn ?? this.publishedOn,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
      faq: faq ?? this.faq,
      poll: poll ?? this.poll,
      doubts: doubts ?? this.doubts,
      sections: sections ?? this.sections,
      originalTitle: originalTitle ?? this.originalTitle,
      formattedDescription: formattedDescription ?? this.formattedDescription,
      source: source ?? this.source,
      pollApproved: pollApproved ?? this.pollApproved,
      quizApproved: quizApproved ?? this.quizApproved,
      faqApproved: faqApproved ?? this.faqApproved,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      final converter = $CategoryNewsCacheTable.$convertercategoryn;

      map['category'] = Variable<String>(converter.toSql(category.value));
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (publishedOn.present) {
      map['published_on'] = Variable<DateTime>(publishedOn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (tags.present) {
      final converter = $CategoryNewsCacheTable.$convertertags;

      map['tags'] = Variable<String>(converter.toSql(tags.value));
    }
    if (faq.present) {
      final converter = $CategoryNewsCacheTable.$converterfaq;

      map['faq'] = Variable<String>(converter.toSql(faq.value));
    }
    if (poll.present) {
      final converter = $CategoryNewsCacheTable.$converterpolln;

      map['poll'] = Variable<String>(converter.toSql(poll.value));
    }
    if (doubts.present) {
      final converter = $CategoryNewsCacheTable.$converterdoubtsn;

      map['doubts'] = Variable<String>(converter.toSql(doubts.value));
    }
    if (sections.present) {
      final converter = $CategoryNewsCacheTable.$convertersectionsn;

      map['sections'] = Variable<String>(converter.toSql(sections.value));
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (formattedDescription.present) {
      map['formatted_description'] =
          Variable<String>(formattedDescription.value);
    }
    if (source.present) {
      final converter = $CategoryNewsCacheTable.$convertersourcen;

      map['source'] = Variable<String>(converter.toSql(source.value));
    }
    if (pollApproved.present) {
      map['poll_approved'] = Variable<bool>(pollApproved.value);
    }
    if (quizApproved.present) {
      map['quiz_approved'] = Variable<bool>(quizApproved.value);
    }
    if (faqApproved.present) {
      map['faq_approved'] = Variable<bool>(faqApproved.value);
    }
    if (notificationTitle.present) {
      map['notification_title'] = Variable<String>(notificationTitle.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryNewsCacheCompanion(')
          ..write('newsId: $newsId, ')
          ..write('categoryId: $categoryId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('priority: $priority, ')
          ..write('publishedOn: $publishedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('faq: $faq, ')
          ..write('poll: $poll, ')
          ..write('doubts: $doubts, ')
          ..write('sections: $sections, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('formattedDescription: $formattedDescription, ')
          ..write('source: $source, ')
          ..write('pollApproved: $pollApproved, ')
          ..write('quizApproved: $quizApproved, ')
          ..write('faqApproved: $faqApproved, ')
          ..write('notificationTitle: $notificationTitle, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppLocalDB extends GeneratedDatabase {
  _$AppLocalDB(QueryExecutor e) : super(e);
  late final $LocalSessionTable localSession = $LocalSessionTable(this);
  late final $NewsLogsTable newsLogs = $NewsLogsTable(this);
  late final $UnreadNewsTable unreadNews = $UnreadNewsTable(this);
  late final $NewsBookmarksTable newsBookmarks = $NewsBookmarksTable(this);
  late final $UnreadThreadTable unreadThread = $UnreadThreadTable(this);
  late final $ShowCaseActionsTable showCaseActions =
      $ShowCaseActionsTable(this);
  late final $TempNewsCachesTable tempNewsCaches = $TempNewsCachesTable(this);
  late final $CategoryNewsCacheTable categoryNewsCache =
      $CategoryNewsCacheTable(this);
  late final LocalSessionsDao localSessionsDao =
      LocalSessionsDao(this as AppLocalDB);
  late final NewsLogsDao newsLogsDao = NewsLogsDao(this as AppLocalDB);
  late final UnreadNewsDao unreadNewsDao = UnreadNewsDao(this as AppLocalDB);
  late final NewsBookmarksDao newsBookmarksDao =
      NewsBookmarksDao(this as AppLocalDB);
  late final UnreadThreadDao unreadThreadDao =
      UnreadThreadDao(this as AppLocalDB);
  late final ShowCaseActionsDao showCaseActionsDao =
      ShowCaseActionsDao(this as AppLocalDB);
  late final TempNewsCacheDao tempNewsCacheDao =
      TempNewsCacheDao(this as AppLocalDB);
  late final CategoryNewsCacheDao categoryNewsCacheDao =
      CategoryNewsCacheDao(this as AppLocalDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        localSession,
        newsLogs,
        unreadNews,
        newsBookmarks,
        unreadThread,
        showCaseActions,
        tempNewsCaches,
        categoryNewsCache
      ];
}
