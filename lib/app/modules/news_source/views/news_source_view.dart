import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/modules/news_source/views/quiz_page.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/widgets/form_helper.dart';
import '../../../core/widgets/report_bottom_sheet.dart';
import '../../../data/db/database.dart';
import '../../news_details/views/tabs/faq_tab.dart';
import '../../news_details/views/tabs/full_article_tab.dart';
import '../controllers/news_source_controller.dart';

class NewsSourceView extends GetView<NewsSourceController> {
  const NewsSourceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int currentTabLength = 0;

    if ((controller.news.faq.isNotEmpty && controller.news.faqApproved)) {
      currentTabLength++;
    }
    if (controller.news.formattedDescription != null &&
        controller.news.formattedDescription!.isNotEmpty) {
      currentTabLength++;
    }
    if (controller.news.quizApproved) {
      currentTabLength++;
    }

    return DefaultTabController(
      length: currentTabLength,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FormHelper.iconButton(
                iconColor: Colors.red.shade500,
                icon: Icons.report,
                onTap: () {
                  Get.bottomSheet(
                    ReportBottomSheet(
                        newsOrThread: NewsOrThread.news(news: controller.news)),
                    isScrollControlled: true,
                  );
                },
              ),
              const SizedBox(
                width: 5,
              ),
              StreamBuilder<NewsBookmark?>(
                  stream: controller.getBookmarkStream(),
                  builder: (context, snapshot) {
                    NewsBookmark? bookmark;
                    if (snapshot.hasData) {
                      bookmark = snapshot.data;
                    }

                    return FormHelper.iconButton(
                      icon: bookmark != null
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      iconColor: bookmark != null ? Colors.green : null,
                      onTap: () async {
                        if (bookmark != null) {
                          await controller.removeFromBookmark();
                        } else {
                          await controller.addToBookmark();
                        }
                      },
                    );
                  }),
              const SizedBox(
                width: 5,
              ),
              FormHelper.iconButton(
                icon: HeroIcons.share,
                onTap: () {
                  controller.shareNewsClicked();
                },
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leadingWidth: 45,
          actions: const [
            SizedBox(
              width: 45,
            )
          ],
          title: Center(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary.withOpacity(0.15),
              child: TabBar(
                  dividerColor: Colors.transparent,
                  // onTap: (value) =>
                  //     controller.updateTheme(ThemeMode.values[value]),
                  indicator: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.white,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  tabs: [
                    if ((controller.news.faq.isNotEmpty &&
                        controller.news.faqApproved))
                      Tab(
                        text: LocaleKeys.title_news_facts.tr,
                      ),
                    if (controller.news.formattedDescription != null &&
                        controller.news.formattedDescription!.isNotEmpty)
                      Tab(
                        text: LocaleKeys.details.tr,
                      ),
                    if (controller.news.quizApproved)
                      Tab(
                        text: LocaleKeys.title_quiz.tr,
                      )
                  ]),
            ),
          ),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          if ((controller.news.faq.isNotEmpty && controller.news.faqApproved))
            FaqSection(
              news: controller.news,
            ),
          if (controller.news.formattedDescription != null &&
              controller.news.formattedDescription!.isNotEmpty)
            FullArticle(news: controller.news),
          if (controller.news.quizApproved) QuizPage(news: controller.news),
        ]),
      ),
    );
  }
}
