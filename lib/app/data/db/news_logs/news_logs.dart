import 'package:drift/drift.dart';

class NewsLogs extends Table {
  TextColumn get newsId => text().unique()();
  TextColumn get pollAnswer => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get durationWatched => integer().withDefault(const Variable(0))();
  BoolColumn get isNews => boolean()();
}
