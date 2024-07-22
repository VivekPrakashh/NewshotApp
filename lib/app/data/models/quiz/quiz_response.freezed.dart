// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) {
  return _QuizResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizResponse {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get quiz => throw _privateConstructorUsedError;
  String get article => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizResponseCopyWith<QuizResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResponseCopyWith<$Res> {
  factory $QuizResponseCopyWith(
          QuizResponse value, $Res Function(QuizResponse) then) =
      _$QuizResponseCopyWithImpl<$Res, QuizResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String quiz,
      String article,
      String user,
      String answer,
      bool isCorrect,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$QuizResponseCopyWithImpl<$Res, $Val extends QuizResponse>
    implements $QuizResponseCopyWith<$Res> {
  _$QuizResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quiz = null,
    Object? article = null,
    Object? user = null,
    Object? answer = null,
    Object? isCorrect = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as String,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResponseImplCopyWith<$Res>
    implements $QuizResponseCopyWith<$Res> {
  factory _$$QuizResponseImplCopyWith(
          _$QuizResponseImpl value, $Res Function(_$QuizResponseImpl) then) =
      __$$QuizResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String quiz,
      String article,
      String user,
      String answer,
      bool isCorrect,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$QuizResponseImplCopyWithImpl<$Res>
    extends _$QuizResponseCopyWithImpl<$Res, _$QuizResponseImpl>
    implements _$$QuizResponseImplCopyWith<$Res> {
  __$$QuizResponseImplCopyWithImpl(
      _$QuizResponseImpl _value, $Res Function(_$QuizResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quiz = null,
    Object? article = null,
    Object? user = null,
    Object? answer = null,
    Object? isCorrect = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$QuizResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as String,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResponseImpl implements _QuizResponse {
  const _$QuizResponseImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.quiz,
      required this.article,
      required this.user,
      required this.answer,
      required this.isCorrect,
      required this.createdAt,
      required this.updatedAt});

  factory _$QuizResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResponseImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String quiz;
  @override
  final String article;
  @override
  final String user;
  @override
  final String answer;
  @override
  final bool isCorrect;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuizResponse(id: $id, quiz: $quiz, article: $article, user: $user, answer: $answer, isCorrect: $isCorrect, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            (identical(other.article, article) || other.article == article) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quiz, article, user, answer,
      isCorrect, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      __$$QuizResponseImplCopyWithImpl<_$QuizResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResponseImplToJson(
      this,
    );
  }
}

abstract class _QuizResponse implements QuizResponse {
  const factory _QuizResponse(
      {@JsonKey(name: "_id") required final String id,
      required final String quiz,
      required final String article,
      required final String user,
      required final String answer,
      required final bool isCorrect,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$QuizResponseImpl;

  factory _QuizResponse.fromJson(Map<String, dynamic> json) =
      _$QuizResponseImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get quiz;
  @override
  String get article;
  @override
  String get user;
  @override
  String get answer;
  @override
  bool get isCorrect;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
