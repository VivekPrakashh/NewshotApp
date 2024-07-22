import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/show_case_actions/show_case_actions.dart';
part 'show_case_actions_dao.g.dart';

@DriftAccessor(tables: [ShowCaseActions])
class ShowCaseActionsDao extends DatabaseAccessor<AppLocalDB>
    with _$ShowCaseActionsDaoMixin {
  ShowCaseActionsDao(super.attachedDatabase);

  Future<bool> isToolTipShow(String actionConstant) async {
    final value = await (select(showCaseActions)
          ..where((tbl) => tbl.actionId.equals(actionConstant)))
        .getSingleOrNull();
    if (value == null) {
      return false;
    } else {
      return value.hasShownToolTip;
    }
  }

  Future<bool> hasEverDoneAction(String actionConstant) async {
    final value = await (select(showCaseActions)
          ..where((tbl) => tbl.actionId.equals(actionConstant)))
        .getSingleOrNull();
    if (value == null) {
      return false;
    } else {
      return value.hasActionTap;
    }
  }

  Future<ShowCaseAction> getShowCaseAction(String actionId) async {
    final value = await (select(showCaseActions)
          ..where((tbl) => tbl.actionId.equals(actionId)))
        .getSingleOrNull();
    if (value == null) {
      return ShowCaseAction(
          actionId: actionId, hasShownToolTip: false, hasActionTap: false);
    } else {
      return value;
    }
  }

  Future<void> markTooltipShown(String actionId) async {
    await (into(showCaseActions).insertOnConflictUpdate(
      ShowCaseActionsCompanion.insert(
          actionId: actionId, hasShownToolTip: const Value(true)),
    ));
  }

  Future<void> markActionTapped(String actionId) async {
    await (into(showCaseActions).insertOnConflictUpdate(
      ShowCaseActionsCompanion.insert(
          actionId: actionId, hasActionTap: const Value(true)),
    ));
  }
}
