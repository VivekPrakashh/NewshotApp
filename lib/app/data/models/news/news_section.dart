import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_section.freezed.dart';
part 'news_section.g.dart';

@freezed
class NewsSection with _$NewsSection {
  const factory NewsSection({
    @JsonKey(name: "_id") required String id,
    required String question,
    required String answer,
    String? sourceUrl,
    String? sourceName,
  }) = _NewsSection;
  factory NewsSection.fromJson(Map<String, dynamic> json) =>
      _$NewsSectionFromJson(json);
}
