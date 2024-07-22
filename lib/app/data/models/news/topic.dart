import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String name,
    required String imgUrl,
    required String hashtag,
    @Default("") String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String category,
    @Default([]) List<String> articleDisplayOrder,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}
