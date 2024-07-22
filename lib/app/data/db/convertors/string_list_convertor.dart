import 'dart:convert';

import 'package:drift/drift.dart';

class StringListConvertor extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return (json.decode(fromDb) as List).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}
