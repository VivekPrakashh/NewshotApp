import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
part 'notification_log.freezed.dart';
part 'notification_log.g.dart';

@freezed
class NotificationLogs with _$NotificationLogs {
  const factory NotificationLogs({
    @JsonKey(name: "_id") required String id,
    required Article article,
  }) = _NotificationLogs;

  factory NotificationLogs.fromJson(Map<String, dynamic> json) =>
      _$NotificationLogsFromJson(json);
}

@freezed
class Article with _$Article {
  const factory Article({
    @JsonKey(name: "_id") required String id,
    required String notificationTitle,
    required String urlToImage,
    @JsonKey(fromJson: fromJsonCategory) String? category,
    // @JsonKey(readValue: fromJsonCategoryHindi) String? categoryHindi,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

fromJsonCategory(data) {
  return Get.locale!.isEnglish() ? data['name'] : data['hindiName'];
}

// fromJsonCategoryHindi(data, _) {
//   print(data);
//   return data['category']['hindiName'];
// }
