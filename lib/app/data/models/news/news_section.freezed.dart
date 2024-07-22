// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsSection _$NewsSectionFromJson(Map<String, dynamic> json) {
  return _NewsSection.fromJson(json);
}

/// @nodoc
mixin _$NewsSection {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String? get sourceUrl => throw _privateConstructorUsedError;
  String? get sourceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsSectionCopyWith<NewsSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsSectionCopyWith<$Res> {
  factory $NewsSectionCopyWith(
          NewsSection value, $Res Function(NewsSection) then) =
      _$NewsSectionCopyWithImpl<$Res, NewsSection>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String question,
      String answer,
      String? sourceUrl,
      String? sourceName});
}

/// @nodoc
class _$NewsSectionCopyWithImpl<$Res, $Val extends NewsSection>
    implements $NewsSectionCopyWith<$Res> {
  _$NewsSectionCopyWithImpl(this._value, this._then);

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
    Object? sourceUrl = freezed,
    Object? sourceName = freezed,
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
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceName: freezed == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsSectionImplCopyWith<$Res>
    implements $NewsSectionCopyWith<$Res> {
  factory _$$NewsSectionImplCopyWith(
          _$NewsSectionImpl value, $Res Function(_$NewsSectionImpl) then) =
      __$$NewsSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String question,
      String answer,
      String? sourceUrl,
      String? sourceName});
}

/// @nodoc
class __$$NewsSectionImplCopyWithImpl<$Res>
    extends _$NewsSectionCopyWithImpl<$Res, _$NewsSectionImpl>
    implements _$$NewsSectionImplCopyWith<$Res> {
  __$$NewsSectionImplCopyWithImpl(
      _$NewsSectionImpl _value, $Res Function(_$NewsSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? sourceUrl = freezed,
    Object? sourceName = freezed,
  }) {
    return _then(_$NewsSectionImpl(
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
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceName: freezed == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsSectionImpl implements _NewsSection {
  const _$NewsSectionImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.question,
      required this.answer,
      this.sourceUrl,
      this.sourceName});

  factory _$NewsSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsSectionImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String? sourceUrl;
  @override
  final String? sourceName;

  @override
  String toString() {
    return 'NewsSection(id: $id, question: $question, answer: $answer, sourceUrl: $sourceUrl, sourceName: $sourceName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, question, answer, sourceUrl, sourceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsSectionImplCopyWith<_$NewsSectionImpl> get copyWith =>
      __$$NewsSectionImplCopyWithImpl<_$NewsSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsSectionImplToJson(
      this,
    );
  }
}

abstract class _NewsSection implements NewsSection {
  const factory _NewsSection(
      {@JsonKey(name: "_id") required final String id,
      required final String question,
      required final String answer,
      final String? sourceUrl,
      final String? sourceName}) = _$NewsSectionImpl;

  factory _NewsSection.fromJson(Map<String, dynamic> json) =
      _$NewsSectionImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get question;
  @override
  String get answer;
  @override
  String? get sourceUrl;
  @override
  String? get sourceName;
  @override
  @JsonKey(ignore: true)
  _$$NewsSectionImplCopyWith<_$NewsSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
