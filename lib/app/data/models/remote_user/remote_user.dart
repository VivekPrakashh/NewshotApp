import 'package:freezed_annotation/freezed_annotation.dart';

import '../news/category.dart';
part 'remote_user.freezed.dart';
part 'remote_user.g.dart';

@freezed
class RemoteUser with _$RemoteUser {
  const factory RemoteUser({
    @JsonKey(name: "_id") required String id,
    @Default(false) bool preferencesAsked,
    // @Default([]) List<SubCategory> preferences,
    @Default([]) List<Category> categories,
  }) = _RemoteUser;

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);
}
