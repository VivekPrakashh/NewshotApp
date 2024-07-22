import 'package:drift/drift.dart';

class NewsBookmarks extends Table {
  TextColumn get newsId => text()();
  TextColumn get categoryId => text().nullable()();
  BoolColumn get isNews => boolean()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Variable(DateTime.now()))();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(Variable(DateTime.now()))();

  @override
  Set<Column<Object>>? get primaryKey => {newsId};
}
