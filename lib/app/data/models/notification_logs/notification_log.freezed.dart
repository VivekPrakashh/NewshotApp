// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationLogs _$NotificationLogsFromJson(Map<String, dynamic> json) {
  return _NotificationLogs.fromJson(json);
}

/// @nodoc
mixin _$NotificationLogs {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  Article get article => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationLogsCopyWith<NotificationLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationLogsCopyWith<$Res> {
  factory $NotificationLogsCopyWith(
          NotificationLogs value, $Res Function(NotificationLogs) then) =
      _$NotificationLogsCopyWithImpl<$Res, NotificationLogs>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, Article article});

  $ArticleCopyWith<$Res> get article;
}

/// @nodoc
class _$NotificationLogsCopyWithImpl<$Res, $Val extends NotificationLogs>
    implements $NotificationLogsCopyWith<$Res> {
  _$NotificationLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? article = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleCopyWith<$Res> get article {
    return $ArticleCopyWith<$Res>(_value.article, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationLogsImplCopyWith<$Res>
    implements $NotificationLogsCopyWith<$Res> {
  factory _$$NotificationLogsImplCopyWith(_$NotificationLogsImpl value,
          $Res Function(_$NotificationLogsImpl) then) =
      __$$NotificationLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, Article article});

  @override
  $ArticleCopyWith<$Res> get article;
}

/// @nodoc
class __$$NotificationLogsImplCopyWithImpl<$Res>
    extends _$NotificationLogsCopyWithImpl<$Res, _$NotificationLogsImpl>
    implements _$$NotificationLogsImplCopyWith<$Res> {
  __$$NotificationLogsImplCopyWithImpl(_$NotificationLogsImpl _value,
      $Res Function(_$NotificationLogsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? article = null,
  }) {
    return _then(_$NotificationLogsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationLogsImpl implements _NotificationLogs {
  const _$NotificationLogsImpl(
      {@JsonKey(name: "_id") required this.id, required this.article});

  factory _$NotificationLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationLogsImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final Article article;

  @override
  String toString() {
    return 'NotificationLogs(id: $id, article: $article)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationLogsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.article, article) || other.article == article));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, article);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationLogsImplCopyWith<_$NotificationLogsImpl> get copyWith =>
      __$$NotificationLogsImplCopyWithImpl<_$NotificationLogsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationLogsImplToJson(
      this,
    );
  }
}

abstract class _NotificationLogs implements NotificationLogs {
  const factory _NotificationLogs(
      {@JsonKey(name: "_id") required final String id,
      required final Article article}) = _$NotificationLogsImpl;

  factory _NotificationLogs.fromJson(Map<String, dynamic> json) =
      _$NotificationLogsImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  Article get article;
  @override
  @JsonKey(ignore: true)
  _$$NotificationLogsImplCopyWith<_$NotificationLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get notificationTitle => throw _privateConstructorUsedError;
  String get urlToImage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonCategory)
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String notificationTitle,
      String urlToImage,
      @JsonKey(fromJson: fromJsonCategory) String? category});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notificationTitle = null,
    Object? urlToImage = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notificationTitle: null == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: null == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(
          _$ArticleImpl value, $Res Function(_$ArticleImpl) then) =
      __$$ArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String notificationTitle,
      String urlToImage,
      @JsonKey(fromJson: fromJsonCategory) String? category});
}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl>
    implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(
      _$ArticleImpl _value, $Res Function(_$ArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notificationTitle = null,
    Object? urlToImage = null,
    Object? category = freezed,
  }) {
    return _then(_$ArticleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notificationTitle: null == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: null == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleImpl implements _Article {
  const _$ArticleImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.notificationTitle,
      required this.urlToImage,
      @JsonKey(fromJson: fromJsonCategory) this.category});

  factory _$ArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String notificationTitle;
  @override
  final String urlToImage;
  @override
  @JsonKey(fromJson: fromJsonCategory)
  final String? category;

  @override
  String toString() {
    return 'Article(id: $id, notificationTitle: $notificationTitle, urlToImage: $urlToImage, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notificationTitle, notificationTitle) ||
                other.notificationTitle == notificationTitle) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, notificationTitle, urlToImage, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleImplToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  const factory _Article(
          {@JsonKey(name: "_id") required final String id,
          required final String notificationTitle,
          required final String urlToImage,
          @JsonKey(fromJson: fromJsonCategory) final String? category}) =
      _$ArticleImpl;

  factory _Article.fromJson(Map<String, dynamic> json) = _$ArticleImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get notificationTitle;
  @override
  String get urlToImage;
  @override
  @JsonKey(fromJson: fromJsonCategory)
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
