import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/local_session/local_session.dart';
import 'package:news_shots_app/app/data/db/unread_thread/unread_thread.dart';

import '../../models/threads/thread.dart';
part 'unread_thread_dao.g.dart';

@DriftAccessor(tables: [UnreadThread, LocalSession])
class UnreadThreadDao extends DatabaseAccessor<AppLocalDB>
    with _$UnreadThreadDaoMixin {
  UnreadThreadDao(super.attachedDatabase);

  Future<void> saveThreads({required List<Thread> threads}) async {
    final threadToInsert = threads.map(
      (e) => UnreadThreadCompanion.insert(
        id: e.id,
        createdAt: e.createdAt,
        updatedAt: e.updatedAt,
        facts: Value(e.facts),
        tags: Value(e.tags),
        backgroundImgUrl: Value(e.backgroundImgUrl),
        contentTitle: Value(e.contentTitle),
        language: Value(e.language),
        publishedOn: Value(e.publishedOn),
        threadTitle: Value(e.threadTitle),
        titleHeader: Value(e.titleHeader),
        titleFooter: Value(e.titleFooter),
      ),
    );

    await batch(
      (batch) => batch.insertAll(
        unreadThread,
        threadToInsert,
        mode: InsertMode.insertOrIgnore,
      ),
    );
  }

  Stream<List<Thread>> getThreads() {
    return (select(unreadThread)
          ..where((tbl) => tbl.language.equals(
              Get.locale?.getLanguageString().toLowerCase() ?? 'english'))
          ..orderBy([(u) => OrderingTerm.asc(u.createdAt)]))
        .watch()
        .map((event) => event
            .map((e) => Thread(
                  id: e.id,
                  createdAt: e.createdAt,
                  updatedAt: e.updatedAt,
                  backgroundImgUrl: e.backgroundImgUrl,
                  contentTitle: e.contentTitle,
                  facts: e.facts ?? [],
                  language: e.language,
                  publishedOn: e.publishedOn,
                  source: e.source,
                  tags: e.tags ?? [],
                  threadTitle: e.threadTitle,
                  titleFooter: e.titleFooter,
                  titleHeader: e.titleHeader,
                ))
            .toList());
  }

  Future<void> removeThreadById(String id) {
    return (delete(unreadThread)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> deleteThreadsOnLanguageChange() async {
    await delete(unreadThread).go();
    await update(localSession)
        .write(const LocalSessionCompanion(lastFatchedThreadId: Value(null)));
  }
}
