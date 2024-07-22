import 'dart:math';
import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/controller/time_tracking_controller.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/util_functions.dart';
import '../../../core/widgets/faq_share_widget.dart';
import '../../../core/widgets/news_share_widget.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/services/dynamic_link_services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class NewsSourceController extends GetxController {
  final News news = Get.arguments as News;
  final AppLocalDB _db;

  final currentExpensionIndex = Rxn(0);
  final openFaqIndex = <int>{};

  NewsSourceController(this._db);

  @override
  void onInit() {
    openFaqIndex.add(0);

    super.onInit();
  }

  @override
  void onClose() {
    Get.find<TimeTrackController>(tag: news.id!).faqOpenCount =
        openFaqIndex.length;
    super.onClose();
  }

  addToBookmark() async {
    await _db.newsBookmarksDao.addToBookmark(NewsOrThread.news(news: news));
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.bookmark_added.name, parameters: {
      "news_id": news.id ?? 'no id',
      "news_title": news.title.substring(0, min(38, (news.title.length - 1))),
    });
  }

  removeFromBookmark() async {
    await _db.newsBookmarksDao.removeFromBookmark(news.id!);
    Get.find<FirebaseAnalytics>().logEvent(
        name: AnalyticsCustomEvent.bookmark_removed.name,
        parameters: {
          "news_id": news.id ?? 'no id',
          "news_title":
              news.title.substring(0, min(38, (news.title.length - 1))),
        });
  }

  Stream<NewsBookmark?> getBookmarkStream() {
    return _db.newsBookmarksDao.getBookmarkByIdStream(news.id!);
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

  Future<void> shareNewsClicked() async {
    EasyLoading.show();
    final shareFiles = <XFile>[];
    shareFiles.add(await getXFileFromWidget(NewsShare(news: news), news.id!,
        isLong: false));
    if (news.sections.isNotEmpty) {
      await getXFileFromWidget(
        FaqShareWidget(faqs: news.sections, newsTitle: news.title),
        "${news.id}facts",
        // isLong: true,
      ).then((value) {
        shareFiles.add(value);
      });
    }

    final newsShareLink =
        await DynamicLinkServices.createNewsShareLink(news.id!);

    Share.shareXFiles(shareFiles,
            text: "${news.title}\nSee here: $newsShareLink")
        .then(
      (value) {
        if (value.status == ShareResultStatus.success) {
          UtilsFunction.showRatingDialog();
        }
      },
    );
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.news_shared.name, parameters: {
      "news_id": news.id ?? 'no id',
      "news_title": news.title.substring(0, min(38, (news.title.length - 1))),
      "category": news.category?.name ?? "",
    });
    EasyLoading.dismiss();
  }
}
