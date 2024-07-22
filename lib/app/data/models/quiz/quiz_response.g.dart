// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResponseImpl _$$QuizResponseImplFromJson(Map<String, dynamic> json) =>
    _$QuizResponseImpl(
      id: json['_id'] as String,
      quiz: json['quiz'] as String,
      article: json['article'] as String,
      user: json['user'] as String,
      answer: json['answer'] as String,
      isCorrect: json['isCorrect'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$QuizResponseImplToJson(_$QuizResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'quiz': instance.quiz,
      'article': instance.article,
      'user': instance.user,
      'answer': instance.answer,
      'isCorrect': instance.isCorrect,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
