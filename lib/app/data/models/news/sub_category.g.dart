// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCategoryImpl _$$SubCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SubCategoryImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      isDelete: json['isDelete'] as bool? ?? false,
      parentCategory: json['parentCategory'] as String,
    );

Map<String, dynamic> _$$SubCategoryImplToJson(_$SubCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'hindiName': instance.hindiName,
      'isDelete': instance.isDelete,
      'parentCategory': instance.parentCategory,
    };
