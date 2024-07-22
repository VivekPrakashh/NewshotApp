import 'package:freezed_annotation/freezed_annotation.dart';
part 'thread.freezed.dart';
part 'thread.g.dart';

@freezed
class Thread with _$Thread {
  const factory Thread({
    ThreadSource? source,
    @JsonKey(name: '_id') required String id,
    String? contentTitle,
    @Default([]) List<Fact> facts,
    @Default([]) List<String> tags,
    String? backgroundImgUrl,
    DateTime? publishedOn,
    String? threadTitle,
    String? titleHeader,
    String? titleFooter,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default('english') String language,
  }) = _Thread;

  factory Thread.fromJson(Map<String, dynamic> json) => _$ThreadFromJson(json);
}

@freezed
class Fact with _$Fact {
  const factory Fact({
    FactSource? source,
    @JsonKey(name: '_id') required String id,
    String? contentTitle,
    String? title,
    String? description,
    @Default([]) List<String> tags,
    required String imgUrl,
    DateTime? publishedOn,
    int? level,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? threadTitle,
    String? titleHeader,
    String? titleFooter,
    Language? language,
  }) = _Fact;

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
}

enum Language { english, hindi }

@freezed
class FactSource with _$FactSource {
  const factory FactSource({
    String? name,
    String? url,
  }) = _FactSource;

  factory FactSource.fromJson(Map<String, dynamic> json) =>
      _$FactSourceFromJson(json);
}

@freezed
class ThreadSource with _$ThreadSource {
  const factory ThreadSource({
    String? id,
    String? name,
  }) = _ThreadSource;

  factory ThreadSource.fromJson(Map<String, dynamic> json) =>
      _$ThreadSourceFromJson(json);
}
