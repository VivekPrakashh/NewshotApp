// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadImpl _$$ThreadImplFromJson(Map<String, dynamic> json) => _$ThreadImpl(
      source: json['source'] == null
          ? null
          : ThreadSource.fromJson(json['source'] as Map<String, dynamic>),
      id: json['_id'] as String,
      contentTitle: json['contentTitle'] as String?,
      facts: (json['facts'] as List<dynamic>?)
              ?.map((e) => Fact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      backgroundImgUrl: json['backgroundImgUrl'] as String?,
      publishedOn: json['publishedOn'] == null
          ? null
          : DateTime.parse(json['publishedOn'] as String),
      threadTitle: json['threadTitle'] as String?,
      titleHeader: json['titleHeader'] as String?,
      titleFooter: json['titleFooter'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      language: json['language'] as String? ?? 'english',
    );

Map<String, dynamic> _$$ThreadImplToJson(_$ThreadImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      '_id': instance.id,
      'contentTitle': instance.contentTitle,
      'facts': instance.facts,
      'tags': instance.tags,
      'backgroundImgUrl': instance.backgroundImgUrl,
      'publishedOn': instance.publishedOn?.toIso8601String(),
      'threadTitle': instance.threadTitle,
      'titleHeader': instance.titleHeader,
      'titleFooter': instance.titleFooter,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'language': instance.language,
    };

_$FactImpl _$$FactImplFromJson(Map<String, dynamic> json) => _$FactImpl(
      source: json['source'] == null
          ? null
          : FactSource.fromJson(json['source'] as Map<String, dynamic>),
      id: json['_id'] as String,
      contentTitle: json['contentTitle'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      imgUrl: json['imgUrl'] as String,
      publishedOn: json['publishedOn'] == null
          ? null
          : DateTime.parse(json['publishedOn'] as String),
      level: json['level'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      threadTitle: json['threadTitle'] as String?,
      titleHeader: json['titleHeader'] as String?,
      titleFooter: json['titleFooter'] as String?,
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$$FactImplToJson(_$FactImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      '_id': instance.id,
      'contentTitle': instance.contentTitle,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'imgUrl': instance.imgUrl,
      'publishedOn': instance.publishedOn?.toIso8601String(),
      'level': instance.level,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'threadTitle': instance.threadTitle,
      'titleHeader': instance.titleHeader,
      'titleFooter': instance.titleFooter,
      'language': _$LanguageEnumMap[instance.language],
    };

const _$LanguageEnumMap = {
  Language.english: 'english',
  Language.hindi: 'hindi',
};

_$FactSourceImpl _$$FactSourceImplFromJson(Map<String, dynamic> json) =>
    _$FactSourceImpl(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$FactSourceImplToJson(_$FactSourceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$ThreadSourceImpl _$$ThreadSourceImplFromJson(Map<String, dynamic> json) =>
    _$ThreadSourceImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ThreadSourceImplToJson(_$ThreadSourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
