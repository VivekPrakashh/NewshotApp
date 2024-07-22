import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class InfraFailure with _$InfraFailure {
  const factory InfraFailure.serverError({String? errorMessage}) = _ServerError;
  const factory InfraFailure.unexpected({String? errorMessage}) = _Unexpected;
  const factory InfraFailure.noInternet() = _NoInternet;
  const factory InfraFailure.noFcmToken() = _NoFcmToken;
}
