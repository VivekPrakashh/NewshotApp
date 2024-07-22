// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return _Topic.fromJson(json);
}

/// @nodoc
mixin _$Topic {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String get hashtag => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get articleDisplayOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicCopyWith<Topic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicCopyWith<$Res> {
  factory $TopicCopyWith(Topic value, $Res Function(Topic) then) =
      _$TopicCopyWithImpl<$Res, Topic>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String imgUrl,
      String hashtag,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String category,
      List<String> articleDisplayOrder});
}

/// @nodoc
class _$TopicCopyWithImpl<$Res, $Val extends Topic>
    implements $TopicCopyWith<$Res> {
  _$TopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imgUrl = null,
    Object? hashtag = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? articleDisplayOrder = null,
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
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      articleDisplayOrder: null == articleDisplayOrder
          ? _value.articleDisplayOrder
          : articleDisplayOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicImplCopyWith<$Res> implements $TopicCopyWith<$Res> {
  factory _$$TopicImplCopyWith(
          _$TopicImpl value, $Res Function(_$TopicImpl) then) =
      __$$TopicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String imgUrl,
      String hashtag,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String category,
      List<String> articleDisplayOrder});
}

/// @nodoc
class __$$TopicImplCopyWithImpl<$Res>
    extends _$TopicCopyWithImpl<$Res, _$TopicImpl>
    implements _$$TopicImplCopyWith<$Res> {
  __$$TopicImplCopyWithImpl(
      _$TopicImpl _value, $Res Function(_$TopicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imgUrl = null,
    Object? hashtag = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? articleDisplayOrder = null,
  }) {
    return _then(_$TopicImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      articleDisplayOrder: null == articleDisplayOrder
          ? _value._articleDisplayOrder
          : articleDisplayOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicImpl implements _Topic {
  const _$TopicImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.imgUrl,
      required this.hashtag,
      this.description = "",
      required this.createdAt,
      required this.updatedAt,
      required this.category,
      final List<String> articleDisplayOrder = const []})
      : _articleDisplayOrder = articleDisplayOrder;

  factory _$TopicImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String imgUrl;
  @override
  final String hashtag;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String category;
  final List<String> _articleDisplayOrder;
  @override
  @JsonKey()
  List<String> get articleDisplayOrder {
    if (_articleDisplayOrder is EqualUnmodifiableListView)
      return _articleDisplayOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articleDisplayOrder);
  }

  @override
  String toString() {
    return 'Topic(id: $id, name: $name, imgUrl: $imgUrl, hashtag: $hashtag, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, articleDisplayOrder: $articleDisplayOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._articleDisplayOrder, _articleDisplayOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      imgUrl,
      hashtag,
      description,
      createdAt,
      updatedAt,
      category,
      const DeepCollectionEquality().hash(_articleDisplayOrder));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicImplCopyWith<_$TopicImpl> get copyWith =>
      __$$TopicImplCopyWithImpl<_$TopicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicImplToJson(
      this,
    );
  }
}

abstract class _Topic implements Topic {
  const factory _Topic(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String imgUrl,
      required final String hashtag,
      final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String category,
      final List<String> articleDisplayOrder}) = _$TopicImpl;

  factory _Topic.fromJson(Map<String, dynamic> json) = _$TopicImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get imgUrl;
  @override
  String get hashtag;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get category;
  @override
  List<String> get articleDisplayOrder;
  @override
  @JsonKey(ignore: true)
  _$$TopicImplCopyWith<_$TopicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
