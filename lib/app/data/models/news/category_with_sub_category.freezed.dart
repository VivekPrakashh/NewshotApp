// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_with_sub_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryWithSubCategory _$CategoryWithSubCategoryFromJson(
    Map<String, dynamic> json) {
  return _CategoryWithSubCategory.fromJson(json);
}

/// @nodoc
mixin _$CategoryWithSubCategory {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  List<SubCategory> get subcategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryWithSubCategoryCopyWith<CategoryWithSubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryWithSubCategoryCopyWith<$Res> {
  factory $CategoryWithSubCategoryCopyWith(CategoryWithSubCategory value,
          $Res Function(CategoryWithSubCategory) then) =
      _$CategoryWithSubCategoryCopyWithImpl<$Res, CategoryWithSubCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String createdBy,
      String createdAt,
      String updatedAt,
      String hindiName,
      List<SubCategory> subcategories});
}

/// @nodoc
class _$CategoryWithSubCategoryCopyWithImpl<$Res,
        $Val extends CategoryWithSubCategory>
    implements $CategoryWithSubCategoryCopyWith<$Res> {
  _$CategoryWithSubCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? hindiName = null,
    Object? subcategories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      subcategories: null == subcategories
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryWithSubCategoryImplCopyWith<$Res>
    implements $CategoryWithSubCategoryCopyWith<$Res> {
  factory _$$CategoryWithSubCategoryImplCopyWith(
          _$CategoryWithSubCategoryImpl value,
          $Res Function(_$CategoryWithSubCategoryImpl) then) =
      __$$CategoryWithSubCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String createdBy,
      String createdAt,
      String updatedAt,
      String hindiName,
      List<SubCategory> subcategories});
}

/// @nodoc
class __$$CategoryWithSubCategoryImplCopyWithImpl<$Res>
    extends _$CategoryWithSubCategoryCopyWithImpl<$Res,
        _$CategoryWithSubCategoryImpl>
    implements _$$CategoryWithSubCategoryImplCopyWith<$Res> {
  __$$CategoryWithSubCategoryImplCopyWithImpl(
      _$CategoryWithSubCategoryImpl _value,
      $Res Function(_$CategoryWithSubCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? hindiName = null,
    Object? subcategories = null,
  }) {
    return _then(_$CategoryWithSubCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      subcategories: null == subcategories
          ? _value._subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryWithSubCategoryImpl implements _CategoryWithSubCategory {
  const _$CategoryWithSubCategoryImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required this.hindiName,
      final List<SubCategory> subcategories = const []})
      : _subcategories = subcategories;

  factory _$CategoryWithSubCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryWithSubCategoryImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String hindiName;
  final List<SubCategory> _subcategories;
  @override
  @JsonKey()
  List<SubCategory> get subcategories {
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subcategories);
  }

  @override
  String toString() {
    return 'CategoryWithSubCategory(id: $id, name: $name, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, hindiName: $hindiName, subcategories: $subcategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryWithSubCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            const DeepCollectionEquality()
                .equals(other._subcategories, _subcategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdBy,
      createdAt,
      updatedAt,
      hindiName,
      const DeepCollectionEquality().hash(_subcategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryWithSubCategoryImplCopyWith<_$CategoryWithSubCategoryImpl>
      get copyWith => __$$CategoryWithSubCategoryImplCopyWithImpl<
          _$CategoryWithSubCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryWithSubCategoryImplToJson(
      this,
    );
  }
}

abstract class _CategoryWithSubCategory implements CategoryWithSubCategory {
  const factory _CategoryWithSubCategory(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String createdBy,
      required final String createdAt,
      required final String updatedAt,
      required final String hindiName,
      final List<SubCategory> subcategories}) = _$CategoryWithSubCategoryImpl;

  factory _CategoryWithSubCategory.fromJson(Map<String, dynamic> json) =
      _$CategoryWithSubCategoryImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get createdBy;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String get hindiName;
  @override
  List<SubCategory> get subcategories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryWithSubCategoryImplCopyWith<_$CategoryWithSubCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
