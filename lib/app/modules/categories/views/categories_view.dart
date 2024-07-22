import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../data/core/analytics_custom_event.dart';
import '../../../routes/app_pages.dart';
import '../../news_details/news_details_arguments/news_details_arguments.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_all_categories.tr),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () {
              Get.toNamed(
                Routes.NEWS_DETAILS,
                arguments: NewsDetailsArguments(
                  news: [],
                  currentIndex: 0,
                  onLoad: (count) {
                    return controller.loadNewsByCategory(index, count);
                  },
                  redirectToMainNews: true,
                ),
              );
              Get.find<FirebaseAnalytics>().logEvent(
                  name: AnalyticsCustomEvent.category_clicked.name,
                  parameters: {
                    "category": controller.categories[index].name,
                  });
            },
            title: Text((Get.locale?.isEnglish() ?? true)
                ? controller.categories[index].name
                : controller.categories[index].hindiName),
          ),
        ),
      ),
    );
  }
}
