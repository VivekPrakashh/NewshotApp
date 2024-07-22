import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../data/core/analytics_custom_event.dart';
import '../../../../data/models/news/news.dart';

class FullArticle extends StatefulWidget {
  final News news;
  const FullArticle({super.key, required this.news});

  @override
  State<FullArticle> createState() => _FullArticleState();
}

class _FullArticleState extends State<FullArticle> {
  @override
  void initState() {
    Get.find<FirebaseAnalytics>().logEvent(
        name: AnalyticsCustomEvent.full_news_details_open.name,
        parameters: {
          "news_id": widget.news.id ?? "no id",
          "news_title": widget.news.title
              .substring(0, min(38, (widget.news.title.length - 1))),
          "category": widget.news.category?.name ?? "",
        });
    super.initState();
  }

  @override
  void dispose() {
    if (_startTime != null) {
      final duration = DateTime.now().difference(_startTime!).inSeconds;
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.full_news_details_close.name,
          parameters: {
            "news_id": widget.news.id ?? "no id",
            "news_title": widget.news.title
                .substring(0, min(38, (widget.news.title.length - 1))),
            "category": widget.news.category?.name ?? "",
            "duration": duration,
          });
    }

    super.dispose();
  }

  DateTime? _startTime;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: ListView(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          Center(
            child: Text(
              LocaleKeys.title_full_article.tr,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
          ),
          const Divider(),
          // AppBar(
          //   automaticallyImplyLeading: false,
          //   title: Text(LocaleKeys.title_full_article.tr),
          //   centerTitle: true,
          // ),
          // Text(
          //   widget.news.originalTitle
          //           ?.replaceAll("\r", "")
          //           .replaceAll("\n", "")
          //           .trim() ??
          //       "",
          //   style: const TextStyle(
          //       fontSize: 20, fontWeight: FontWeight.w600, fontFamily: "Inter"
          //       // height: 1.2,
          //       ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Scrollbar(
            trackVisibility: true,
            child: HtmlWidget(
              "${widget.news.formattedDescription!}<div style='height: 80px;font-size: 0'>hidden</div>",
              // renderMode: RenderMode.listView,
              customStylesBuilder: (e) {
                return e.nodeType == 1 ? {'font-size': '1.2em'} : null;
              },
              customWidgetBuilder: (element) {
                if (element.attributes.containsValue(widget.news.urlToImage)) {
                  return Container();
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
