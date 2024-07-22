// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  Source? get source =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  DateTime? get publishedOn => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<NewsFaq> get faq => throw _privateConstructorUsedError;
  List<NewsDoubts> get doubts => throw _privateConstructorUsedError;
  List<NewsSection> get sections => throw _privateConstructorUsedError;
  Poll? get poll => throw _privateConstructorUsedError;
  String? get formattedDescription => throw _privateConstructorUsedError;
  String? get originalTitle => throw _privateConstructorUsedError;
  @JsonKey(fromJson: quizApprovedFromJson)
  bool get quizApproved => throw _privateConstructorUsedError;
  @JsonKey(fromJson: quizApprovedFromJson)
  bool get pollApproved => throw _privateConstructorUsedError;
  @JsonKey(fromJson: quizApprovedFromJson)
  bool get faqApproved => throw _privateConstructorUsedError;
  String? get notificationTitle => throw _privateConstructorUsedError;
  String? get xUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {Source? source,
      @JsonKey(name: "_id") String? id,
      String title,
      String description,
      Category? category,
      String? language,
      List<dynamic>? tags,
      String? url,
      String? urlToImage,
      DateTime? publishedOn,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<NewsFaq> faq,
      List<NewsDoubts> doubts,
      List<NewsSection> sections,
      Poll? poll,
      String? formattedDescription,
      String? originalTitle,
      @JsonKey(fromJson: quizApprovedFromJson) bool quizApproved,
      @JsonKey(fromJson: quizApprovedFromJson) bool pollApproved,
      @JsonKey(fromJson: quizApprovedFromJson) bool faqApproved,
      String? notificationTitle,
      String? xUrl});

  $SourceCopyWith<$Res>? get source;
  $CategoryCopyWith<$Res>? get category;
  $PollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = freezed,
    Object? language = freezed,
    Object? tags = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedOn = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? faq = null,
    Object? doubts = null,
    Object? sections = null,
    Object? poll = freezed,
    Object? formattedDescription = freezed,
    Object? originalTitle = freezed,
    Object? quizApproved = null,
    Object? pollApproved = null,
    Object? faqApproved = null,
    Object? notificationTitle = freezed,
    Object? xUrl = freezed,
  }) {
    return _then(_value.copyWith(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      faq: null == faq
          ? _value.faq
          : faq // ignore: cast_nullable_to_non_nullable
              as List<NewsFaq>,
      doubts: null == doubts
          ? _value.doubts
          : doubts // ignore: cast_nullable_to_non_nullable
              as List<NewsDoubts>,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<NewsSection>,
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as Poll?,
      formattedDescription: freezed == formattedDescription
          ? _value.formattedDescription
          : formattedDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      quizApproved: null == quizApproved
          ? _value.quizApproved
          : quizApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      pollApproved: null == pollApproved
          ? _value.pollApproved
          : pollApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      faqApproved: null == faqApproved
          ? _value.faqApproved
          : faqApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTitle: freezed == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      xUrl: freezed == xUrl
          ? _value.xUrl
          : xUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Source? source,
      @JsonKey(name: "_id") String? id,
      String title,
      String description,
      Category? category,
      String? language,
      List<dynamic>? tags,
      String? url,
      String? urlToImage,
      DateTime? publishedOn,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<NewsFaq> faq,
      List<NewsDoubts> doubts,
      List<NewsSection> sections,
      Poll? poll,
      String? formattedDescription,
      String? originalTitle,
      @JsonKey(fromJson: quizApprovedFromJson) bool quizApproved,
      @JsonKey(fromJson: quizApprovedFromJson) bool pollApproved,
      @JsonKey(fromJson: quizApprovedFromJson) bool faqApproved,
      String? notificationTitle,
      String? xUrl});

  @override
  $SourceCopyWith<$Res>? get source;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $PollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = freezed,
    Object? language = freezed,
    Object? tags = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedOn = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? faq = null,
    Object? doubts = null,
    Object? sections = null,
    Object? poll = freezed,
    Object? formattedDescription = freezed,
    Object? originalTitle = freezed,
    Object? quizApproved = null,
    Object? pollApproved = null,
    Object? faqApproved = null,
    Object? notificationTitle = freezed,
    Object? xUrl = freezed,
  }) {
    return _then(_$NewsImpl(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      faq: null == faq
          ? _value._faq
          : faq // ignore: cast_nullable_to_non_nullable
              as List<NewsFaq>,
      doubts: null == doubts
          ? _value._doubts
          : doubts // ignore: cast_nullable_to_non_nullable
              as List<NewsDoubts>,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<NewsSection>,
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as Poll?,
      formattedDescription: freezed == formattedDescription
          ? _value.formattedDescription
          : formattedDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      quizApproved: null == quizApproved
          ? _value.quizApproved
          : quizApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      pollApproved: null == pollApproved
          ? _value.pollApproved
          : pollApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      faqApproved: null == faqApproved
          ? _value.faqApproved
          : faqApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTitle: freezed == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      xUrl: freezed == xUrl
          ? _value.xUrl
          : xUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  const _$NewsImpl(
      {this.source,
      @JsonKey(name: "_id") this.id,
      required this.title,
      required this.description,
      this.category,
      this.language,
      final List<dynamic>? tags,
      this.url,
      required this.urlToImage,
      this.publishedOn,
      this.createdAt,
      this.updatedAt,
      final List<NewsFaq> faq = const [],
      final List<NewsDoubts> doubts = const [],
      final List<NewsSection> sections = const [],
      this.poll,
      required this.formattedDescription,
      required this.originalTitle,
      @JsonKey(fromJson: quizApprovedFromJson) this.quizApproved = false,
      @JsonKey(fromJson: quizApprovedFromJson) this.pollApproved = false,
      @JsonKey(fromJson: quizApprovedFromJson) this.faqApproved = false,
      required this.notificationTitle,
      this.xUrl})
      : _tags = tags,
        _faq = faq,
        _doubts = doubts,
        _sections = sections;

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final Source? source;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Category? category;
  @override
  final String? language;
  final List<dynamic>? _tags;
  @override
  List<dynamic>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? url;
  @override
  final String? urlToImage;
  @override
  final DateTime? publishedOn;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<NewsFaq> _faq;
  @override
  @JsonKey()
  List<NewsFaq> get faq {
    if (_faq is EqualUnmodifiableListView) return _faq;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faq);
  }

  final List<NewsDoubts> _doubts;
  @override
  @JsonKey()
  List<NewsDoubts> get doubts {
    if (_doubts is EqualUnmodifiableListView) return _doubts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doubts);
  }

  final List<NewsSection> _sections;
  @override
  @JsonKey()
  List<NewsSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  final Poll? poll;
  @override
  final String? formattedDescription;
  @override
  final String? originalTitle;
  @override
  @JsonKey(fromJson: quizApprovedFromJson)
  final bool quizApproved;
  @override
  @JsonKey(fromJson: quizApprovedFromJson)
  final bool pollApproved;
  @override
  @JsonKey(fromJson: quizApprovedFromJson)
  final bool faqApproved;
  @override
  final String? notificationTitle;
  @override
  final String? xUrl;

  @override
  String toString() {
    return 'News(source: $source, id: $id, title: $title, description: $description, category: $category, language: $language, tags: $tags, url: $url, urlToImage: $urlToImage, publishedOn: $publishedOn, createdAt: $createdAt, updatedAt: $updatedAt, faq: $faq, doubts: $doubts, sections: $sections, poll: $poll, formattedDescription: $formattedDescription, originalTitle: $originalTitle, quizApproved: $quizApproved, pollApproved: $pollApproved, faqApproved: $faqApproved, notificationTitle: $notificationTitle, xUrl: $xUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._faq, _faq) &&
            const DeepCollectionEquality().equals(other._doubts, _doubts) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.formattedDescription, formattedDescription) ||
                other.formattedDescription == formattedDescription) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.quizApproved, quizApproved) ||
                other.quizApproved == quizApproved) &&
            (identical(other.pollApproved, pollApproved) ||
                other.pollApproved == pollApproved) &&
            (identical(other.faqApproved, faqApproved) ||
                other.faqApproved == faqApproved) &&
            (identical(other.notificationTitle, notificationTitle) ||
                other.notificationTitle == notificationTitle) &&
            (identical(other.xUrl, xUrl) || other.xUrl == xUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        source,
        id,
        title,
        description,
        category,
        language,
        const DeepCollectionEquality().hash(_tags),
        url,
        urlToImage,
        publishedOn,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_faq),
        const DeepCollectionEquality().hash(_doubts),
        const DeepCollectionEquality().hash(_sections),
        poll,
        formattedDescription,
        originalTitle,
        quizApproved,
        pollApproved,
        faqApproved,
        notificationTitle,
        xUrl
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  const factory _News(
      {final Source? source,
      @JsonKey(name: "_id") final String? id,
      required final String title,
      required final String description,
      final Category? category,
      final String? language,
      final List<dynamic>? tags,
      final String? url,
      required final String? urlToImage,
      final DateTime? publishedOn,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final List<NewsFaq> faq,
      final List<NewsDoubts> doubts,
      final List<NewsSection> sections,
      final Poll? poll,
      required final String? formattedDescription,
      required final String? originalTitle,
      @JsonKey(fromJson: quizApprovedFromJson) final bool quizApproved,
      @JsonKey(fromJson: quizApprovedFromJson) final bool pollApproved,
      @JsonKey(fromJson: quizApprovedFromJson) final bool faqApproved,
      required final String? notificationTitle,
      final String? xUrl}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  Source? get source;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "_id")
  String? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  Category? get category;
  @override
  String? get language;
  @override
  List<dynamic>? get tags;
  @override
  String? get url;
  @override
  String? get urlToImage;
  @override
  DateTime? get publishedOn;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<NewsFaq> get faq;
  @override
  List<NewsDoubts> get doubts;
  @override
  List<NewsSection> get sections;
  @override
  Poll? get poll;
  @override
  String? get formattedDescription;
  @override
  String? get originalTitle;
  @override
  @JsonKey(fromJson: quizApprovedFromJson)
  bool get quizApproved;
  @override
  @JsonKey(fromJson: quizApprovedFromJson)
  bool get pollApproved;
  @override
  @JsonKey(fromJson: quizApprovedFromJson)
  bool get faqApproved;
  @override
  String? get notificationTitle;
  @override
  String? get xUrl;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Poll _$PollFromJson(Map<String, dynamic> json) {
  return _Poll.fromJson(json);
}

