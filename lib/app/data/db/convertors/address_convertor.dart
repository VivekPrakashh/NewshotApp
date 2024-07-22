import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/models/address.dart';

class AddressConvertor extends TypeConverter<Address, String> {
  @override
  Address fromSql(String fromDb) {
    return Address.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Address value) {
    return json.encode(value.toJson());
  }
}
