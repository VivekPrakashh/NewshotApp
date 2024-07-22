// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String? get a1 => throw _privateConstructorUsedError;
  String? get b1 => throw _privateConstructorUsedError;
  String? get c1 => throw _privateConstructorUsedError;
  String? get d1 => throw _privateConstructorUsedError;
  String get correctOption =>
      throw _privateConstructorUsedError; // required int correctPoints,
// required int wrongPoints,
// required bool active,
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get article => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String question,
      String? a1,
      String? b1,
      String? c1,
      String? d1,
      String correctOption,
      DateTime createdAt,
      DateTime updatedAt,
      String article});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? a1 = freezed,
    Object? b1 = freezed,
    Object? c1 = freezed,
    Object? d1 = freezed,
    Object? correctOption = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? article = null,
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
      a1: freezed == a1
          ? _value.a1
          : a1 // ignore: cast_nullable_to_non_nullable
              as String?,
      b1: freezed == b1
          ? _value.b1
          : b1 // ignore: cast_nullable_to_non_nullable
              as String?,
      c1: freezed == c1
          ? _value.c1
          : c1 // ignore: cast_nullable_to_non_nullable
              as String?,
      d1: freezed == d1
          ? _value.d1
          : d1 // ignore: cast_nullable_to_non_nullable
              as String?,
      correctOption: null == correctOption
          ? _value.correctOption
          : correctOption // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String question,
      String? a1,
      String? b1,
      String? c1,
      String? d1,
      String correctOption,
      DateTime createdAt,
      DateTime updatedAt,
      String article});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? a1 = freezed,
    Object? b1 = freezed,
    Object? c1 = freezed,
    Object? d1 = freezed,
    Object? correctOption = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? article = null,
  }) {
    return _then(_$QuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      a1: freezed == a1
          ? _value.a1
          : a1 // ignore: cast_nullable_to_non_nullable
              as String?,
      b1: freezed == b1
          ? _value.b1
          : b1 // ignore: cast_nullable_to_non_nullable
              as String?,
      c1: freezed == c1
          ? _value.c1
          : c1 // ignore: cast_nullable_to_non_nullable
              as String?,
      d1: freezed == d1
          ? _value.d1
          : d1 // ignore: cast_nullable_to_non_nullable
              as String?,
      correctOption: null == correctOption
          ? _value.correctOption
          : correctOption // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl with DiagnosticableTreeMixin implements _Quiz {
  const _$QuizImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.question,
      required this.a1,
      required this.b1,
      required this.c1,
      required this.d1,
      required this.correctOption,
      required this.createdAt,
      required this.updatedAt,
      required this.article});

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String question;
  @override
  final String? a1;
  @override
  final String? b1;
  @override
  final String? c1;
  @override
  final String? d1;
  @override
  final String correctOption;
// required int correctPoints,
// required int wrongPoints,
// required bool active,
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String article;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quiz(id: $id, question: $question, a1: $a1, b1: $b1, c1: $c1, d1: $d1, correctOption: $correctOption, createdAt: $createdAt, updatedAt: $updatedAt, article: $article)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Quiz'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('a1', a1))
      ..add(DiagnosticsProperty('b1', b1))
      ..add(DiagnosticsProperty('c1', c1))
      ..add(DiagnosticsProperty('d1', d1))
      ..add(DiagnosticsProperty('correctOption', correctOption))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('article', article));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.a1, a1) || other.a1 == a1) &&
            (identical(other.b1, b1) || other.b1 == b1) &&
            (identical(other.c1, c1) || other.c1 == c1) &&
            (identical(other.d1, d1) || other.d1 == d1) &&
            (identical(other.correctOption, correctOption) ||
                other.correctOption == correctOption) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.article, article) || other.article == article));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, a1, b1, c1, d1,
      correctOption, createdAt, updatedAt, article);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {@JsonKey(name: "_id") required final String id,
      required final String question,
      required final String? a1,
      required final String? b1,
      required final String? c1,
      required final String? d1,
      required final String correctOption,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String article}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get question;
  @override
  String? get a1;
  @override
  String? get b1;
  @override
  String? get c1;
  @override
  String? get d1;
  @override
  String get correctOption;
  @override // required int correctPoints,
// required int wrongPoints,
// required bool active,
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get article;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
