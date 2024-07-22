import 'dart:io';
import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/core/analytics_custom_event.dart';
import '../util_functions.dart';

class ShareBottomSheet extends StatefulWidget {
  final List<XFile> files;
  final String text;
  final String summary;
  final News news;
  final List<News> moreNews;

  const ShareBottomSheet(
      {super.key,
      required this.files,
      required this.text,
      required this.summary,
      required this.news,
      required this.moreNews});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  final shareApp = [
    "com.whatsapp",
    "org.telegram.messenger",
    "com.facebook.katana",
    "com.twitter.android"
  ];
  final installedAppPackages = <String>[].obs;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      filterInstalledApp();
    }
  }

  shareToWhatsApp(String package) {
    if (Platform.isIOS) {
      Share.shareXFiles(
        widget.files,
        text: widget.text,
        subject: widget.summary,
      ).then(
        (value) {
          if (value.status == ShareResultStatus.success) {
            UtilsFunction.showRatingDialog();
          }
        },
      );
      return;
    } else {
      Share.shareXFilesWithPackage(
        widget.files,
        package: package,
        text: widget.text,
        subject: widget.summary,
      ).then(
        (value) {
          if (value.status == ShareResultStatus.success) {
            UtilsFunction.showRatingDialog();
          }
        },
      );
    }

    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.news_shared.name, parameters: {
      "news_id": widget.news.id ?? 'No Ids',
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });
  }

  shareToTelegram() {
    final additionalText =
        '''\n\nRead More:\n${widget.moreNews.map((e) => "• ${e.title}").join("\n")}\n\nDownload our app for more news.\nStay informed, stay trendy.\nhttps://play.google.com/store/apps/details?id=com.revealInside
''';

    Share.shareXFilesWithPackage(
      [widget.files.first],
      package: "org.telegram.messenger",
      text: widget.text + additionalText,
      // subject: widget.summary,
    ).then(
      (value) {
        if (value.status == ShareResultStatus.success) {
          UtilsFunction.showRatingDialog();
        }
      },
    );
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.news_shared.name, parameters: {
      "news_id": widget.news.id ?? 'No Ids',
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });
  }

  List<Widget> getShareAppIcons() {
    List<Widget> appIcons = [];
    for (var element in installedAppPackages) {
      if (element == "com.whatsapp") {
        appIcons.add(IconButton(
            onPressed: () {
              shareToWhatsApp("com.whatsapp");
            },
            icon: Column(
              children: [
                Brand(
                  Brands.whatsapp,
                  size: 45,
                ),
                const Text(
                  "Whatsapp",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )));
        continue;
      }
      if (element == "org.telegram.messenger") {
        appIcons.add(IconButton(
            onPressed: () {
              shareToTelegram();
            },
            icon: Column(
              children: [
                Brand(
                  Brands.telegram_app,
                  size: 45,
                ),
                const Text("Telegram",
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            )));
        continue;
      }
      if (element == "com.facebook.katana") {
        appIcons.add(IconButton(
            onPressed: () {
              shareToWhatsApp("com.facebook.katana");
            },
            icon: Column(
              children: [
                Brand(
                  Brands.facebook_circled,
                  size: 45,
                ),
                const Text("Facebook",
                    style: TextStyle(
                      fontSize: 12,
                    )),
              ],
            )));
        continue;
      }
      if (element == "com.twitter.android") {
        appIcons.add(IconButton(
            onPressed: () {
              shareToWhatsApp("com.twitter.android");
            },
            icon: Column(
              children: [
                Brand(
                  Brands.twitterx_2,
                  size: 45,
                ),
                const Text("X",
                    style: TextStyle(
                      fontSize: 12,
                    )),
              ],
            )));
        continue;
      }
    }

    appIcons.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              handleShareToOther();
            },
            icon: const Icon(Bootstrap.share),
          ),
          const Text(
            "Others",
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    ));

    return appIcons;
  }

  filterInstalledApp() async {
    installedAppPackages.value = await Share.checkInstalledPackages(shareApp);
  }

  handleShareToOther() {
    final box = context.findRenderObject() as RenderBox?;
    Share.shareXFiles(
      widget.files,
      text: widget.text,
      subject: widget.summary,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    ).then(
      (value) {
        if (value.status == ShareResultStatus.success) {
          UtilsFunction.showRatingDialog();
        }
      },
    );
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.news_shared.name, parameters: {
      "news_id": widget.news.id ?? "No Ids",
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
                title: const Text("Share"),
                centerTitle: true,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  )
                ]),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    ...getShareAppIcons(),
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
