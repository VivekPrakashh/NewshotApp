import 'package:get/get.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

class BookmarksController extends GetxController {
  final NewsServices _newsServices;
  final AppLocalDB _db;
  final isLoading = false.obs;

  final news = <NewsOrThread>[].obs;
  final totalNewsOrThreadBookmark = <NewsBookmark>[].obs;
  final loadedIds = <NewsBookmark>[].obs;
  final searchString = "".obs;

  BookmarksController(this._newsServices, this._db);
  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await fetchBookmarkIds();
    await fetchBookmarkData();
    // await _db.newsBookmarksDao.getBookmarks().then((event) async {});
    isLoading.value = false;
    // _newsServices.getNewsByIds(ids: ids);

    super.onInit();
  }

  Future<void> fetchBookmarkIds() async {
    totalNewsOrThreadBookmark.value = await _db.newsBookmarksDao.getBookmarks();
  }

  fetchBookmarkNews(List<NewsBookmark> event) async {
    if (event.isEmpty) return;
    isLoading.value = true;
    final newsIds =
        event.where((element) => element.isNews).map((e) => e.newsId).toList();
    final threadIds =
        event.where((element) => !element.isNews).map((e) => e.newsId).toList();

    printInfo(info: event.map((e) => e.newsId).toList().toString());

    if (newsIds.isNotEmpty) {
      await _newsServices.getNewsByIds(ids: newsIds).then((value) {
        value.fold((l) => null, (r) {
          news.value = [
            ...news,
            ...r.map((e) => NewsOrThread.news(news: e)).toList()
          ];
        });
      });
    }
    if (threadIds.isNotEmpty) {
      await _newsServices.getThreadByIds(ids: threadIds).then((value) {
        value.fold((l) => null, (r) {
          news.value = [
            ...news,
            ...r.map((e) => NewsOrThread.thread(thread: e))
          ];
        });
      });
    }

    final newsOrThreadIds = event.map((e) => e.newsId).toList();

    news.sort((a, b) =>
        newsOrThreadIds.indexOf(a.id).compareTo(newsOrThreadIds.indexOf(b.id)));
    isLoading.value = false;
  }

  Future<void> fetchBookmarkData() async {
    if (totalNewsOrThreadBookmark.isNotEmpty &&
        totalNewsOrThreadBookmark.length > loadedIds.length) {
      List<NewsBookmark> batchIds = totalNewsOrThreadBookmark.sublist(
          loadedIds.length,
          loadedIds.length + 20 < totalNewsOrThreadBookmark.length
              ? loadedIds.length + 20
              : totalNewsOrThreadBookmark.length);

      loadedIds.value = [...loadedIds, ...batchIds];

      await fetchBookmarkNews(batchIds);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
