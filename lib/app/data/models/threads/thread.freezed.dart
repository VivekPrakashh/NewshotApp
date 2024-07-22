// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Thread _$ThreadFromJson(Map<String, dynamic> json) {
  return _Thread.fromJson(json);
}

/// @nodoc
mixin _$Thread {
  ThreadSource? get source => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get contentTitle => throw _privateConstructorUsedError;
  List<Fact> get facts => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get backgroundImgUrl => throw _privateConstructorUsedError;
  DateTime? get publishedOn => throw _privateConstructorUsedError;
  String? get threadTitle => throw _privateConstructorUsedError;
  String? get titleHeader => throw _privateConstructorUsedError;
  String? get titleFooter => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadCopyWith<Thread> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadCopyWith<$Res> {
  factory $ThreadCopyWith(Thread value, $Res Function(Thread) then) =
      _$ThreadCopyWithImpl<$Res, Thread>;
  @useResult
  $Res call(
      {ThreadSource? source,
      @JsonKey(name: '_id') String id,
      String? contentTitle,
      List<Fact> facts,
      List<String> tags,
      String? backgroundImgUrl,
      DateTime? publishedOn,
      String? threadTitle,
      String? titleHeader,
      String? titleFooter,
      DateTime createdAt,
      DateTime updatedAt,
      String language});

  $ThreadSourceCopyWith<$Res>? get source;
}

/// @nodoc
class _$ThreadCopyWithImpl<$Res, $Val extends Thread>
    implements $ThreadCopyWith<$Res> {
  _$ThreadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = null,
    Object? contentTitle = freezed,
    Object? facts = null,
    Object? tags = null,
    Object? backgroundImgUrl = freezed,
    Object? publishedOn = freezed,
    Object? threadTitle = freezed,
    Object? titleHeader = freezed,
    Object? titleFooter = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ThreadSource?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: freezed == contentTitle
          ? _value.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      facts: null == facts
          ? _value.facts
          : facts // ignore: cast_nullable_to_non_nullable
              as List<Fact>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      backgroundImgUrl: freezed == backgroundImgUrl
          ? _value.backgroundImgUrl
          : backgroundImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      threadTitle: freezed == threadTitle
          ? _value.threadTitle
          : threadTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titleHeader: freezed == titleHeader
          ? _value.titleHeader
          : titleHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      titleFooter: freezed == titleFooter
          ? _value.titleFooter
          : titleFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThreadSourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $ThreadSourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThreadImplCopyWith<$Res> implements $ThreadCopyWith<$Res> {
  factory _$$ThreadImplCopyWith(
          _$ThreadImpl value, $Res Function(_$ThreadImpl) then) =
      __$$ThreadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThreadSource? source,
      @JsonKey(name: '_id') String id,
      String? contentTitle,
      List<Fact> facts,
      List<String> tags,
      String? backgroundImgUrl,
      DateTime? publishedOn,
      String? threadTitle,
      String? titleHeader,
      String? titleFooter,
      DateTime createdAt,
      DateTime updatedAt,
      String language});

  @override
  $ThreadSourceCopyWith<$Res>? get source;
}

