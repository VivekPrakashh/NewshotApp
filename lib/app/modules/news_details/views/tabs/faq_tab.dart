import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../controller/time_tracking_controller.dart';
import '../../../../core/colors.dart';
import '../../../../core/gen/fonts.gen.dart';
import '../../../../data/core/analytics_custom_event.dart';
import '../../../../data/models/news/news.dart';

class FaqSection extends StatefulWidget {
  final News news;
  const FaqSection({
    super.key,
    required this.news,
  });

  // final NewsSourceController controller;

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  // DateTime? _startTime;
  final currentExpensionIndex = Rxn(0);
  final openFaqIndex = <int>{};

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused ||
  //       state == AppLifecycleState.inactive) {
  //     if (_startTime != null) {
  //       // updateDuration();
  //       Get.find<TimeTrackController>(tag: widget.news.id!).setTimeSpendInFaq =
  //           DateTime.now().difference(_startTime!).inSeconds;
  //       _startTime = null;
  //       print("didChangeAppLifecycleState delete TimeTrackController");
  //       Get.delete<TimeTrackController>(tag: widget.news.id!, force: true);
  //     }
  //   }

  //   if (state == AppLifecycleState.resumed) {
  //     _startTime ??= DateTime.now();
  //     if (!Get.isRegistered<TimeTrackController>(tag: widget.news.id!)) {
  //       Get.put(TimeTrackController(news: widget.news),
  //           tag: widget.news.id!, permanent: true);
  //     }
  //   }
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  void initState() {
    openFaqIndex.add(0);
    // Get.find<FirebaseAnalytics>()
    //     .logEvent(name: AnalyticsCustomEvent.faq_open.name, parameters: {
    //   "news_id": widget.news.id,
    //   "news_title": widget.news.title
    //       .substring(0, min(38, (widget.news.title.length - 1))),
    //   "category": widget.news.category?.name ?? "",
    // });
    if (Get.isRegistered<TimeTrackController>(tag: widget.news.id!)) {
      Get.find<TimeTrackController>(tag: widget.news.id!).faqOpenCount =
          openFaqIndex.length;
    }

    super.initState();
  }

  @override
  void dispose() {
    // if (_startTime != null) {
    //   final duration = DateTime.now().difference(_startTime!).inSeconds;
    //   Get.find<FirebaseAnalytics>()
    //       .logEvent(name: AnalyticsCustomEvent.faq_close.name, parameters: {
    //     "news_id": widget.news.id,
    //     "news_title": widget.news.title
    //         .substring(0, min(38, (widget.news.title.length - 1))),
    //     "category": widget.news.category?.name ?? "",
    //     "duration": duration,
    //   });
    //   Get.find<TimeTrackController>(tag: widget.news.id!).faqOpenCount =
    //       openFaqIndex.length;

    //   _startTime = null;
    // }
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text(LocaleKeys.news_facts.tr),
        //   centerTitle: true,
        // ),
        Center(
          child: Text(
            LocaleKeys.news_facts.tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
        ),
        const Divider(),
        // Text(
        //   "FAQ",
        //   style: Get.theme.textTheme.titleLarge,
        // ),
        if (widget.news.faq.isNotEmpty)
          Obx(() {
            return SelectionArea(
              child: ExpansionPanelList(
                elevation: 4,
                expandedHeaderPadding: EdgeInsets.zero,
                expandIconColor: Get.theme.primaryColor,
                expansionCallback: (panelIndex, isExpanded) {
                  try {
                    openFaqIndex.add(panelIndex);
                    if (Get.isRegistered<TimeTrackController>(
                        tag: widget.news.id!)) {
                      Get.find<TimeTrackController>(tag: widget.news.id!)
                          .faqOpenCount = openFaqIndex.length;
                    }
                    if (currentExpensionIndex.value == panelIndex) {
                      currentExpensionIndex.value = null;
                      return;
                    }
                    currentExpensionIndex.value = panelIndex;
                    Get.find<FirebaseAnalytics>().logEvent(
                        name: AnalyticsCustomEvent.faq_expanded.name,
                        parameters: {
                          "news_id": widget.news.id ?? "no id",
                          "news_title": widget.news.title.substring(
                              0, min(38, (widget.news.title.length - 1))),
                          "category": widget.news.category?.name ?? "",
                          "faqTitle": widget.news.faq[panelIndex].question,
                        });
                  } catch (e, s) {
                    Get.find<Logger>().e("Error in faq expand click",
                        error: e, stackTrace: s);
                  }
                },
                children: widget.news.faq
                    .mapIndexed<ExpansionPanel>((i, e) => ExpansionPanel(
                          canTapOnHeader: true,
                          isExpanded: currentExpensionIndex.value == i,
                          headerBuilder: (context, isExpanded) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Text(
                              e.question.trim(),
                              style: Get.textTheme.titleMedium?.copyWith(
                                color: AppColors.action2,
                                fontFamily: FontFamily.inter,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          body: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                if (e.imgUrl != null && e.imgUrl!.isNotEmpty)
                                  CachedNetworkImage(imageUrl: e.imgUrl!),
                                const SizedBox(
                                  height: 10,
                                ),

                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(e.answer.trim(),
                                        style:
                                            Get.textTheme.bodyLarge?.copyWith(
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.inter,
                                          // color: Get.isDarkMode
                                          //     ? Colors.white70
                                          //     : Colors.grey.shade700,
                                        ))),
                                const SizedBox(
                                  height: 20,
                                ),
                                // if (e.imgUrl?.isURL ?? false)
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            );
          })
        else
          const Center(
            child: Text("No Data!!"),
          ),
        // const SizedBox(
        //   height: 80,
        // )
      ],
    );
  }
}
