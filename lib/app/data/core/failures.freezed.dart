// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfraFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unexpected,
    required TResult Function() noInternet,
    required TResult Function() noFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? noFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? noFcmToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoFcmToken value) noFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoFcmToken value)? noFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoFcmToken value)? noFcmToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfraFailureCopyWith<$Res> {
  factory $InfraFailureCopyWith(
          InfraFailure value, $Res Function(InfraFailure) then) =
      _$InfraFailureCopyWithImpl<$Res, InfraFailure>;
}

/// @nodoc
class _$InfraFailureCopyWithImpl<$Res, $Val extends InfraFailure>
    implements $InfraFailureCopyWith<$Res> {
  _$InfraFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$InfraFailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl({this.errorMessage});

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'InfraFailure.serverError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unexpected,
    required TResult Function() noInternet,
    required TResult Function() noFcmToken,
  }) {
    return serverError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? noFcmToken,
  }) {
    return serverError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? noFcmToken,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoFcmToken value) noFcmToken,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoFcmToken value)? noFcmToken,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoFcmToken value)? noFcmToken,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements InfraFailure {
  const factory _ServerError({final String? errorMessage}) = _$ServerErrorImpl;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$InfraFailureCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$UnexpectedImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedImpl implements _Unexpected {
  const _$UnexpectedImpl({this.errorMessage});

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'InfraFailure.unexpected(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedImplCopyWith<_$UnexpectedImpl> get copyWith =>
      __$$UnexpectedImplCopyWithImpl<_$UnexpectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unexpected,
    required TResult Function() noInternet,
    required TResult Function() noFcmToken,
  }) {
    return unexpected(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? noFcmToken,
  }) {
    return unexpected?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? noFcmToken,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoFcmToken value) noFcmToken,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoFcmToken value)? noFcmToken,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoFcmToken value)? noFcmToken,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements InfraFailure {
  const factory _Unexpected({final String? errorMessage}) = _$UnexpectedImpl;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$$UnexpectedImplCopyWith<_$UnexpectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$InfraFailureCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'InfraFailure.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unexpected,
    required TResult Function() noInternet,
    required TResult Function() noFcmToken,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? noFcmToken,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? noFcmToken,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoFcmToken value) noFcmToken,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoFcmToken value)? noFcmToken,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoFcmToken value)? noFcmToken,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements InfraFailure {
  const factory _NoInternet() = _$NoInternetImpl;
}

/// @nodoc
abstract class _$$NoFcmTokenImplCopyWith<$Res> {
  factory _$$NoFcmTokenImplCopyWith(
          _$NoFcmTokenImpl value, $Res Function(_$NoFcmTokenImpl) then) =
      __$$NoFcmTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoFcmTokenImplCopyWithImpl<$Res>
    extends _$InfraFailureCopyWithImpl<$Res, _$NoFcmTokenImpl>
    implements _$$NoFcmTokenImplCopyWith<$Res> {
  __$$NoFcmTokenImplCopyWithImpl(
      _$NoFcmTokenImpl _value, $Res Function(_$NoFcmTokenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoFcmTokenImpl implements _NoFcmToken {
  const _$NoFcmTokenImpl();

  @override
  String toString() {
    return 'InfraFailure.noFcmToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoFcmTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unexpected,
    required TResult Function() noInternet,
    required TResult Function() noFcmToken,
  }) {
    return noFcmToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unexpected,
    TResult? Function()? noInternet,
    TResult? Function()? noFcmToken,
  }) {
    return noFcmToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unexpected,
    TResult Function()? noInternet,
    TResult Function()? noFcmToken,
    required TResult orElse(),
  }) {
    if (noFcmToken != null) {
      return noFcmToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoFcmToken value) noFcmToken,
  }) {
    return noFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoFcmToken value)? noFcmToken,
  }) {
    return noFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoFcmToken value)? noFcmToken,
    required TResult orElse(),
  }) {
    if (noFcmToken != null) {
      return noFcmToken(this);
    }
    return orElse();
  }
}

abstract class _NoFcmToken implements InfraFailure {
  const factory _NoFcmToken() = _$NoFcmTokenImpl;
}
