import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';
part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required String latitude,
    required String longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    Location? location,
    String? state,
    String? city,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