/// @nodoc
mixin _$Poll {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  Map<String, int> get results => throw _privateConstructorUsedError;
  String get yesOption => throw _privateConstructorUsedError;
  String get noOption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollCopyWith<Poll> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollCopyWith<$Res> {
  factory $PollCopyWith(Poll value, $Res Function(Poll) then) =
      _$PollCopyWithImpl<$Res, Poll>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String question,
      Map<String, int> results,
      String yesOption,
      String noOption});
}

/// @nodoc
class _$PollCopyWithImpl<$Res, $Val extends Poll>
    implements $PollCopyWith<$Res> {
  _$PollCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? results = null,
    Object? yesOption = null,
    Object? noOption = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      yesOption: null == yesOption
          ? _value.yesOption
          : yesOption // ignore: cast_nullable_to_non_nullable
              as String,
      noOption: null == noOption
          ? _value.noOption
          : noOption // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollImplCopyWith<$Res> implements $PollCopyWith<$Res> {
  factory _$$PollImplCopyWith(
          _$PollImpl value, $Res Function(_$PollImpl) then) =
      __$$PollImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String question,
      Map<String, int> results,
      String yesOption,
      String noOption});
}

/// @nodoc
class __$$PollImplCopyWithImpl<$Res>
    extends _$PollCopyWithImpl<$Res, _$PollImpl>
    implements _$$PollImplCopyWith<$Res> {
  __$$PollImplCopyWithImpl(_$PollImpl _value, $Res Function(_$PollImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? results = null,
    Object? yesOption = null,
    Object? noOption = null,
  }) {
    return _then(_$PollImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      yesOption: null == yesOption
          ? _value.yesOption
          : yesOption // ignore: cast_nullable_to_non_nullable
              as String,
      noOption: null == noOption
          ? _value.noOption
          : noOption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollImpl implements _Poll {
  const _$PollImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.question,
      required final Map<String, int> results,
      required this.yesOption,
      required this.noOption})
      : _results = results;

  factory _$PollImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String question;
  final Map<String, int> _results;
  @override
  Map<String, int> get results {
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_results);
  }

  @override
  final String yesOption;
  @override
  final String noOption;

  @override
  String toString() {
    return 'Poll(id: $id, question: $question, results: $results, yesOption: $yesOption, noOption: $noOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.yesOption, yesOption) ||
                other.yesOption == yesOption) &&
            (identical(other.noOption, noOption) ||
                other.noOption == noOption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question,
      const DeepCollectionEquality().hash(_results), yesOption, noOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollImplCopyWith<_$PollImpl> get copyWith =>
      __$$PollImplCopyWithImpl<_$PollImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollImplToJson(
      this,
    );
  }
}

