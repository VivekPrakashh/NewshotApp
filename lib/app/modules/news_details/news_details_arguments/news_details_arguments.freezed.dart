// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_details_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsDetailsArguments {
  List<NewsOrThread> get news => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  Future<List<News>> Function(int)? get onLoad =>
      throw _privateConstructorUsedError;
  bool get redirectToMainNews => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsDetailsArgumentsCopyWith<NewsDetailsArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDetailsArgumentsCopyWith<$Res> {
  factory $NewsDetailsArgumentsCopyWith(NewsDetailsArguments value,
          $Res Function(NewsDetailsArguments) then) =
      _$NewsDetailsArgumentsCopyWithImpl<$Res, NewsDetailsArguments>;
  @useResult
  $Res call(
      {List<NewsOrThread> news,
      int currentIndex,
      Future<List<News>> Function(int)? onLoad,
      bool redirectToMainNews});
}

/// @nodoc
class _$NewsDetailsArgumentsCopyWithImpl<$Res,
        $Val extends NewsDetailsArguments>
    implements $NewsDetailsArgumentsCopyWith<$Res> {
  _$NewsDetailsArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? currentIndex = null,
    Object? onLoad = freezed,
    Object? redirectToMainNews = null,
  }) {
    return _then(_value.copyWith(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsOrThread>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      onLoad: freezed == onLoad
          ? _value.onLoad
          : onLoad // ignore: cast_nullable_to_non_nullable
              as Future<List<News>> Function(int)?,
      redirectToMainNews: null == redirectToMainNews
          ? _value.redirectToMainNews
          : redirectToMainNews // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDetailsArgumentsImplCopyWith<$Res>
    implements $NewsDetailsArgumentsCopyWith<$Res> {
  factory _$$NewsDetailsArgumentsImplCopyWith(_$NewsDetailsArgumentsImpl value,
          $Res Function(_$NewsDetailsArgumentsImpl) then) =
      __$$NewsDetailsArgumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NewsOrThread> news,
      int currentIndex,
      Future<List<News>> Function(int)? onLoad,
      bool redirectToMainNews});
}

/// @nodoc
class __$$NewsDetailsArgumentsImplCopyWithImpl<$Res>
    extends _$NewsDetailsArgumentsCopyWithImpl<$Res, _$NewsDetailsArgumentsImpl>
    implements _$$NewsDetailsArgumentsImplCopyWith<$Res> {
  __$$NewsDetailsArgumentsImplCopyWithImpl(_$NewsDetailsArgumentsImpl _value,
      $Res Function(_$NewsDetailsArgumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? currentIndex = null,
    Object? onLoad = freezed,
    Object? redirectToMainNews = null,
  }) {
    return _then(_$NewsDetailsArgumentsImpl(
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsOrThread>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      onLoad: freezed == onLoad
          ? _value.onLoad
          : onLoad // ignore: cast_nullable_to_non_nullable
              as Future<List<News>> Function(int)?,
      redirectToMainNews: null == redirectToMainNews
          ? _value.redirectToMainNews
          : redirectToMainNews // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewsDetailsArgumentsImpl implements _NewsDetailsArguments {
  const _$NewsDetailsArgumentsImpl(
      {required final List<NewsOrThread> news,
      required this.currentIndex,
      required this.onLoad,
      this.redirectToMainNews = false})
      : _news = news;

  final List<NewsOrThread> _news;
  @override
  List<NewsOrThread> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  final int currentIndex;
  @override
  final Future<List<News>> Function(int)? onLoad;
  @override
  @JsonKey()
  final bool redirectToMainNews;

  @override
  String toString() {
    return 'NewsDetailsArguments(news: $news, currentIndex: $currentIndex, onLoad: $onLoad, redirectToMainNews: $redirectToMainNews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDetailsArgumentsImpl &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.onLoad, onLoad) || other.onLoad == onLoad) &&
            (identical(other.redirectToMainNews, redirectToMainNews) ||
                other.redirectToMainNews == redirectToMainNews));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_news),
      currentIndex,
      onLoad,
      redirectToMainNews);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDetailsArgumentsImplCopyWith<_$NewsDetailsArgumentsImpl>
      get copyWith =>
          __$$NewsDetailsArgumentsImplCopyWithImpl<_$NewsDetailsArgumentsImpl>(
              this, _$identity);
}

abstract class _NewsDetailsArguments implements NewsDetailsArguments {
  const factory _NewsDetailsArguments(
      {required final List<NewsOrThread> news,
      required final int currentIndex,
      required final Future<List<News>> Function(int)? onLoad,
      final bool redirectToMainNews}) = _$NewsDetailsArgumentsImpl;

  @override
  List<NewsOrThread> get news;
  @override
  int get currentIndex;
  @override
  Future<List<News>> Function(int)? get onLoad;
  @override
  bool get redirectToMainNews;
  @override
  @JsonKey(ignore: true)
  _$$NewsDetailsArgumentsImplCopyWith<_$NewsDetailsArgumentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
