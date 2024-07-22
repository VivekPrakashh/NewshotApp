import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:news_shots_app/app/core/text_scale_factors.dart';

class TextScaleFactorConvertor extends TypeConverter<TextScaleFactor, String> {
  @override
  TextScaleFactor fromSql(String fromDb) {
    return TextScaleFactor.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(TextScaleFactor value) {
    return json.encode(value.toJson());
  }
}
