import 'package:drift/drift.dart';

class ShowCaseActions extends Table {
  TextColumn get actionId => text()();
  BoolColumn get hasShownToolTip =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get hasActionTap => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>>? get primaryKey => {actionId};
}
