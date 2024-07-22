import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
part 'sub_category.freezed.dart';
part 'sub_category.g.dart';

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    // ignore: invalid_annotation_target
    @JsonKey(name: "_id") required String id,
    required String name,
    required String hindiName,
    @Default(false) bool isDelete,
    required String parentCategory,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}

extension SubCategoryX on SubCategory {
  String get getName => Get.locale!.isEnglish() ? name : hindiName;
}
