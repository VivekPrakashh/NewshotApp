import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';

class CategoryConvertor extends TypeConverter<Category, String> {
  @override
  Category fromSql(String fromDb) {
    return Category.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Category value) {
    return json.encode(value.toJson());
  }
}
