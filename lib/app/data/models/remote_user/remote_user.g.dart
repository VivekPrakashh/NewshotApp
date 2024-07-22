// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteUserImpl _$$RemoteUserImplFromJson(Map<String, dynamic> json) =>
    _$RemoteUserImpl(
      id: json['_id'] as String,
      preferencesAsked: json['preferencesAsked'] as bool? ?? false,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RemoteUserImplToJson(_$RemoteUserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'preferencesAsked': instance.preferencesAsked,
      'categories': instance.categories,
    };
