import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    @JsonKey(name: "_id") required String id,
    required String question,
    required String? a1,
    required String? b1,
    required String? c1,
    required String? d1,
    required String correctOption,
    // required int correctPoints,
    // required int wrongPoints,
    // required bool active,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String article,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

extension QuizX on Quiz {
  Map<String, String?> getAllOptionsMap() {
    final allOptionMap = {"a1": a1, "b1": b1, "c1": c1, "d1": d1};
    allOptionMap.removeWhere((key, value) => value == null);
    return allOptionMap;
  }

  (List<String> options, int correctOption) getOptions() {
    final data = toJson();
    // Extracting non-null dates from the given data and storing them in a list
    // final allOptionMap = {"a1": a1, "b1": b1, "c1": c1, "d1": d1};

    // allOptionMap.removeWhere((key, value) => value == null);

    List<String?> allOptions = [
      data["a1"],
      data["b1"],
      data["c1"],
      data["d1"],
    ];

    final List<String> options =
        List<String>.from(allOptions.where((element) => element != null));

    // Finding the correct index based on the correct option
    // String correctOption = this.correctOption;
    int? correctIndex;
    if (data.containsKey(correctOption)) {
      correctIndex = options.indexOf(data[correctOption]!);
    }
    if (correctIndex == null) {
      throw FlutterError("Invalid Quiz Options or correct Option not found");
    }

    // Output
    // print("Dates: $dates");
    print("Correct Index: $correctIndex");

    return (options, correctIndex);
  }
}
