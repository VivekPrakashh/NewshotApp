import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/db/convertors/generic_convertor.dart';
import 'package:news_shots_app/app/data/db/convertors/generic_list_convertor.dart';
import 'package:news_shots_app/app/data/db/convertors/string_list_convertor.dart';
import 'package:news_shots_app/app/data/models/threads/thread.dart';

class UnreadThread extends Table {
  TextColumn get id => text().unique()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get publishedOn => dateTime().nullable()();
  TextColumn get facts => text()
      .map(GenericListConvertor<Fact>(
        fromJson: (json) => Fact.fromJson(json),
        toJson: (fact) => fact.toJson(),
      ))
      .nullable()();
  TextColumn get tags => text().map(StringListConvertor()).nullable()();
  TextColumn get source => text()
      .map(GenericConvertor<ThreadSource>(
          fromJson: (json) => ThreadSource.fromJson(json),
          toJson: (thread) => thread.toJson()))
      .nullable()();
  TextColumn get backgroundImgUrl => text().nullable()();
  TextColumn get threadTitle => text().nullable()();
  TextColumn get titleHeader => text().nullable()();
  TextColumn get titleFooter => text().nullable()();
  TextColumn get contentTitle => text().nullable()();
  TextColumn get language => text().withDefault(const Variable("english"))();
}
