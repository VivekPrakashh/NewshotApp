import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_shots_app/app/core/widgets/news_list_card.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

import '../../../routes/app_pages.dart';
import '../../bookmarks/views/bookmarks_view.dart';
import '../../news_details/news_details_arguments/news_details_arguments.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 5),
            child: TextFormField(
              onChanged: (value) {
                controller.searchString.value = value;
              },
              style: const TextStyle(
                fontSize: 14.5,
              ),
              decoration: const InputDecoration(
                // filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                isDense: true,
                suffixIcon: Icon(
                  Icons.search,
                  size: 24,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                hintText: "Search...",
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        // ignore: invalid_use_of_protected_member
        final newsList = controller.news.value.where((p0) {
          if (p0.isThread) {
            return true;
          }
          if (p0.getNews()!.notificationTitle != null) {
            p0
                .getNews()!
                .notificationTitle!
                .toLowerCase()
                .contains(controller.searchString.toLowerCase());
          }
          return p0
              .getNews()!
              .title
              .toLowerCase()
              .contains(controller.searchString.toLowerCase());
        }).toList();
        return controller.loadedIds.isEmpty
            ? const Center(
                child: Text("No History Found"),
              )
            : controller.isLoading.value
                ? const Center(
                    child: Text("Loading..."),
                  )
                : ListView.builder(
                    // controller: controller.listScrollController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      return WrapButtonAtEnd(
                          showButton: (index == controller.news.length - 1) &&
                              controller.totalNewsOrThreadLogs.length !=
                                  controller.loadedIds.length,
                          button: Obx(() {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(40)),
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () {
                                      controller.fetchHistorysData();
                                    },
                              child: controller.isLoading.value
                                  ? const Text("Loading...")
                                  : const Text("Load More"),
                            );
                          }),
                          child: newsList[index].when(
                            news: (news) => NewsListCard(
                                news: news,
                                onTap: () {
                                  Get.toNamed(
                                    Routes.NEWS_DETAILS,
                                    arguments: NewsDetailsArguments(
                                      // ignore: invalid_use_of_protected_member
                                      news: controller.news.value,
                                      currentIndex: index,
                                      onLoad: null,
                                    ),
                                  );
                                }),
                            thread: (thread) => InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.NEWS_DETAILS,
                                  arguments: NewsDetailsArguments(
                                      // ignore: invalid_use_of_protected_member
                                      news: controller.news.value,
                                      currentIndex: index,
                                      onLoad: null),
                                );
                              },
                              child: ThreadListCard(
                                thread: thread,
                              ),
                            ),
                          ));
                    },
                  );
      }),
    );
  }
}

class WrapButtonAtEnd extends StatelessWidget {
  final Widget child;
  final Widget button;
  final bool showButton;
  const WrapButtonAtEnd(
      {super.key,
      required this.child,
      required this.button,
      this.showButton = false});

  @override
  Widget build(BuildContext context) {
    if (!showButton) {
      return child;
    }

    return Column(
      children: [child, button],
    );
  }
}
