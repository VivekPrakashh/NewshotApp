// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_with_sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryWithSubCategoryImpl _$$CategoryWithSubCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryWithSubCategoryImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      hindiName: json['hindiName'] as String,
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryWithSubCategoryImplToJson(
        _$CategoryWithSubCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'hindiName': instance.hindiName,
      'subcategories': instance.subcategories,
    };