/// @nodoc
class __$$ThreadImplCopyWithImpl<$Res>
    extends _$ThreadCopyWithImpl<$Res, _$ThreadImpl>
    implements _$$ThreadImplCopyWith<$Res> {
  __$$ThreadImplCopyWithImpl(
      _$ThreadImpl _value, $Res Function(_$ThreadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = null,
    Object? contentTitle = freezed,
    Object? facts = null,
    Object? tags = null,
    Object? backgroundImgUrl = freezed,
    Object? publishedOn = freezed,
    Object? threadTitle = freezed,
    Object? titleHeader = freezed,
    Object? titleFooter = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? language = null,
  }) {
    return _then(_$ThreadImpl(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ThreadSource?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: freezed == contentTitle
          ? _value.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      facts: null == facts
          ? _value._facts
          : facts // ignore: cast_nullable_to_non_nullable
              as List<Fact>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      backgroundImgUrl: freezed == backgroundImgUrl
          ? _value.backgroundImgUrl
          : backgroundImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      threadTitle: freezed == threadTitle
          ? _value.threadTitle
          : threadTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titleHeader: freezed == titleHeader
          ? _value.titleHeader
          : titleHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      titleFooter: freezed == titleFooter
          ? _value.titleFooter
          : titleFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadImpl implements _Thread {
  const _$ThreadImpl(
      {this.source,
      @JsonKey(name: '_id') required this.id,
      this.contentTitle,
      final List<Fact> facts = const [],
      final List<String> tags = const [],
      this.backgroundImgUrl,
      this.publishedOn,
      this.threadTitle,
      this.titleHeader,
      this.titleFooter,
      required this.createdAt,
      required this.updatedAt,
      this.language = 'english'})
      : _facts = facts,
        _tags = tags;

  factory _$ThreadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadImplFromJson(json);

  @override
  final ThreadSource? source;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? contentTitle;
  final List<Fact> _facts;
  @override
  @JsonKey()
  List<Fact> get facts {
    if (_facts is EqualUnmodifiableListView) return _facts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facts);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? backgroundImgUrl;
  @override
  final DateTime? publishedOn;
  @override
  final String? threadTitle;
  @override
  final String? titleHeader;
  @override
  final String? titleFooter;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'Thread(source: $source, id: $id, contentTitle: $contentTitle, facts: $facts, tags: $tags, backgroundImgUrl: $backgroundImgUrl, publishedOn: $publishedOn, threadTitle: $threadTitle, titleHeader: $titleHeader, titleFooter: $titleFooter, createdAt: $createdAt, updatedAt: $updatedAt, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentTitle, contentTitle) ||
                other.contentTitle == contentTitle) &&
            const DeepCollectionEquality().equals(other._facts, _facts) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.backgroundImgUrl, backgroundImgUrl) ||
                other.backgroundImgUrl == backgroundImgUrl) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.threadTitle, threadTitle) ||
                other.threadTitle == threadTitle) &&
            (identical(other.titleHeader, titleHeader) ||
                other.titleHeader == titleHeader) &&
            (identical(other.titleFooter, titleFooter) ||
                other.titleFooter == titleFooter) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      source,
      id,
      contentTitle,
      const DeepCollectionEquality().hash(_facts),
      const DeepCollectionEquality().hash(_tags),
      backgroundImgUrl,
      publishedOn,
      threadTitle,
      titleHeader,
      titleFooter,
      createdAt,
      updatedAt,
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadImplCopyWith<_$ThreadImpl> get copyWith =>
      __$$ThreadImplCopyWithImpl<_$ThreadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadImplToJson(
      this,
    );
  }
}

abstract class _Thread implements Thread {
  const factory _Thread(
      {final ThreadSource? source,
      @JsonKey(name: '_id') required final String id,
      final String? contentTitle,
      final List<Fact> facts,
      final List<String> tags,
      final String? backgroundImgUrl,
      final DateTime? publishedOn,
      final String? threadTitle,
      final String? titleHeader,
      final String? titleFooter,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String language}) = _$ThreadImpl;

  factory _Thread.fromJson(Map<String, dynamic> json) = _$ThreadImpl.fromJson;

