import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';
import 'package:news_shots_app/app/data/models/news/news_section.dart';
part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    Source? source,
    // ignore: invalid_annotation_target
    @JsonKey(name: "_id") String? id,
    required String title,
    required String description,
    Category? category,
    String? language,
    List<dynamic>? tags,
    String? url,
    required String? urlToImage,
    DateTime? publishedOn,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<NewsFaq> faq,
    @Default([]) List<NewsDoubts> doubts,
    @Default([]) List<NewsSection> sections,
    Poll? poll,
    required String? formattedDescription,
    required String? originalTitle,
    @JsonKey(fromJson: quizApprovedFromJson) @Default(false) bool quizApproved,
    @JsonKey(fromJson: quizApprovedFromJson) @Default(false) bool pollApproved,
    @JsonKey(fromJson: quizApprovedFromJson) @Default(false) bool faqApproved,
    required String? notificationTitle,
    String? xUrl,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

quizApprovedFromJson(data) {
  if (data.runtimeType == String) {
    if (data == "true") {
      return true;
    }
    if (data == "approved") {
      return true;
    }
  }
  if (data.runtimeType == bool) {
    return data;
  }
  return false;
}

@freezed
class Poll with _$Poll {
  const factory Poll({
    @JsonKey(name: "_id") required String id,
    required String question,
    required Map<String, int> results,
    required String yesOption,
    required String noOption,
  }) = _Poll;

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    String? id,
    String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

@freezed
class NewsFaq with _$NewsFaq {
  const factory NewsFaq({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String question,
    @Default("") String answer,
    String? imgUrl,
    String? videoUrl,
  }) = _NewsFaq;

  factory NewsFaq.fromJson(Map<String, dynamic> json) =>
      _$NewsFaqFromJson(json);
}

@freezed
class NewsDoubts with _$NewsDoubts {
  const factory NewsDoubts({
    required String doubt,
    required String answer,
  }) = _NewsDoubts;

  factory NewsDoubts.fromJson(Map<String, dynamic> json) =>
      _$NewsDoubtsFromJson(json);
}


// "question": "DO you know",
//                     "answer": "We dont know",
//                     "imgUrl": "fff",
//                     "videoUrl": "ufas",
//                     "_id": "64957a0ff32666afa8916f3a"
