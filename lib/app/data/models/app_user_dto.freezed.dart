// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserDto _$AppUserDtoFromJson(Map<String, dynamic> json) {
  return _AppUserDto.fromJson(json);
}

/// @nodoc
mixin _$AppUserDto {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  List<dynamic> get interests => throw _privateConstructorUsedError;
  List<dynamic> get newsSeenToday => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserDtoCopyWith<AppUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserDtoCopyWith<$Res> {
  factory $AppUserDtoCopyWith(
          AppUserDto value, $Res Function(AppUserDto) then) =
      _$AppUserDtoCopyWithImpl<$Res, AppUserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? language,
      String? latitude,
      String? longitude,
      String? city,
      String? state,
      bool isBlocked,
      bool disabled,
      List<dynamic> interests,
      List<dynamic> newsSeenToday,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AppUserDtoCopyWithImpl<$Res, $Val extends AppUserDto>
    implements $AppUserDtoCopyWith<$Res> {
  _$AppUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? language = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? isBlocked = null,
    Object? disabled = null,
    Object? interests = null,
    Object? newsSeenToday = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      newsSeenToday: null == newsSeenToday
          ? _value.newsSeenToday
          : newsSeenToday // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserDtoImplCopyWith<$Res>
    implements $AppUserDtoCopyWith<$Res> {
  factory _$$AppUserDtoImplCopyWith(
          _$AppUserDtoImpl value, $Res Function(_$AppUserDtoImpl) then) =
      __$$AppUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? language,
      String? latitude,
      String? longitude,
      String? city,
      String? state,
      bool isBlocked,
      bool disabled,
      List<dynamic> interests,
      List<dynamic> newsSeenToday,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AppUserDtoImplCopyWithImpl<$Res>
    extends _$AppUserDtoCopyWithImpl<$Res, _$AppUserDtoImpl>
    implements _$$AppUserDtoImplCopyWith<$Res> {
  __$$AppUserDtoImplCopyWithImpl(
      _$AppUserDtoImpl _value, $Res Function(_$AppUserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? language = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? isBlocked = null,
    Object? disabled = null,
    Object? interests = null,
    Object? newsSeenToday = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AppUserDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      newsSeenToday: null == newsSeenToday
          ? _value._newsSeenToday
          : newsSeenToday // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserDtoImpl implements _AppUserDto {
  const _$AppUserDtoImpl(
      {@JsonKey(name: '_id') required this.id,
      this.language,
      this.latitude,
      this.longitude,
      this.city,
      this.state,
      this.isBlocked = false,
      this.disabled = false,
      final List<dynamic> interests = const [],
      final List<dynamic> newsSeenToday = const [],
      required this.createdAt,
      required this.updatedAt})
      : _interests = interests,
        _newsSeenToday = newsSeenToday;

  factory _$AppUserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserDtoImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? language;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? city;
  @override
  final String? state;
  @override
  @JsonKey()
  final bool isBlocked;
  @override
  @JsonKey()
  final bool disabled;
  final List<dynamic> _interests;
  @override
  @JsonKey()
  List<dynamic> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  final List<dynamic> _newsSeenToday;
  @override
  @JsonKey()
  List<dynamic> get newsSeenToday {
    if (_newsSeenToday is EqualUnmodifiableListView) return _newsSeenToday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsSeenToday);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AppUserDto(id: $id, language: $language, latitude: $latitude, longitude: $longitude, city: $city, state: $state, isBlocked: $isBlocked, disabled: $disabled, interests: $interests, newsSeenToday: $newsSeenToday, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            const DeepCollectionEquality()
                .equals(other._newsSeenToday, _newsSeenToday) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      language,
      latitude,
      longitude,
      city,
      state,
      isBlocked,
      disabled,
      const DeepCollectionEquality().hash(_interests),
      const DeepCollectionEquality().hash(_newsSeenToday),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserDtoImplCopyWith<_$AppUserDtoImpl> get copyWith =>
      __$$AppUserDtoImplCopyWithImpl<_$AppUserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserDtoImplToJson(
      this,
    );
  }
}

abstract class _AppUserDto implements AppUserDto {
  const factory _AppUserDto(
      {@JsonKey(name: '_id') required final String id,
      final String? language,
      final String? latitude,
      final String? longitude,
      final String? city,
      final String? state,
      final bool isBlocked,
      final bool disabled,
      final List<dynamic> interests,
      final List<dynamic> newsSeenToday,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AppUserDtoImpl;

  factory _AppUserDto.fromJson(Map<String, dynamic> json) =
      _$AppUserDtoImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get language;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  String? get city;
  @override
  String? get state;
  @override
  bool get isBlocked;
  @override
  bool get disabled;
  @override
  List<dynamic> get interests;
  @override
  List<dynamic> get newsSeenToday;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AppUserDtoImplCopyWith<_$AppUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
