import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_response.freezed.dart';
part 'quiz_response.g.dart';

@freezed
class QuizResponse with _$QuizResponse {
  const factory QuizResponse({
    @JsonKey(name: "_id") required String id,
    required String quiz,
    required String article,
    required String user,
    required String answer,
    required bool isCorrect,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _QuizResponse;

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);
}
