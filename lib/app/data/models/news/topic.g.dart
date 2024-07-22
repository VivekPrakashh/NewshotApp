// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      hashtag: json['hashtag'] as String,
      description: json['description'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      category: json['category'] as String,
      articleDisplayOrder: (json['articleDisplayOrder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'hashtag': instance.hashtag,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'category': instance.category,
      'articleDisplayOrder': instance.articleDisplayOrder,
    };
