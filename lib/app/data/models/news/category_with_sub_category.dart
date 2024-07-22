import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';

import 'sub_category.dart';
part 'category_with_sub_category.freezed.dart';
part 'category_with_sub_category.g.dart';

@freezed
class CategoryWithSubCategory with _$CategoryWithSubCategory {
  const factory CategoryWithSubCategory({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String name,
    required String createdBy,
    required String createdAt,
    required String updatedAt,
    required String hindiName,
    @Default([]) List<SubCategory> subcategories,
  }) = _CategoryWithSubCategory;

  factory CategoryWithSubCategory.fromJson(Map<String, dynamic> json) =>
      _$CategoryWithSubCategoryFromJson(json);
}

extension CategoryX on CategoryWithSubCategory {
  String get getCategoryName => Get.locale!.isEnglish() ? name : hindiName;
}
