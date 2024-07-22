// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) {
  return _RemoteUser.fromJson(json);
}

/// @nodoc
mixin _$RemoteUser {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  bool get preferencesAsked =>
      throw _privateConstructorUsedError; // @Default([]) List<SubCategory> preferences,
  List<Category> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteUserCopyWith<RemoteUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteUserCopyWith<$Res> {
  factory $RemoteUserCopyWith(
          RemoteUser value, $Res Function(RemoteUser) then) =
      _$RemoteUserCopyWithImpl<$Res, RemoteUser>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      bool preferencesAsked,
      List<Category> categories});
}

/// @nodoc
class _$RemoteUserCopyWithImpl<$Res, $Val extends RemoteUser>
    implements $RemoteUserCopyWith<$Res> {
  _$RemoteUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? preferencesAsked = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      preferencesAsked: null == preferencesAsked
          ? _value.preferencesAsked
          : preferencesAsked // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteUserImplCopyWith<$Res>
    implements $RemoteUserCopyWith<$Res> {
  factory _$$RemoteUserImplCopyWith(
          _$RemoteUserImpl value, $Res Function(_$RemoteUserImpl) then) =
      __$$RemoteUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      bool preferencesAsked,
      List<Category> categories});
}

/// @nodoc
class __$$RemoteUserImplCopyWithImpl<$Res>
    extends _$RemoteUserCopyWithImpl<$Res, _$RemoteUserImpl>
    implements _$$RemoteUserImplCopyWith<$Res> {
  __$$RemoteUserImplCopyWithImpl(
      _$RemoteUserImpl _value, $Res Function(_$RemoteUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? preferencesAsked = null,
    Object? categories = null,
  }) {
    return _then(_$RemoteUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      preferencesAsked: null == preferencesAsked
          ? _value.preferencesAsked
          : preferencesAsked // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteUserImpl implements _RemoteUser {
  const _$RemoteUserImpl(
      {@JsonKey(name: "_id") required this.id,
      this.preferencesAsked = false,
      final List<Category> categories = const []})
      : _categories = categories;

  factory _$RemoteUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteUserImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey()
  final bool preferencesAsked;
// @Default([]) List<SubCategory> preferences,
  final List<Category> _categories;
// @Default([]) List<SubCategory> preferences,
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'RemoteUser(id: $id, preferencesAsked: $preferencesAsked, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.preferencesAsked, preferencesAsked) ||
                other.preferencesAsked == preferencesAsked) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, preferencesAsked,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteUserImplCopyWith<_$RemoteUserImpl> get copyWith =>
      __$$RemoteUserImplCopyWithImpl<_$RemoteUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteUserImplToJson(
      this,
    );
  }
}

abstract class _RemoteUser implements RemoteUser {
  const factory _RemoteUser(
      {@JsonKey(name: "_id") required final String id,
      final bool preferencesAsked,
      final List<Category> categories}) = _$RemoteUserImpl;

  factory _RemoteUser.fromJson(Map<String, dynamic> json) =
      _$RemoteUserImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  bool get preferencesAsked;
  @override // @Default([]) List<SubCategory> preferences,
  List<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$RemoteUserImplCopyWith<_$RemoteUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