abstract class _Poll implements Poll {
  const factory _Poll(
      {@JsonKey(name: "_id") required final String id,
      required final String question,
      required final Map<String, int> results,
      required final String yesOption,
      required final String noOption}) = _$PollImpl;

  factory _Poll.fromJson(Map<String, dynamic> json) = _$PollImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get question;
  @override
  Map<String, int> get results;
  @override
  String get yesOption;
  @override
  String get noOption;
  @override
  @JsonKey(ignore: true)
  _$$PollImplCopyWith<_$PollImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
mixin _$Source {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

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
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$SourceImpl(
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
class _$SourceImpl implements _Source {
  const _$SourceImpl({this.id, this.name});

  factory _$SourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Source(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceImplToJson(
      this,
    );
  }
}

abstract class _Source implements Source {
  const factory _Source({final String? id, final String? name}) = _$SourceImpl;

  factory _Source.fromJson(Map<String, dynamic> json) = _$SourceImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsFaq _$NewsFaqFromJson(Map<String, dynamic> json) {
  return _NewsFaq.fromJson(json);
}

/// @nodoc
mixin _$NewsFaq {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsFaqCopyWith<NewsFaq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsFaqCopyWith<$Res> {
  factory $NewsFaqCopyWith(NewsFaq value, $Res Function(NewsFaq) then) =
      _$NewsFaqCopyWithImpl<$Res, NewsFaq>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String question,
      String answer,
      String? imgUrl,
      String? videoUrl});
}

/// @nodoc
class _$NewsFaqCopyWithImpl<$Res, $Val extends NewsFaq>
    implements $NewsFaqCopyWith<$Res> {
  _$NewsFaqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? imgUrl = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsFaqImplCopyWith<$Res> implements $NewsFaqCopyWith<$Res> {
  factory _$$NewsFaqImplCopyWith(
          _$NewsFaqImpl value, $Res Function(_$NewsFaqImpl) then) =
      __$$NewsFaqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String question,
      String answer,
      String? imgUrl,
      String? videoUrl});
}

/// @nodoc
class __$$NewsFaqImplCopyWithImpl<$Res>
    extends _$NewsFaqCopyWithImpl<$Res, _$NewsFaqImpl>
    implements _$$NewsFaqImplCopyWith<$Res> {
  __$$NewsFaqImplCopyWithImpl(
      _$NewsFaqImpl _value, $Res Function(_$NewsFaqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? imgUrl = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_$NewsFaqImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsFaqImpl implements _NewsFaq {
  const _$NewsFaqImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.question,
      this.answer = "",
      this.imgUrl,
      this.videoUrl});

  factory _$NewsFaqImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsFaqImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String question;
  @override
  @JsonKey()
  final String answer;
  @override
  final String? imgUrl;
  @override
  final String? videoUrl;

  @override
  String toString() {
    return 'NewsFaq(id: $id, question: $question, answer: $answer, imgUrl: $imgUrl, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsFaqImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, question, answer, imgUrl, videoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsFaqImplCopyWith<_$NewsFaqImpl> get copyWith =>
      __$$NewsFaqImplCopyWithImpl<_$NewsFaqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsFaqImplToJson(
      this,
    );
  }
}

abstract class _NewsFaq implements NewsFaq {
  const factory _NewsFaq(
      {@JsonKey(name: '_id') required final String id,
      required final String question,
      final String answer,
      final String? imgUrl,
      final String? videoUrl}) = _$NewsFaqImpl;

  factory _NewsFaq.fromJson(Map<String, dynamic> json) = _$NewsFaqImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id;
  @override
  String get question;
  @override
  String get answer;
  @override
  String? get imgUrl;
  @override
  String? get videoUrl;
  @override
  @JsonKey(ignore: true)
  _$$NewsFaqImplCopyWith<_$NewsFaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsDoubts _$NewsDoubtsFromJson(Map<String, dynamic> json) {
  return _NewsDoubts.fromJson(json);
}

/// @nodoc
mixin _$NewsDoubts {
  String get doubt => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsDoubtsCopyWith<NewsDoubts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDoubtsCopyWith<$Res> {
  factory $NewsDoubtsCopyWith(
          NewsDoubts value, $Res Function(NewsDoubts) then) =
      _$NewsDoubtsCopyWithImpl<$Res, NewsDoubts>;
  @useResult
  $Res call({String doubt, String answer});
}

/// @nodoc
class _$NewsDoubtsCopyWithImpl<$Res, $Val extends NewsDoubts>
    implements $NewsDoubtsCopyWith<$Res> {
  _$NewsDoubtsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doubt = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      doubt: null == doubt
          ? _value.doubt
          : doubt // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDoubtsImplCopyWith<$Res>
    implements $NewsDoubtsCopyWith<$Res> {
  factory _$$NewsDoubtsImplCopyWith(
          _$NewsDoubtsImpl value, $Res Function(_$NewsDoubtsImpl) then) =
      __$$NewsDoubtsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String doubt, String answer});
}

/// @nodoc
class __$$NewsDoubtsImplCopyWithImpl<$Res>
    extends _$NewsDoubtsCopyWithImpl<$Res, _$NewsDoubtsImpl>
    implements _$$NewsDoubtsImplCopyWith<$Res> {
  __$$NewsDoubtsImplCopyWithImpl(
      _$NewsDoubtsImpl _value, $Res Function(_$NewsDoubtsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doubt = null,
    Object? answer = null,
  }) {
    return _then(_$NewsDoubtsImpl(
      doubt: null == doubt
          ? _value.doubt
          : doubt // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsDoubtsImpl implements _NewsDoubts {
  const _$NewsDoubtsImpl({required this.doubt, required this.answer});

  factory _$NewsDoubtsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsDoubtsImplFromJson(json);

  @override
  final String doubt;
  @override
  final String answer;

  @override
  String toString() {
    return 'NewsDoubts(doubt: $doubt, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDoubtsImpl &&
            (identical(other.doubt, doubt) || other.doubt == doubt) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, doubt, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDoubtsImplCopyWith<_$NewsDoubtsImpl> get copyWith =>
      __$$NewsDoubtsImplCopyWithImpl<_$NewsDoubtsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsDoubtsImplToJson(
      this,
    );
  }
}

abstract class _NewsDoubts implements NewsDoubts {
  const factory _NewsDoubts(
      {required final String doubt,
      required final String answer}) = _$NewsDoubtsImpl;

  factory _NewsDoubts.fromJson(Map<String, dynamic> json) =
      _$NewsDoubtsImpl.fromJson;

  @override
  String get doubt;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$NewsDoubtsImplCopyWith<_$NewsDoubtsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
