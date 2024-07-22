// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsSectionImpl _$$NewsSectionImplFromJson(Map<String, dynamic> json) =>
    _$NewsSectionImpl(
      id: json['_id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      sourceUrl: json['sourceUrl'] as String?,
      sourceName: json['sourceName'] as String?,
    );

Map<String, dynamic> _$$NewsSectionImplToJson(_$NewsSectionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'sourceUrl': instance.sourceUrl,
      'sourceName': instance.sourceName,
    };
