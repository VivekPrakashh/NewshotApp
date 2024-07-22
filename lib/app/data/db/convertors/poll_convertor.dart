import 'dart:convert';

import 'package:drift/drift.dart';

import '../../models/news/news.dart';

class PollConvertor extends TypeConverter<Poll, String> {
  @override
  Poll fromSql(String fromDb) {
    return Poll.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Poll value) {
    return json.encode(value.toJson());
  }
}
