// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_with_loading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsWithLoading {
  bool get isLoading => throw _privateConstructorUsedError;
  List<News> get news => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsWithLoadingCopyWith<NewsWithLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsWithLoadingCopyWith<$Res> {
  factory $NewsWithLoadingCopyWith(
          NewsWithLoading value, $Res Function(NewsWithLoading) then) =
      _$NewsWithLoadingCopyWithImpl<$Res, NewsWithLoading>;
  @useResult
  $Res call({bool isLoading, List<News> news, int limit});
}

/// @nodoc
class _$NewsWithLoadingCopyWithImpl<$Res, $Val extends NewsWithLoading>
    implements $NewsWithLoadingCopyWith<$Res> {
  _$NewsWithLoadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? news = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsWithLoadingImplCopyWith<$Res>
    implements $NewsWithLoadingCopyWith<$Res> {
  factory _$$NewsWithLoadingImplCopyWith(_$NewsWithLoadingImpl value,
          $Res Function(_$NewsWithLoadingImpl) then) =
      __$$NewsWithLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<News> news, int limit});
}

/// @nodoc
class __$$NewsWithLoadingImplCopyWithImpl<$Res>
    extends _$NewsWithLoadingCopyWithImpl<$Res, _$NewsWithLoadingImpl>
    implements _$$NewsWithLoadingImplCopyWith<$Res> {
  __$$NewsWithLoadingImplCopyWithImpl(
      _$NewsWithLoadingImpl _value, $Res Function(_$NewsWithLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? news = null,
    Object? limit = null,
  }) {
    return _then(_$NewsWithLoadingImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewsWithLoadingImpl implements _NewsWithLoading {
  const _$NewsWithLoadingImpl(
      {this.isLoading = true,
      final List<News> news = const [],
      this.limit = 20})
      : _news = news;

  @override
  @JsonKey()
  final bool isLoading;
  final List<News> _news;
  @override
  @JsonKey()
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NewsWithLoading(isLoading: $isLoading, news: $news, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsWithLoadingImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_news), limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsWithLoadingImplCopyWith<_$NewsWithLoadingImpl> get copyWith =>
      __$$NewsWithLoadingImplCopyWithImpl<_$NewsWithLoadingImpl>(
          this, _$identity);
}

abstract class _NewsWithLoading implements NewsWithLoading {
  const factory _NewsWithLoading(
      {final bool isLoading,
      final List<News> news,
      final int limit}) = _$NewsWithLoadingImpl;

  @override
  bool get isLoading;
  @override
  List<News> get news;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$NewsWithLoadingImplCopyWith<_$NewsWithLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
