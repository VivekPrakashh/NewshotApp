import 'dart:convert';
import 'package:drift/drift.dart';

class GenericConvertor<T> extends TypeConverter<T, String> {
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  GenericConvertor({
    required this.fromJson,
    required this.toJson,
  });

  @override
  T fromSql(String fromDb) {
    return fromJson((json.decode(fromDb) as Map<String, dynamic>));
  }

  @override
  String toSql(T value) {
    return json.encode(toJson(value));
  }
}