  @override
  ThreadSource? get source;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get contentTitle;
  @override
  List<Fact> get facts;
  @override
  List<String> get tags;
  @override
  String? get backgroundImgUrl;
  @override
  DateTime? get publishedOn;
  @override
  String? get threadTitle;
  @override
  String? get titleHeader;
  @override
  String? get titleFooter;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$ThreadImplCopyWith<_$ThreadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Fact _$FactFromJson(Map<String, dynamic> json) {
  return _Fact.fromJson(json);
}

/// @nodoc
mixin _$Fact {
  FactSource? get source => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get contentTitle => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  DateTime? get publishedOn => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get threadTitle => throw _privateConstructorUsedError;
  String? get titleHeader => throw _privateConstructorUsedError;
  String? get titleFooter => throw _privateConstructorUsedError;
  Language? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactCopyWith<Fact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactCopyWith<$Res> {
  factory $FactCopyWith(Fact value, $Res Function(Fact) then) =
      _$FactCopyWithImpl<$Res, Fact>;
  @useResult
  $Res call(
      {FactSource? source,
      @JsonKey(name: '_id') String id,
      String? contentTitle,
      String? title,
      String? description,
      List<String> tags,
      String imgUrl,
      DateTime? publishedOn,
      int? level,
      DateTime createdAt,
      DateTime updatedAt,
      String? threadTitle,
      String? titleHeader,
      String? titleFooter,
      Language? language});

  $FactSourceCopyWith<$Res>? get source;
}

/// @nodoc
class _$FactCopyWithImpl<$Res, $Val extends Fact>
    implements $FactCopyWith<$Res> {
  _$FactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = null,
    Object? contentTitle = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = null,
    Object? imgUrl = null,
    Object? publishedOn = freezed,
    Object? level = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? threadTitle = freezed,
    Object? titleHeader = freezed,
    Object? titleFooter = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as FactSource?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: freezed == contentTitle
          ? _value.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      threadTitle: freezed == threadTitle
          ? _value.threadTitle
          : threadTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titleHeader: freezed == titleHeader
          ? _value.titleHeader
          : titleHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      titleFooter: freezed == titleFooter
          ? _value.titleFooter
          : titleFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FactSourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $FactSourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FactImplCopyWith<$Res> implements $FactCopyWith<$Res> {
  factory _$$FactImplCopyWith(
          _$FactImpl value, $Res Function(_$FactImpl) then) =
      __$$FactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FactSource? source,
      @JsonKey(name: '_id') String id,
      String? contentTitle,
      String? title,
      String? description,
      List<String> tags,
      String imgUrl,
      DateTime? publishedOn,
      int? level,
      DateTime createdAt,
      DateTime updatedAt,
      String? threadTitle,
      String? titleHeader,
      String? titleFooter,
      Language? language});

  @override
  $FactSourceCopyWith<$Res>? get source;
}

/// @nodoc
class __$$FactImplCopyWithImpl<$Res>
    extends _$FactCopyWithImpl<$Res, _$FactImpl>
    implements _$$FactImplCopyWith<$Res> {
  __$$FactImplCopyWithImpl(_$FactImpl _value, $Res Function(_$FactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = null,
    Object? contentTitle = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = null,
    Object? imgUrl = null,
    Object? publishedOn = freezed,
    Object? level = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? threadTitle = freezed,
    Object? titleHeader = freezed,
    Object? titleFooter = freezed,
    Object? language = freezed,
  }) {
    return _then(_$FactImpl(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as FactSource?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: freezed == contentTitle
          ? _value.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      threadTitle: freezed == threadTitle
          ? _value.threadTitle
          : threadTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titleHeader: freezed == titleHeader
          ? _value.titleHeader
          : titleHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      titleFooter: freezed == titleFooter
          ? _value.titleFooter
          : titleFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactImpl implements _Fact {
  const _$FactImpl(
      {this.source,
      @JsonKey(name: '_id') required this.id,
      this.contentTitle,
      this.title,
      this.description,
      final List<String> tags = const [],
      required this.imgUrl,
      this.publishedOn,
      this.level,
      required this.createdAt,
      required this.updatedAt,
      this.threadTitle,
      this.titleHeader,
      this.titleFooter,
      this.language})
      : _tags = tags;

  factory _$FactImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactImplFromJson(json);

  @override
  final FactSource? source;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? contentTitle;
  @override
  final String? title;
  @override
  final String? description;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String imgUrl;
  @override
  final DateTime? publishedOn;
  @override
  final int? level;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? threadTitle;
  @override
  final String? titleHeader;
  @override
  final String? titleFooter;
  @override
  final Language? language;

  @override
  String toString() {
    return 'Fact(source: $source, id: $id, contentTitle: $contentTitle, title: $title, description: $description, tags: $tags, imgUrl: $imgUrl, publishedOn: $publishedOn, level: $level, createdAt: $createdAt, updatedAt: $updatedAt, threadTitle: $threadTitle, titleHeader: $titleHeader, titleFooter: $titleFooter, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentTitle, contentTitle) ||
                other.contentTitle == contentTitle) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.threadTitle, threadTitle) ||
                other.threadTitle == threadTitle) &&
            (identical(other.titleHeader, titleHeader) ||
                other.titleHeader == titleHeader) &&
            (identical(other.titleFooter, titleFooter) ||
                other.titleFooter == titleFooter) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      source,
      id,
      contentTitle,
      title,
      description,
      const DeepCollectionEquality().hash(_tags),
      imgUrl,
      publishedOn,
      level,
      createdAt,
      updatedAt,
      threadTitle,
      titleHeader,
      titleFooter,
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FactImplCopyWith<_$FactImpl> get copyWith =>
      __$$FactImplCopyWithImpl<_$FactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactImplToJson(
      this,
    );
  }
}

abstract class _Fact implements Fact {
  const factory _Fact(
      {final FactSource? source,
      @JsonKey(name: '_id') required final String id,
      final String? contentTitle,
      final String? title,
      final String? description,
      final List<String> tags,
      required final String imgUrl,
      final DateTime? publishedOn,
      final int? level,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? threadTitle,
      final String? titleHeader,
      final String? titleFooter,
      final Language? language}) = _$FactImpl;

  factory _Fact.fromJson(Map<String, dynamic> json) = _$FactImpl.fromJson;

  @override
  FactSource? get source;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get contentTitle;
  @override
  String? get title;
  @override
  String? get description;
  @override
  List<String> get tags;
  @override
  String get imgUrl;
  @override
  DateTime? get publishedOn;
  @override
  int? get level;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get threadTitle;
  @override
  String? get titleHeader;
  @override
  String? get titleFooter;
  @override
  Language? get language;
  @override
  @JsonKey(ignore: true)
  _$$FactImplCopyWith<_$FactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FactSource _$FactSourceFromJson(Map<String, dynamic> json) {
  return _FactSource.fromJson(json);
}

/// @nodoc
mixin _$FactSource {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactSourceCopyWith<FactSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactSourceCopyWith<$Res> {
  factory $FactSourceCopyWith(
          FactSource value, $Res Function(FactSource) then) =
      _$FactSourceCopyWithImpl<$Res, FactSource>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$FactSourceCopyWithImpl<$Res, $Val extends FactSource>
    implements $FactSourceCopyWith<$Res> {
  _$FactSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactSourceImplCopyWith<$Res>
    implements $FactSourceCopyWith<$Res> {
  factory _$$FactSourceImplCopyWith(
          _$FactSourceImpl value, $Res Function(_$FactSourceImpl) then) =
      __$$FactSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$FactSourceImplCopyWithImpl<$Res>
    extends _$FactSourceCopyWithImpl<$Res, _$FactSourceImpl>
    implements _$$FactSourceImplCopyWith<$Res> {
  __$$FactSourceImplCopyWithImpl(
      _$FactSourceImpl _value, $Res Function(_$FactSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$FactSourceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactSourceImpl implements _FactSource {
  const _$FactSourceImpl({this.name, this.url});

  factory _$FactSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactSourceImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'FactSource(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactSourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FactSourceImplCopyWith<_$FactSourceImpl> get copyWith =>
      __$$FactSourceImplCopyWithImpl<_$FactSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactSourceImplToJson(
      this,
    );
  }
}

abstract class _FactSource implements FactSource {
  const factory _FactSource({final String? name, final String? url}) =
      _$FactSourceImpl;

  factory _FactSource.fromJson(Map<String, dynamic> json) =
      _$FactSourceImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$FactSourceImplCopyWith<_$FactSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThreadSource _$ThreadSourceFromJson(Map<String, dynamic> json) {
  return _ThreadSource.fromJson(json);
}

/// @nodoc
mixin _$ThreadSource {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadSourceCopyWith<ThreadSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadSourceCopyWith<$Res> {
  factory $ThreadSourceCopyWith(
          ThreadSource value, $Res Function(ThreadSource) then) =
      _$ThreadSourceCopyWithImpl<$Res, ThreadSource>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$ThreadSourceCopyWithImpl<$Res, $Val extends ThreadSource>
    implements $ThreadSourceCopyWith<$Res> {
  _$ThreadSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadSourceImplCopyWith<$Res>
    implements $ThreadSourceCopyWith<$Res> {
  factory _$$ThreadSourceImplCopyWith(
          _$ThreadSourceImpl value, $Res Function(_$ThreadSourceImpl) then) =
      __$$ThreadSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$ThreadSourceImplCopyWithImpl<$Res>
    extends _$ThreadSourceCopyWithImpl<$Res, _$ThreadSourceImpl>
    implements _$$ThreadSourceImplCopyWith<$Res> {
  __$$ThreadSourceImplCopyWithImpl(
      _$ThreadSourceImpl _value, $Res Function(_$ThreadSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ThreadSourceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadSourceImpl implements _ThreadSource {
  const _$ThreadSourceImpl({this.id, this.name});

  factory _$ThreadSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadSourceImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ThreadSource(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadSourceImplCopyWith<_$ThreadSourceImpl> get copyWith =>
      __$$ThreadSourceImplCopyWithImpl<_$ThreadSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadSourceImplToJson(
      this,
    );
  }
}

abstract class _ThreadSource implements ThreadSource {
  const factory _ThreadSource({final String? id, final String? name}) =
      _$ThreadSourceImpl;

  factory _ThreadSource.fromJson(Map<String, dynamic> json) =
      _$ThreadSourceImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ThreadSourceImplCopyWith<_$ThreadSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
