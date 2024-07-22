// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: json['_id'] as String,
      question: json['question'] as String,
      a1: json['a1'] as String?,
      b1: json['b1'] as String?,
      c1: json['c1'] as String?,
      d1: json['d1'] as String?,
      correctOption: json['correctOption'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      article: json['article'] as String,
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'a1': instance.a1,
      'b1': instance.b1,
      'c1': instance.c1,
      'd1': instance.d1,
      'correctOption': instance.correctOption,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'article': instance.article,
    };
