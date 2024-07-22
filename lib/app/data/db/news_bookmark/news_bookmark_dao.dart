import 'package:drift/drift.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

import 'news_bookmark.dart';
part 'news_bookmark_dao.g.dart';

@DriftAccessor(tables: [NewsBookmarks])
class NewsBookmarksDao extends DatabaseAccessor<AppLocalDB>
    with _$NewsBookmarksDaoMixin {
  NewsBookmarksDao(super.attachedDatabase);

  addToBookmark(NewsOrThread newsOrThread) async {
    await newsOrThread.when(news: (news) async {
      await into(newsBookmarks).insert(
        NewsBookmarksCompanion.insert(
          newsId: news.id!,
          categoryId: Value(news.category?.id),
          isNews: true,
          createdAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }, thread: (thread) async {
      await into(newsBookmarks).insert(
        NewsBookmarksCompanion.insert(
          newsId: thread.id,
          isNews: false,
          createdAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });

    EasyLoading.showToast(
      "Article Saved. Click on \"Saved\" in the menu to view all saved articles",
      duration: const Duration(seconds: 5),
    );
  }

  removeFromBookmark(String newsId) async {
    await (delete(newsBookmarks)..where((tbl) => tbl.newsId.equals(newsId)))
        .go();
  }

  Future<NewsBookmark?> getBookmarkById(String newsId) {
    return (select(newsBookmarks)..where((tbl) => tbl.newsId.equals(newsId)))
        .getSingleOrNull();
  }

  Stream<NewsBookmark?> getBookmarkByIdStream(String newsId) {
    return (select(newsBookmarks)..where((tbl) => tbl.newsId.equals(newsId)))
        .watchSingleOrNull();
  }

  Future<List<NewsBookmark>> getBookmarks() {
    return ((select(newsBookmarks))
          ..orderBy(
            [
              (tbl) => OrderingTerm(
                  expression: tbl.createdAt, mode: OrderingMode.desc)
            ],
          )
          ..limit(100))
        // .map((p0) => p0.read(newsBookmarks.newsId)!)
        .get();
  }
}
