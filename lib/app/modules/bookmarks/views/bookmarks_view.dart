// ignore_for_file: invalid_use_of_protected_member

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/widgets/news_list_card.dart';
import 'package:news_shots_app/app/data/models/threads/thread.dart';
import 'package:news_shots_app/app/modules/history/views/history_view.dart';
import 'package:news_shots_app/app/modules/news_details/news_details_arguments/news_details_arguments.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';

import '../controllers/bookmarks_controller.dart';

class BookmarksView extends GetView<BookmarksController> {
  const BookmarksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved News'),
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
        return newsList.isEmpty
            ? Center(
                child: controller.isLoading.value
                    ? const Text("Loading...")
                    : const Text("No Saved Items found"),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return WrapButtonAtEnd(
                      showButton: (index == controller.news.length - 1) &&
                          controller.totalNewsOrThreadBookmark.length !=
                              controller.loadedIds.length,
                      button: Obx(() {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(40)),
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  controller.fetchBookmarkData();
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
                                  news: controller.news.value,
                                  currentIndex: index,
                                  onLoad: null),
                            );
                          },
                        ),
                        thread: (thread) => InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.NEWS_DETAILS,
                              arguments: NewsDetailsArguments(
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

class ThreadListCard extends StatelessWidget {
  final Thread thread;
  const ThreadListCard({
    super.key,
    required this.thread,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: thread.backgroundImgUrl == null
              ? null
              : DecorationImage(
                  image: CachedNetworkImageProvider(
                    thread.backgroundImgUrl!,
                  ),
                  fit: BoxFit.cover,
                ),
        ),
        height: Get.getAppTextScaleFactor
            .when(small: () => 90, normal: () => 100, large: () => 120),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          color: Colors.black.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  thread.threadTitle?.capitalize ?? "",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: CachedNetworkImage(
                      imageUrl: thread.facts.first.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
