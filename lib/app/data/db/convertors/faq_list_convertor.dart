import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';

class FaqListConvertor extends TypeConverter<List<NewsFaq>, String> {
  @override
  List<NewsFaq> fromSql(String fromDb) {
    return (json.decode(fromDb) as List)
        .map((e) => NewsFaq.fromJson(e))
        .toList();
  }

  @override
  String toSql(List<NewsFaq> value) {
    return json.encode(value);
  }
}
