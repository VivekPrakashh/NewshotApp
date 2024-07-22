// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_or_thread.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsOrThread {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(News news) news,
    required TResult Function(Thread thread) thread,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(News news)? news,
    TResult? Function(Thread thread)? thread,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(News news)? news,
    TResult Function(Thread thread)? thread,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_News value) news,
    required TResult Function(ThreadType value) thread,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_News value)? news,
    TResult? Function(ThreadType value)? thread,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_News value)? news,
    TResult Function(ThreadType value)? thread,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsOrThreadCopyWith<$Res> {
  factory $NewsOrThreadCopyWith(
          NewsOrThread value, $Res Function(NewsOrThread) then) =
      _$NewsOrThreadCopyWithImpl<$Res, NewsOrThread>;
}

/// @nodoc
class _$NewsOrThreadCopyWithImpl<$Res, $Val extends NewsOrThread>
    implements $NewsOrThreadCopyWith<$Res> {
  _$NewsOrThreadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({News news});

  $NewsCopyWith<$Res> get news;
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsOrThreadCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$NewsImpl(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as News,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsCopyWith<$Res> get news {
    return $NewsCopyWith<$Res>(_value.news, (value) {
      return _then(_value.copyWith(news: value));
    });
  }
}

/// @nodoc

class _$NewsImpl implements _News {
  const _$NewsImpl({required this.news});

  @override
  final News news;

  @override
  String toString() {
    return 'NewsOrThread.news(news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.news, news) || other.news == news));
  }

  @override
  int get hashCode => Object.hash(runtimeType, news);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(News news) news,
    required TResult Function(Thread thread) thread,
  }) {
    return news(this.news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(News news)? news,
    TResult? Function(Thread thread)? thread,
  }) {
    return news?.call(this.news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(News news)? news,
    TResult Function(Thread thread)? thread,
    required TResult orElse(),
  }) {
    if (news != null) {
      return news(this.news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_News value) news,
    required TResult Function(ThreadType value) thread,
  }) {
    return news(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_News value)? news,
    TResult? Function(ThreadType value)? thread,
  }) {
    return news?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_News value)? news,
    TResult Function(ThreadType value)? thread,
    required TResult orElse(),
  }) {
    if (news != null) {
      return news(this);
    }
    return orElse();
  }
}

abstract class _News implements NewsOrThread {
  const factory _News({required final News news}) = _$NewsImpl;

  News get news;
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThreadTypeImplCopyWith<$Res> {
  factory _$$ThreadTypeImplCopyWith(
          _$ThreadTypeImpl value, $Res Function(_$ThreadTypeImpl) then) =
      __$$ThreadTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Thread thread});

  $ThreadCopyWith<$Res> get thread;
}

/// @nodoc
class __$$ThreadTypeImplCopyWithImpl<$Res>
    extends _$NewsOrThreadCopyWithImpl<$Res, _$ThreadTypeImpl>
    implements _$$ThreadTypeImplCopyWith<$Res> {
  __$$ThreadTypeImplCopyWithImpl(
      _$ThreadTypeImpl _value, $Res Function(_$ThreadTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thread = null,
  }) {
    return _then(_$ThreadTypeImpl(
      thread: null == thread
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as Thread,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ThreadCopyWith<$Res> get thread {
    return $ThreadCopyWith<$Res>(_value.thread, (value) {
      return _then(_value.copyWith(thread: value));
    });
  }
}

/// @nodoc

class _$ThreadTypeImpl implements ThreadType {
  const _$ThreadTypeImpl({required this.thread});

  @override
  final Thread thread;

  @override
  String toString() {
    return 'NewsOrThread.thread(thread: $thread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadTypeImpl &&
            (identical(other.thread, thread) || other.thread == thread));
  }

  @override
  int get hashCode => Object.hash(runtimeType, thread);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadTypeImplCopyWith<_$ThreadTypeImpl> get copyWith =>
      __$$ThreadTypeImplCopyWithImpl<_$ThreadTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(News news) news,
    required TResult Function(Thread thread) thread,
  }) {
    return thread(this.thread);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(News news)? news,
    TResult? Function(Thread thread)? thread,
  }) {
    return thread?.call(this.thread);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(News news)? news,
    TResult Function(Thread thread)? thread,
    required TResult orElse(),
  }) {
    if (thread != null) {
      return thread(this.thread);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_News value) news,
    required TResult Function(ThreadType value) thread,
  }) {
    return thread(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_News value)? news,
    TResult? Function(ThreadType value)? thread,
  }) {
    return thread?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_News value)? news,
    TResult Function(ThreadType value)? thread,
    required TResult orElse(),
  }) {
    if (thread != null) {
      return thread(this);
    }
    return orElse();
  }
}

abstract class ThreadType implements NewsOrThread {
  const factory ThreadType({required final Thread thread}) = _$ThreadTypeImpl;

  Thread get thread;
  @JsonKey(ignore: true)
  _$$ThreadTypeImplCopyWith<_$ThreadTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
