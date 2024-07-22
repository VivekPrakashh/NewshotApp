// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      language: json['language'] as String?,
      tags: json['tags'] as List<dynamic>?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedOn: json['publishedOn'] == null
          ? null
          : DateTime.parse(json['publishedOn'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      faq: (json['faq'] as List<dynamic>?)
              ?.map((e) => NewsFaq.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      doubts: (json['doubts'] as List<dynamic>?)
              ?.map((e) => NewsDoubts.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => NewsSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      formattedDescription: json['formattedDescription'] as String?,
      originalTitle: json['originalTitle'] as String?,
      quizApproved: json['quizApproved'] == null
          ? false
          : quizApprovedFromJson(json['quizApproved']),
      pollApproved: json['pollApproved'] == null
          ? false
          : quizApprovedFromJson(json['pollApproved']),
      faqApproved: json['faqApproved'] == null
          ? false
          : quizApprovedFromJson(json['faqApproved']),
      notificationTitle: json['notificationTitle'] as String?,
      xUrl: json['xUrl'] as String?,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'language': instance.language,
      'tags': instance.tags,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedOn': instance.publishedOn?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'faq': instance.faq,
      'doubts': instance.doubts,
      'sections': instance.sections,
      'poll': instance.poll,
      'formattedDescription': instance.formattedDescription,
      'originalTitle': instance.originalTitle,
      'quizApproved': instance.quizApproved,
      'pollApproved': instance.pollApproved,
      'faqApproved': instance.faqApproved,
      'notificationTitle': instance.notificationTitle,
      'xUrl': instance.xUrl,
    };

_$PollImpl _$$PollImplFromJson(Map<String, dynamic> json) => _$PollImpl(
      id: json['_id'] as String,
      question: json['question'] as String,
      results: Map<String, int>.from(json['results'] as Map),
      yesOption: json['yesOption'] as String,
      noOption: json['noOption'] as String,
    );

Map<String, dynamic> _$$PollImplToJson(_$PollImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'results': instance.results,
      'yesOption': instance.yesOption,
      'noOption': instance.noOption,
    };

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$NewsFaqImpl _$$NewsFaqImplFromJson(Map<String, dynamic> json) =>
    _$NewsFaqImpl(
      id: json['_id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String? ?? "",
      imgUrl: json['imgUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$$NewsFaqImplToJson(_$NewsFaqImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'imgUrl': instance.imgUrl,
      'videoUrl': instance.videoUrl,
    };

_$NewsDoubtsImpl _$$NewsDoubtsImplFromJson(Map<String, dynamic> json) =>
    _$NewsDoubtsImpl(
      doubt: json['doubt'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$NewsDoubtsImplToJson(_$NewsDoubtsImpl instance) =>
    <String, dynamic>{
      'doubt': instance.doubt,
      'answer': instance.answer,
    };
