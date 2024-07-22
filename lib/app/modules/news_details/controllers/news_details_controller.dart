import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:news_shots_app/app/core/util_functions.dart';
import 'package:news_shots_app/app/modules/news_details/news_details_arguments/news_details_arguments.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/db/database.dart';

class NewsDetailsController extends GetxController {
  final newsList = <NewsOrThread>[].obs;
  final NewsDetailsArguments arguments = Get.arguments;
  // late final int currentIndex;
  late PageController pageController;
  final showAppBar = false.obs;
  int newsOffset = 10;
  final isLoading = false.obs;
  final RxInt currentNewsIndex = 0.obs;
  final AppLocalDB _db;

  NewsDetailsController(this._db);

  @override
  void onInit() {
    newsList.value = arguments.news;
    // print("initial news length:${arguments.news.length}");
    currentNewsIndex.value = arguments.currentIndex;

    // print("current $currentNewsIndex");
    newsOffset = newsOffset + 10;
    arguments.onLoad?.call(newsOffset).then((value) {
      value.removeWhere(
          (element) => newsList.contains(NewsOrThread.news(news: element)));
      newsList.value = [
        ...newsList,
        ...value.map((e) => NewsOrThread.news(news: e))
      ];
    });

    pageController = PageController(
      initialPage: currentNewsIndex.value,
    );
    if (arguments.redirectToMainNews) {
      final de = Debouncer(delay: 200.milliseconds);

      pageController.addListener(() {
        if (pageController.hasClients) {
          if (!isLoading.value &&
              (pageController.position.pixels >
                  pageController.position.maxScrollExtent)) {
            loadMoreNews(currentNewsIndex.value).then((value) {
              if (value != null && !value) {
                de.call(() {
                  EasyLoading.showSuccess(
                      "You have read all News in Category, Redirecting you to main news");

                  Future.delayed(
                    600.milliseconds,
                    () {
                      Get.toNamed(Routes.NEWS_STORIES);
                    },
                  );
                });
              }
            });
          }
        }
      });
    }
    super.onInit();
  }

  onPageChange(int page) {
    currentNewsIndex.value = page;
    // print(currentNewsIndex);
    loadMoreNews(page);
    // print(page);
  }

  Future<bool?> loadMoreNews(int page) async {
    if (newsList.isNotEmpty &&
        (page + 3) > (newsList.length - 1) &&
        !isLoading.value) {
      isLoading.value = true;
      debugPrint("load more news");
      newsOffset = newsOffset + 10;
      // print("Offset$newsOffset");
      return await arguments.onLoad?.call(newsOffset).then((value) {
        debugPrint("Fetched news length${value.length}");
        value.removeWhere(
            (element) => newsList.contains(NewsOrThread.news(news: element)));
        if (value.isEmpty) {
          return false;
        }
        newsList.value = [
          ...newsList,
          ...value.map((e) => NewsOrThread.news(news: e))
        ];
        isLoading.value = false;
        return true;
      });
    }
    return null;
  }

  Stream<NewsBookmark?> getBookmarkById({String? id}) {
    if (id != null) {
      return _db.newsBookmarksDao.getBookmarkByIdStream(id);
    }

    if (newsList.isEmpty) {
      return const Stream.empty();
    }
    return _db.newsBookmarksDao
        .getBookmarkByIdStream(newsList[currentNewsIndex.value].id);
  }

