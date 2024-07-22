// class TypeConverter<S, T> {
//   T toSql(S value);
//   S fromSql(T fromDb);
// }

import 'dart:convert';

import 'package:drift/drift.dart';

class GenericListConvertor<T> extends TypeConverter<List<T>, String> {
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  GenericListConvertor({
    required this.fromJson,
    required this.toJson,
  });

  @override
  List<T> fromSql(String fromDb) {
    return (json.decode(fromDb) as List).map((e) => fromJson(e)).toList();
  }

  @override
  String toSql(List<T> value) {
    return json.encode(value.map((e) => toJson(e)).toList());
  }
}
