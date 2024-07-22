import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

import '../data/core/analytics_custom_event.dart';
import '../modules/news_details/views/news_details.dart';

class TimeTrackController extends GetxController {
  final News news;
  int faqOpenCount = 0;
  int timeSpendInFAQ = 0;
  int timeSpendInQuiz = 0;
  int timeSpendInSummary = 0;
  int timeSpendInDetails = 0;
  int timeSpendInHeadlines = 0;
  bool hasAnsweredPoll = false;

  TimeTrackController({required this.news});

  set setTimeSpendInDetails(int time) {
    debugPrint("updated time spend$time");
    timeSpendInDetails = timeSpendInDetails + time;
  }

  set setTimeSpendInFaq(int time) {
    timeSpendInFAQ = timeSpendInFAQ + time;
  }

  set setTimeSpendInSummary(int time) {
    timeSpendInSummary = timeSpendInSummary + time;
  }

  set setTimeSpendInQuiz(int time) {
    timeSpendInQuiz = timeSpendInQuiz + time;
  }

  set setTimeSpendInHeadlines(int time) {
    timeSpendInHeadlines = timeSpendInHeadlines + time;
  }

  sendLog() {
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.news_viewed.name, parameters: {
      "news_id": news.id ?? "no id",
      "news_title": news.title.substring(0, min(38, (news.title.length - 1))),
      "category": news.category?.name ?? "",
      "duration": timeSpendInDetails,
    });

    Get.find<NewsServices>().sendNewsReadLog(
      newsId: news.id!,
      duration: (timeSpendInDetails +
          timeSpendInFAQ +
          timeSpendInQuiz +
          timeSpendInSummary +
          timeSpendInHeadlines),
      pollAnswered: hasAnsweredPoll,
      faqPercentage: faqOpenCount,
      timeSpendInDetails: timeSpendInDetails,
      timeSpendInFaq: timeSpendInFAQ,
      timeSpendInQuiz: timeSpendInQuiz,
      timeSpendInSummary: timeSpendInSummary,
      timeSpendInHeadlines: timeSpendInHeadlines,
    );
  }

  mapTime(Map<TabType, int> timeSpentPerTab) {
    timeSpentPerTab.forEach((tab, time) {
      switch (tab) {
        case TabType.news:
          timeSpendInDetails = time;
          break;
        case TabType.sections:
          timeSpendInHeadlines = time;
          break;
        case TabType.faq:
          timeSpendInFAQ = time;
          break;
        case TabType.details:
          timeSpendInSummary = time;
          break;
        case TabType.quiz:
          timeSpendInQuiz = time;
          break;
        default:
      }
    });
  }

  @override
  void onClose() {
    debugPrint("NewsId:${news.id}");
    debugPrint("NewsTitel:${news.title}");
    debugPrint("faqOpenCount:$faqOpenCount");
    debugPrint("timeSpendInFAQ:$timeSpendInFAQ");
    debugPrint("timeSpendInQuiz:$timeSpendInQuiz");
    debugPrint("timeSpendInSummary:$timeSpendInSummary");
    debugPrint("timeSpendInDetails:$timeSpendInDetails");
    debugPrint("hasAnsweredPoll$hasAnsweredPoll");
    debugPrint("timeSpendInHeadlines$timeSpendInHeadlines");

    if (timeSpendInDetails != 0) {
      sendLog();
    }
    super.onClose();
  }
}
