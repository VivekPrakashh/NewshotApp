import 'dart:math';
import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/util_functions.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/core/analytics_custom_event.dart';
import '../../../data/db/database.dart';
import '../../../data/models/news/topic.dart';
import '../../news_stories/ui_states/news_or_thread.dart';

class TopicNewsController extends GetxController {
  final topic = Get.arguments as Topic;
  // late final List<String> newsIds;
  final news = <News>[].obs;
  late PageController pageController;
  int faqReadPercentage = 0;
  bool pollAnswred = false;
  final RxInt currentNewsIndex = 0.obs;
  final AppLocalDB _db;
  final NewsServices _newsServices;
  List<String> readNewsIds = <String>[];
  List<String> newsIdsToFetch = <String>[];
  int lastFetchedIndex = 0;
  final hideHeader = false.obs;

  TopicNewsController(this._db, this._newsServices);

  final showAppBar = true.obs;

  @override
  Future<void> onInit() async {
    final newsIds = topic.articleDisplayOrder;
    pageController = PageController(
      initialPage: 0,
    );
    readNewsIds = await _db.newsLogsDao.getReadNewsByIds(newsIds).then(
        (value) => value
            .where((element) => element.isNews)
            .map((e) => e.newsId)
            .toList());

    newsIdsToFetch = List.from(newsIds);
    if ((newsIds.length / 2).ceil() > readNewsIds.length) {
      newsIdsToFetch.removeWhere((element) => readNewsIds.contains(element));
    }

    loadNews();
    super.onInit();
  }

  Future<void> loadNews() async {
    if ((lastFetchedIndex < newsIdsToFetch.length)) {
      int endIndex = lastFetchedIndex + 10 > newsIdsToFetch.length
          ? newsIdsToFetch.length
          : lastFetchedIndex + 10;
      List<String> batchIds =
          newsIdsToFetch.sublist(lastFetchedIndex, endIndex);
      final result = await _newsServices.getNewsByIds(ids: batchIds);

      result.fold((l) => null, (r) {
        news.addAll(r);
        lastFetchedIndex = endIndex;
      });
    }
  }

  onPageChange(int value) async {
    if (value == news.length) {
      hideHeader.value = true;
    } else {
      hideHeader.value = false;
    }
    if (value < news.length) {
      currentNewsIndex.value = value;
    }
    if (lastFetchedIndex == newsIdsToFetch.length) {
      // all news loaded
      print("All news Loaded");
    } else {
      if (currentNewsIndex.value + 5 > news.length) {
        await loadNews();
      }
    }
  }

  void sendNewsDuration(News news, Duration duration) {
    // Get.find<NewsServices>()
    //     .sendNewsReadLog(duration, news.id!, pollAnswred, faqReadPercentage);
  }

  removeFromBookmark({News? news}) async {
    if (news == null) {
      if (this.news.isEmpty) return;
      news = this.news[currentNewsIndex.value];
    }

    await _db.newsBookmarksDao.removeFromBookmark(news.id!);

    Get.find<FirebaseAnalytics>().logEvent(
        name: AnalyticsCustomEvent.bookmark_removed.name,
        parameters: {
          "news_id": news.id ?? 'no id',
          "news_title":
              news.title.substring(0, min(38, (news.title.length - 1))),
        });
  }

  addToBookmark({required News? news}) async {
    if (news == null) {
      if (this.news.isEmpty) return;
      news = this.news[currentNewsIndex.value];
    }

    await _db.newsBookmarksDao.addToBookmark(NewsOrThread.news(news: news));

    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.bookmark_added.name, parameters: {
      "news_id": news.id ?? 'no id',
      "news_title": news.title.substring(0, min(38, (news.title.length - 1))),
    });
  }

  Stream<NewsBookmark?> getBookmarkById({String? id}) {
    if (id != null) {
      return _db.newsBookmarksDao.getBookmarkByIdStream(id);
    }

    if (news.isEmpty) {
      return const Stream.empty();
    }
    return _db.newsBookmarksDao
        .getBookmarkByIdStream(news[currentNewsIndex.value].id!);
  }

  Future<XFile> getXFileFromWidget(Widget widget, String fileName,
      {bool isLong = false}) async {
    if (isLong) {
      final ScreenshotController screenshotController = ScreenshotController();
      final val = await screenshotController.captureFromLongWidget(
        widget,
        delay: 100.milliseconds,
        context: Get.context!,
        constraints: BoxConstraints(
          maxWidth: Get.width,
        ),
        pixelRatio: Get.pixelRatio,
      );
      return XFile.fromData(val, name: "$fileName.png", mimeType: "image/png");
    } else {
      final image = await ScreenshotController.widgetToUiImage(
        widget,
        context: Get.context,
        delay: 100.milliseconds,
      );

      final png = await image.toByteData(format: ImageByteFormat.png);

      Uint8List pngBytes = png!.buffer.asUint8List();
      return XFile.fromData(pngBytes,
          name: "$fileName.png", mimeType: "image/png");
    }
  }

  shareNewsClicked() async {
    UtilsFunction.shareNewsOrThread(
        NewsOrThread.news(news: news[currentNewsIndex.value]));
    // EasyLoading.show();
    // try {
    //   final news = this.news[currentNewsIndex.value];
    //   final shareFiles = <XFile>[];
    //   shareFiles.add(await getXFileFromWidget(NewsShare(news: news), news.id!,
    //       isLong: false));
    //   if (news.sections.isNotEmpty) {
    //     await getXFileFromWidget(
    //       FaqShareWidget(faqs: news.sections, newsTitle: news.title),
    //       "${news.id}facts",
    //       // isLong: true,
    //     ).then((value) {
    //       shareFiles.add(value);
    //     });
    //   }

    //   final newsShareLink =
    //       await DynamicLinkServices.createNewsShareLink(news.id!);

    //   Share.shareXFiles(shareFiles,
    //       text: "Shared via Reveal Inside App\nSee here: $newsShareLink");
    // } catch (e, s) {
    //   Get.find<Logger>().e("Error in share News or Thread", e, s);
    // }
    // EasyLoading.dismiss();
  }

  Future<void> insertNewsLogToDb(String s, bool isNews) async {
    await _db.newsLogsDao.insertLog(newsId: s, isNews: isNews);
  }
}
