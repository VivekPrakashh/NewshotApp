import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/news_logs/news_logs.dart';

part 'news_logs_dao.g.dart';

@DriftAccessor(tables: [NewsLogs])
class NewsLogsDao extends DatabaseAccessor<AppLocalDB> with _$NewsLogsDaoMixin {
  NewsLogsDao(super.attachedDatabase);

  Future<void> insertLog({
    required String newsId,
    required bool isNews,
  }) async {
    await into(newsLogs).insert(
      NewsLogsCompanion.insert(
        newsId: newsId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isNews: isNews,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> updateDurationWatched(String newsId, int duration) async {
    await customUpdate(
      'UPDATE news_logs SET updated_at = ?, duration_watched = duration_watched + ? WHERE news_id = ?',
      variables: [
        Variable(DateTime.now()),
        Variable(duration),
        Variable(newsId)
      ],
      updates: {newsLogs},
    );
  }

  Stream<List<NewsLog>> getNewsLogs() {
    return select(newsLogs).watch();
  }

  Future<List<NewsLog>> getReadNewsByIds(List<String> newsId) async {
    return (select(newsLogs)..where((tbl) => tbl.newsId.isIn(newsId))).get();
  }

  Future<List<NewsLog>> getReadNews() async {
    return ((select(newsLogs))
          ..orderBy([
            (u) =>
                OrderingTerm(expression: u.updatedAt, mode: OrderingMode.desc),
          ])
          ..limit(100))
        .get();

    // final e = await ((selectOnly(newsLogs))
    //       ..orderBy(
    //         [
    //           OrderingTerm(
    //               expression: newsLogs.updatedAt, mode: OrderingMode.desc)
    //         ],
    //       )
    //       ..addColumns([newsLogs.newsId])
    //       ..limit(100))
    //     .map((p0) => p0.read(newsLogs.newsId)!)
    //     .get();
    // print(e);
    // return e;
  }

  setPollAnswer({required String newsId, required String answer}) async {
    await (update(newsLogs)..where((tbl) => tbl.newsId.equals(newsId))).write(
      NewsLogsCompanion(pollAnswer: Value(answer)),
    );
  }

  Stream<String?> getPollAnswer({required String newsId}) {
    return ((selectOnly(newsLogs)
          ..addColumns([newsLogs.pollAnswer])
          ..where(newsLogs.newsId.equals(newsId))))
        .map((p0) => p0.read(newsLogs.pollAnswer))
        .watchSingle();
  }

  Future<String?> getPollAnswerFuture({required String newsId}) {
    return ((selectOnly(newsLogs)
          ..addColumns([newsLogs.pollAnswer])
          ..where(newsLogs.newsId.equals(newsId))))
        .map((p0) => p0.read(newsLogs.pollAnswer))
        .getSingle();
  }

  Future<int> getNewsCount() async {
    final count = newsLogs.newsId.count(distinct: true);

    final query = selectOnly(newsLogs)..where(newsLogs.isNews);
    query.addColumns([count]);
    return (await query.map((row) => row.read(count)).getSingle()) ?? 0;
  }
}
