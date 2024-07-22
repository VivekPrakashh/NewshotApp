// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationLogsImpl _$$NotificationLogsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationLogsImpl(
      id: json['_id'] as String,
      article: Article.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationLogsImplToJson(
        _$NotificationLogsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'article': instance.article,
    };

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['_id'] as String,
      notificationTitle: json['notificationTitle'] as String,
      urlToImage: json['urlToImage'] as String,
      category: fromJsonCategory(json['category']),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'notificationTitle': instance.notificationTitle,
      'urlToImage': instance.urlToImage,
      'category': instance.category,
    };
