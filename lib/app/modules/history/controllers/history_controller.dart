import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

class HistoryController extends GetxController {
  final AppLocalDB _db;
  final NewsServices _newsServices;
  final news = <NewsOrThread>[].obs;
  final totalNewsOrThreadLogs = <NewsLog>[].obs;
  final loadedIds = <NewsLog>[].obs;
  late final ScrollController listScrollController;
  final isLoading = false.obs;
  final searchString = "".obs;

  HistoryController(this._db, this._newsServices);
  @override
  Future<void> onInit() async {
    listScrollController = ScrollController();
    await fetchHistoryIds();
    await fetchHistorysData().then((value) {
      // if (listScrollController.hasClients) {
      //   listScrollController.addListener(() async {
      //     print("object");
      //     print(!isLoading.value);
      //     print((totalNewsOrThreadLogs.length > loadedIds.length));
      //     print(listScrollController.position.pixels + 150 >=
      //         listScrollController.position.maxScrollExtent);
      //     if (!isLoading.value &&
      //         (totalNewsOrThreadLogs.length > loadedIds.length) &&
      //         listScrollController.position.pixels + 150 >=
      //             listScrollController.position.maxScrollExtent) {
      //       print("fetchHistorysData");
      //       await fetchHistorysData();
      //     }
      //   });
      // }
    });

    super.onInit();
  }

  Future<void> fetchHistorysData() async {
    if (totalNewsOrThreadLogs.isNotEmpty &&
        totalNewsOrThreadLogs.length > loadedIds.length) {
      List<NewsLog> batchIds = totalNewsOrThreadLogs.sublist(
          loadedIds.length,
          loadedIds.length + 20 < totalNewsOrThreadLogs.length
              ? loadedIds.length + 20
              : totalNewsOrThreadLogs.length);

      loadedIds.value = [...loadedIds, ...batchIds];

      await fetchHistoryNews(batchIds);
    }
  }

  fetchHistoryIds() async {
    totalNewsOrThreadLogs.value = await _db.newsLogsDao.getReadNews();
  }

  fetchHistoryNews(List<NewsLog> newsOrThreadLogs) async {
    isLoading.value = true;
    final newsIds = newsOrThreadLogs
        .where((element) => element.isNews)
        .map((e) => e.newsId)
        .toList();
    final threadIds = newsOrThreadLogs
        .where((element) => !element.isNews)
        .map((e) => e.newsId)
        .toList();
    if (newsIds.isNotEmpty) {
      await _newsServices.getNewsByIds(ids: newsIds).then((value) {
        value.fold(
          (l) {},
          (r) {
            news.value = [
              ...news,
              ...r.map((e) => NewsOrThread.news(news: e)).toList()
            ];
          },
        );
      });
    }
    if (threadIds.isNotEmpty) {
      await _newsServices.getThreadByIds(ids: threadIds).then((value) {
        value.fold(
          (l) {},
          (r) {
            // r.sort((a, b) =>
            //     newsIds.indexOf(a.id!).compareTo(newsIds.indexOf(b.id!)));

            news.value = [
              ...news,
              ...r.map((e) => NewsOrThread.thread(thread: e))
            ];
          },
        );
      });
    }

    final newsOrThreadIds = newsOrThreadLogs.map((e) => e.newsId).toList();

    news.sort((a, b) =>
        newsOrThreadIds.indexOf(a.id).compareTo(newsOrThreadIds.indexOf(b.id)));
    isLoading.value = false;
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
