import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../../core/widgets/highlight_clickable_text.dart';
import '../../../../data/core/analytics_custom_event.dart';
import 'news_details_tab.dart';

class SectionTab extends StatefulWidget {
  final News news;
  const SectionTab({super.key, required this.news});

  @override
  State<SectionTab> createState() => _SectionTabState();
}

class _SectionTabState extends State<SectionTab> {
  @override
  initState() {
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.headline_open.name, parameters: {
      "news_id": widget.news.id ?? "no id",
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });

    super.initState();
  }

  onHighlightClick(String text) {
    final doubt = widget.news.doubts
        .where((e) => e.doubt.toLowerCase() == text.toLowerCase())
        .firstOrNull;
    if (doubt != null) {
      Get.bottomSheet(DoubtBottomSheet(doubt: doubt));
    }
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.doubt_clicked.name, parameters: {
      "news_id": widget.news.id ?? "no id",
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
      "doubt": text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final highlightWords =
        widget.news.doubts.map((e) => e.doubt.toLowerCase()).toList();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          LocaleKeys.headlines.tr,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 50),
        itemCount: widget.news.sections.length,
        itemBuilder: (context, index) {
          final section = widget.news.sections[index];
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  HighlightedClickableText(
                    enableTextSelection: true,
                    onClick: onHighlightClick,
                    highlightedWords: highlightWords,
                    text: section.question,
                    style: const TextStyle(
                      fontSize: 19,
                      decoration: TextDecoration.underline,
                      color: AppColors.actionRed,
                      decorationColor: AppColors.actionRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HighlightedClickableText(
                    enableTextSelection: true,
                    onClick: onHighlightClick,
                    highlightedWords: highlightWords,
                    text: section.answer,
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