  addToBookmark({NewsOrThread? news}) async {
    if (news == null) {
      if (newsList.isEmpty) return;
      news = newsList[currentNewsIndex.value];
    }
    await _db.newsBookmarksDao.addToBookmark(news);
    news.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "thread_id": thread.id,
            "thread_title": thread.threadTitle
                    ?.substring(0, min(thread.threadTitle!.length, 39)) ??
                'no title',
          });
    });
  }

  removeFromBookmark({NewsOrThread? news}) async {
    if (news == null) {
      if (newsList.isEmpty) return;
      news = newsList[currentNewsIndex.value];
    }

    await _db.newsBookmarksDao.removeFromBookmark(news.id);

    news.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "thread_id": thread.id,
            "thread_title": thread.threadTitle
                    ?.substring(0, min(thread.threadTitle!.length, 39)) ??
                'no title',
          });
    });
  }

  // Future<Uint8List> createPdf(Uint8List imageBytes) async {
  //   // Uint8List imageBytes = await captureWidgetToImage();
  //   final pdf = pw.Document();

  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) {
  //         return pw.Image(
  //           pw.MemoryImage(imageBytes),
  //           width: Get.width,
  //         );
  //       },
  //       margin: pw.EdgeInsets.zero,
  //       pageFormat: PdfPageFormat.a4,
  //     ),
  //   );
  //   return pdf.save();
  // }

  // Future<XFile> getXFileFromWidget(Widget widget, String fileName,
  //     {bool isLong = false}) async {
  //   if (isLong) {
  //     final ScreenshotController screenshotController = ScreenshotController();
  //     final val = await screenshotController.captureFromLongWidget(
  //       widget,
  //       delay: 100.milliseconds,
  //       context: Get.context!,
  //       constraints: BoxConstraints(
  //         maxWidth: Get.width,
  //       ),
  //       pixelRatio: Get.pixelRatio,
  //     );
  //     return XFile.fromData(val, name: "$fileName.png", mimeType: "image/png");
  //   } else {
  //     final image = await ScreenshotController.widgetToUiImage(
  //       widget,
  //       context: Get.context,
  //       delay: 100.milliseconds,
  //     );

  //     final png = await image.toByteData(format: ImageByteFormat.png);

  //     Uint8List pngBytes = png!.buffer.asUint8List();
  //     return XFile.fromData(pngBytes,
  //         name: "$fileName.png", mimeType: "image/png");
  //   }
  // }

  // List<List<T>> splitList<T>(List<T> list, int chunkSize) {
  //   List<List<T>> chunks = [];

  //   for (var i = 0; i < list.length; i += chunkSize) {
  //     int end = (i + chunkSize < list.length) ? i + chunkSize : list.length;
  //     chunks.add(list.sublist(i, end));
  //   }

  //   return chunks;
  // }

  // final Map<String, List<int>> newShare = {};

  shareNewsClicked() async {
    UtilsFunction.shareNewsOrThread(newsList[currentNewsIndex.value]);
    // EasyLoading.show();
    // try {
    //   await newsList[currentNewsIndex.value].when(news: (news) async {
    //     final shareFiles = <XFile>[];
    //     shareFiles.add(await getXFileFromWidget(NewsShare(news: news), news.id!,
    //         isLong: false));
    //     if (news.sections.isNotEmpty) {
    //       await getXFileFromWidget(
    //         FaqShareWidget(faqs: news.sections, newsTitle: news.title),
    //         "${news.id}facts",
    //         // isLong: true,
    //       ).then((value) {
    //         shareFiles.add(value);
    //       });
    //     }

    //     final newsShareLink =
    //         await DynamicLinkServices.createNewsShareLink(news.id!);

    //     Share.shareXFiles(shareFiles,
    //             text: "${news.title}\nSee here: $newsShareLink")
    //         .then(
    //       (value) {
    //         if (value.status == ShareResultStatus.success) {
    //           UtilsFunction.showRatingDialog();
    //         }
    //       },
    //     );
    //     Get.find<FirebaseAnalytics>()
    //         .logEvent(name: AnalyticsCustomEvent.news_shared.name, parameters: {
    //       "news_id": news.id,
    //       "news_title":
    //           news.title.substring(0, min(38, (news.title.length - 1))),
    //       "category": news.category?.name ?? "",
    //     });
    //   }, thread: (thread) async {
    //     if (thread.facts.isEmpty) {
    //       return;
    //     }
    //     List<XFile> files = [];

    //     for (var i = 0; i < thread.facts.length; i++) {
    //       final image = await ScreenshotController.widgetToUiImage(
    //           ThreadShareWidget(thread: thread, currentIndex: i),
    //           context: Get.context);

    //       final png = await image.toByteData(format: ImageByteFormat.png);

    //       Uint8List pngBytes = png!.buffer.asUint8List();
    //       final file =
    //           XFile.fromData(pngBytes, name: "fact.png", mimeType: "image/png");
    //       files.add(file);
    //     }

    //     final newsShareLink =
    //         await DynamicLinkServices.createThreadShareLink(thread.id);

    //     if (files.isNotEmpty) {
    //       Share.shareXFiles(files,
    //           text: "Shared via Reveal Inside App\nSee here: $newsShareLink");
    //     }
    //   });
    // } catch (e, s) {
    //   Get.find<Logger>().e("Error in share News or Thread", e, s);
    // }
    // EasyLoading.dismiss();
  }

  Future<void> insertNewsLogToDb(String s, bool isNews) async {
    await _db.newsLogsDao.insertLog(newsId: s, isNews: isNews);
  }
}
