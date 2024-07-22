import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_user_dto.freezed.dart';
part 'app_user_dto.g.dart';

@freezed
class AppUserDto with _$AppUserDto {
  const factory AppUserDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    String? language,
    String? latitude,
    String? longitude,
    String? city,
    String? state,
    @Default(false) bool isBlocked,
    @Default(false) bool disabled,
    @Default([]) List interests,
    @Default([]) List newsSeenToday,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AppUserDto;

  factory AppUserDto.fromJson(Map<String, dynamic> json) =>
      _$AppUserDtoFromJson(json);
}
