// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_scale_factors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextScaleFactor _$TextScaleFactorFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'small':
      return _Small.fromJson(json);
    case 'normal':
      return _Normal.fromJson(json);
    case 'large':
      return _Large.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TextScaleFactor',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TextScaleFactor {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() normal,
    required TResult Function() large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? normal,
    TResult? Function()? large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? normal,
    TResult Function()? large,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Small value) small,
    required TResult Function(_Normal value) normal,
    required TResult Function(_Large value) large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Small value)? small,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_Large value)? large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Small value)? small,
    TResult Function(_Normal value)? normal,
    TResult Function(_Large value)? large,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextScaleFactorCopyWith<$Res> {
  factory $TextScaleFactorCopyWith(
          TextScaleFactor value, $Res Function(TextScaleFactor) then) =
      _$TextScaleFactorCopyWithImpl<$Res, TextScaleFactor>;
}

/// @nodoc
class _$TextScaleFactorCopyWithImpl<$Res, $Val extends TextScaleFactor>
    implements $TextScaleFactorCopyWith<$Res> {
  _$TextScaleFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SmallImplCopyWith<$Res> {
  factory _$$SmallImplCopyWith(
          _$SmallImpl value, $Res Function(_$SmallImpl) then) =
      __$$SmallImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallImplCopyWithImpl<$Res>
    extends _$TextScaleFactorCopyWithImpl<$Res, _$SmallImpl>
    implements _$$SmallImplCopyWith<$Res> {
  __$$SmallImplCopyWithImpl(
      _$SmallImpl _value, $Res Function(_$SmallImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SmallImpl implements _Small {
  const _$SmallImpl({final String? $type}) : $type = $type ?? 'small';

  factory _$SmallImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmallImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TextScaleFactor.small()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SmallImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() normal,
    required TResult Function() large,
  }) {
    return small();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? normal,
    TResult? Function()? large,
  }) {
    return small?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? normal,
    TResult Function()? large,
    required TResult orElse(),
  }) {
    if (small != null) {
      return small();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Small value) small,
    required TResult Function(_Normal value) normal,
    required TResult Function(_Large value) large,
  }) {
    return small(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Small value)? small,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_Large value)? large,
  }) {
    return small?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Small value)? small,
    TResult Function(_Normal value)? normal,
    TResult Function(_Large value)? large,
    required TResult orElse(),
  }) {
    if (small != null) {
      return small(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SmallImplToJson(
      this,
    );
  }
}

abstract class _Small implements TextScaleFactor {
  const factory _Small() = _$SmallImpl;

  factory _Small.fromJson(Map<String, dynamic> json) = _$SmallImpl.fromJson;
}

/// @nodoc
abstract class _$$NormalImplCopyWith<$Res> {
  factory _$$NormalImplCopyWith(
          _$NormalImpl value, $Res Function(_$NormalImpl) then) =
      __$$NormalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NormalImplCopyWithImpl<$Res>
    extends _$TextScaleFactorCopyWithImpl<$Res, _$NormalImpl>
    implements _$$NormalImplCopyWith<$Res> {
  __$$NormalImplCopyWithImpl(
      _$NormalImpl _value, $Res Function(_$NormalImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NormalImpl implements _Normal {
  const _$NormalImpl({final String? $type}) : $type = $type ?? 'normal';

  factory _$NormalImpl.fromJson(Map<String, dynamic> json) =>
      _$$NormalImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TextScaleFactor.normal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NormalImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() normal,
    required TResult Function() large,
  }) {
    return normal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? normal,
    TResult? Function()? large,
  }) {
    return normal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? normal,
    TResult Function()? large,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Small value) small,
    required TResult Function(_Normal value) normal,
    required TResult Function(_Large value) large,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Small value)? small,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_Large value)? large,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Small value)? small,
    TResult Function(_Normal value)? normal,
    TResult Function(_Large value)? large,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalImplToJson(
      this,
    );
  }
}

abstract class _Normal implements TextScaleFactor {
  const factory _Normal() = _$NormalImpl;

  factory _Normal.fromJson(Map<String, dynamic> json) = _$NormalImpl.fromJson;
}

/// @nodoc
abstract class _$$LargeImplCopyWith<$Res> {
  factory _$$LargeImplCopyWith(
          _$LargeImpl value, $Res Function(_$LargeImpl) then) =
      __$$LargeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeImplCopyWithImpl<$Res>
    extends _$TextScaleFactorCopyWithImpl<$Res, _$LargeImpl>
    implements _$$LargeImplCopyWith<$Res> {
  __$$LargeImplCopyWithImpl(
      _$LargeImpl _value, $Res Function(_$LargeImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LargeImpl implements _Large {
  const _$LargeImpl({final String? $type}) : $type = $type ?? 'large';

  factory _$LargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LargeImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TextScaleFactor.large()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LargeImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() normal,
    required TResult Function() large,
  }) {
    return large();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? normal,
    TResult? Function()? large,
  }) {
    return large?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? normal,
    TResult Function()? large,
    required TResult orElse(),
  }) {
    if (large != null) {
      return large();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Small value) small,
    required TResult Function(_Normal value) normal,
    required TResult Function(_Large value) large,
  }) {
    return large(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Small value)? small,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_Large value)? large,
  }) {
    return large?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Small value)? small,
    TResult Function(_Normal value)? normal,
    TResult Function(_Large value)? large,
    required TResult orElse(),
  }) {
    if (large != null) {
      return large(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LargeImplToJson(
      this,
    );
  }
}

abstract class _Large implements TextScaleFactor {
  const factory _Large() = _$LargeImpl;

  factory _Large.fromJson(Map<String, dynamic> json) = _$LargeImpl.fromJson;
}
