// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserDtoImpl _$$AppUserDtoImplFromJson(Map<String, dynamic> json) =>
    _$AppUserDtoImpl(
      id: json['_id'] as String,
      language: json['language'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      isBlocked: json['isBlocked'] as bool? ?? false,
      disabled: json['disabled'] as bool? ?? false,
      interests: json['interests'] as List<dynamic>? ?? const [],
      newsSeenToday: json['newsSeenToday'] as List<dynamic>? ?? const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppUserDtoImplToJson(_$AppUserDtoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'language': instance.language,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'city': instance.city,
      'state': instance.state,
      'isBlocked': instance.isBlocked,
      'disabled': instance.disabled,
      'interests': instance.interests,
      'newsSeenToday': instance.newsSeenToday,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
