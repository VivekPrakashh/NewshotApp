import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/widgets/more_news_share_widget.dart';
import 'package:news_shots_app/app/core/widgets/share_bottom_sheet.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../data/db/database.dart';
import '../data/models/news/news.dart';
import '../data/services/dynamic_link_services.dart';
import '../modules/news_stories/ui_states/news_or_thread.dart';
import 'flutter_rating_dialog.dart';
import 'widgets/faq_share_widget.dart';
import 'widgets/news_share_widget.dart';
import 'widgets/share_fact_widget.dart';

class UtilsFunction {
  // static sendNewsDuration(
  //     News news, Duration duration, bool pollAnswred, int faqReadPercentage) {
  //   // Get.find<NewsServices>()
  //   //     .sendNewsReadLog(duration: duration,pollAnswered: pollAnswred,faqPercentage: faqReadPercentage);
  // }

  static showRatingDialog() {
    try {
      Get.find<AppLocalDB>()
          .localSessionsDao
          .shouldShowRatingDialog()
          .then((value) {
        if (value) {
          Future.delayed(
            1.seconds,
            () {
              Get.dialog(const RatingDialog());
            },
          );
        }
      });
    } on Exception catch (e, s) {
      Get.find<Logger>()
          .e("error showing rating dialog", error: e, stackTrace: s);
    }
  }

  static Future<XFile> _getXFileFromWidget(Widget widget, String fileName,
      {bool isLong = false}) async {
    if (isLong) {
      final ScreenshotController screenshotController = ScreenshotController();
      final val = await screenshotController.captureFromLongWidget(
        widget,
        delay: 100.milliseconds,
        context: Get.context!,
        constraints: BoxConstraints(
          maxWidth: Get.width,
          maxHeight: Get.height * 2,
        ),
        pixelRatio: Get.pixelRatio,
      );
      return XFile.fromData(val, name: "$fileName.png", mimeType: "image/png");
    } else {
      final image = await ScreenshotController.widgetToUiImage(
        widget,
        context: Get.context,
        delay: 200.milliseconds,
      );

      final png = await image.toByteData(format: ImageByteFormat.png);

      Uint8List pngBytes = png!.buffer.asUint8List();
      return XFile.fromData(pngBytes,
          name: "$fileName.png", mimeType: "image/png");
    }
  }

  static shareNewsOrThread(NewsOrThread newsOrThread) async {
    EasyLoading.show();
    try {
      await newsOrThread.when(news: (news) async {
        final shareNews = Get.find<DiscoveryController>()
            .news
            .take(5)
            .where((element) => element != news)
            .toList();

        final shareFiles = <XFile>[];
        shareFiles.add(await _getXFileFromWidget(
            NewsShare(news: news), news.id!,
            isLong: true));
        if (news.sections.isNotEmpty) {
          await _getXFileFromWidget(
            FaqShareWidget(faqs: news.sections, newsTitle: news.title),
            "${news.id}facts",
            // isLong: true,
          ).then((value) {
            shareFiles.add(value);
          });
        }
        _getXFileFromWidget(MoreNewsShareWidget(news: shareNews), "morenews",
                isLong: true)
            .then((value) {
          shareFiles.add(value);
        });

        final newsShareLink =
            await DynamicLinkServices.createNewsShareLink(news.id!);
        Get.bottomSheet(ShareBottomSheet(
          files: shareFiles,
          text: "${news.title}\nSee here: $newsShareLink",
          summary: "${news.title}\nSee here: $newsShareLink",
          news: news,
          moreNews: shareNews,
        ));
      }, thread: (thread) async {
        if (thread.facts.isEmpty) {
          return;
        }
        List<XFile> files = [];

        for (var i = 0; i < thread.facts.length; i++) {
          final image = await ScreenshotController.widgetToUiImage(
              ThreadShareWidget(thread: thread, currentIndex: i),
              context: Get.context);

          final png = await image.toByteData(format: ImageByteFormat.png);

          Uint8List pngBytes = png!.buffer.asUint8List();
          final file =
              XFile.fromData(pngBytes, name: "fact.png", mimeType: "image/png");
          files.add(file);
        }

        final newsShareLink =
            await DynamicLinkServices.createThreadShareLink(thread.id);

        if (files.isNotEmpty) {
          Share.shareXFiles(files,
              text: "Shared via Reveal Inside App\nSee here: $newsShareLink");
        }
      });
    } catch (e, s) {
      Get.find<Logger>()
          .e("Error in share News or Thread", error: e, stackTrace: s);
    }
    EasyLoading.dismiss();
  }
}

List<News> removeDuplicatesFromNews(List<News> originalList) {
  var uniqueMap = {for (var item in originalList) item.id: item};
  return uniqueMap.values.toList();
}

Future<bool> pingExternal() async {
  try {
    final response = await Dio().get('https://httpbin.org/get',
        options: Options(
          sendTimeout: 5.seconds,
          receiveTimeout: 5.seconds,
        ));
    return response.statusCode == 200;
  } on Exception {
    return false;
  }
}

List<News> processNewsList(Iterable<News> newsList, bool shuffle) {
  // Step 1: Group by createdAt date
  var groupedNews = <DateTime, List<News>>{};
  for (var news in newsList) {
    if (news.createdAt == null) {
      continue;
    }
    var date = DateTime(
        news.createdAt!.year, news.createdAt!.month, news.createdAt!.day);
    groupedNews.putIfAbsent(date, () => []).add(news);
  }

  // Step 2: Shuffle each group
  if (shuffle) {
    for (var group in groupedNews.values) {
      group.shuffle();
    }
  }

  // Step 3: Sort and flatten the groups
  var sortedKeys = groupedNews.keys.toList()
    ..sort((a, b) => b.compareTo(a)); // Sort in descending order

  var result = <News>[];
  for (var key in sortedKeys) {
    result.addAll(groupedNews[key]!);
  }

  return result;
}
