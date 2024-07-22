import 'dart:math' as math;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/data/core/analytics_custom_event.dart';
import 'package:news_shots_app/app/data/core/show_case_constants.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/helper/ad_helper.dart';
import 'package:news_shots_app/app/modules/home/views/widgets/drawer.dart';
import 'package:news_shots_app/app/modules/news_details/views/news_options_dialog.dart';
import 'package:news_shots_app/generated/locales.g.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

import '../../../core/colors.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/util_functions.dart';
import '../../../core/widgets/form_helper.dart';
import '../../../core/widgets/news_list_card.dart';
import '../../../core/widgets/report_bottom_sheet.dart';
import '../../../core/widgets/show_case_widget.dart';
import '../../../routes/app_pages.dart';
import '../../news_details/views/news_details.dart';
import '../controllers/news_stories_controller.dart';
import '../ui_states/news_or_thread.dart';
import 'thread_view.dart';

class NewsStoriesView extends GetView<NewsStoriesController> {
  const NewsStoriesView({Key? key}) : super(key: key);

  Stream<NewsBookmark?> getBookmarkById(NewsOrThread newsOrThread) {
    return Get.find<AppLocalDB>()
        .newsBookmarksDao
        .getBookmarkByIdStream(newsOrThread!.id);
  }

  removeFromBookmark(NewsOrThread newsOrThread) async {
    await Get.find<AppLocalDB>()
        .newsBookmarksDao
        .removeFromBookmark(newsOrThread!.id);

    newsOrThread!.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, math.min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "thread_id": newsOrThread!.id,
          });
    });
  }

  addToBookmark(NewsOrThread newsOrThread) async {
    await Get.find<AppLocalDB>().newsBookmarksDao.addToBookmark(newsOrThread!);
    newsOrThread!.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, math.min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "thread_id": thread.id,
            "thread_title": thread.threadTitle
                    ?.substring(0, math.min(thread.threadTitle!.length, 39)) ??
                'no title',
          });
    });
  }

  List<Widget> getNextNewsListWidget() {
    return [
      const SizedBox(
        height: 10,
      ),
      ...controller.getNextNewsList().map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: NewsListCardHome(
                news: e,
                onTap: () {
                  Get.offNamed(
                    Routes.NEWS_STORIES,
                    preventDuplicates: false,
                    arguments: NewsOrThread.news(news: e),
                  )?.then((value) {});
                },
              ),
            ),
          ),
      Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: OutlinedButton(
            onPressed: controller.loadMoreNewsloading.value
                ? null
                : () {
                    controller.loadMoreNewsClicked();
                  },
            child: controller.loadMoreNewsloading.value
                ? const CircularProgressIndicator()
                : const Text("Load More"),
          ),
        );
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final NewsOrThread arguments = Get.arguments as NewsOrThread;
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        body: Obx(() {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: controller.newsOrThread.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(Assets.lottie.notItems),
                              const Text(
                                "No News Found",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      : Stack(
                          children: [
                            // const Positioned(
                            //     bottom: 10,
                            //     left: 0,
                            //     right: 0,
                            //     child: Center(
                            //         child: Text(
                            //             "You are at End, Check back later for more News"))),
                            PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              onPageChanged: (index) {
                                controller.onStoryChange(index);
                              },
                              itemCount: controller.newsOrThread.length,
                              controller: controller.storiesPageController,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return controller.newsOrThread[index].when(
                                    news: (news) {
                                      return NewsDetails(
                                        hideNextPrevioudControl: true,
                                        nextNews: getNextNewsListWidget(),
                                        hasPreviousNews: index > 0,
                                        onShareNewsClick:
                                            controller.shareNewsClicked,
                                        news: news,
                                        onInit: () {
                                          controller.insertNewsLogToDb(
                                              news.id!, true);
                                        },
                                        onRemoveBookmark: () =>
                                            controller.removeFromBookmark(
                                                news: NewsOrThread.news(
                                                    news: news)),
                                        onAddBookmark: () =>
                                            controller.addToBookmark(),
                                        getBookmarkStream: () => controller
                                            .getBookmarkById(id: news.id),
                                      );
                                    },
                                    thread: (thread) => ThreadsView(
                                          thread: thread,
                                        ));
                              },
                            ),
                          ],
                        ),
                ),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          UtilsFunction.shareNewsOrThread(controller
                              .newsOrThread[controller.currentNewsIndex.value]);
                        },
                        child: Material(
                          elevation: 1,
                          // color: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          // color: AppColors.primary,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Row(
                              children: [
                                Icon(
                                  Bootstrap.share,
                                  size: 16,
                                  // color: AppColors.primary,
                                  color: Get.isDarkMode
                                      ? AppColors.white
                                      : Colors.black,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  LocaleKeys.share.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),

                      StreamBuilder<NewsBookmark?>(
                          stream: getBookmarkById(arguments),
                          builder: (context, snapshot) {
                            NewsBookmark? bookmark;
                            if (snapshot.hasData) {
                              Get.find<Logger>().i(snapshot.data);
                              bookmark = snapshot.data;
                            }
                            return InkWell(
                                onTap: () {
                                  Get.back();
                                  if (bookmark != null) {
                                    removeFromBookmark(arguments);
                                  } else {
                                    addToBookmark(arguments);
                                  }
                                },
                                child: bookmark != null
                                    ? Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Icon(
                                            Bootstrap.bookmark_check_fill,
                                            color: Colors.white,
                                            size: 30))
                                    : Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                            size: 30)));
                          }),

                      const SizedBox(
                        width: 6,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(Icons.close,
                                  weight: 900, color: Colors.white, size: 30)))
                      //      FormHelper.iconButton(
                      //   icon: Icons.close,
                      //   onTap: () => Navigator.maybePop(context),
                      // ),

                      // StreamBuilder<bool?>(
                      //     stream: Get.find<AppLocalDB>()
                      //         .localSessionsDao
                      //         .getHideDoubtsStreams(),
                      //     builder: (context, snapshot) {
                      //       final hideDoubts = snapshot.data ?? false;
                      //       return InkWell(
                      //         onTap: () {
                      //           if (!hideDoubts) {
                      //             Get.dialog(DoubtInfoDialog(
                      //               title: "Doubts Hidden",
                      //               message: LocaleKeys.doubt_hidden_message.tr,
                      //             ));
                      //           }
                      //           Get.find<AppLocalDB>()
                      //               .localSessionsDao
                      //               .updatehideDoubtsOption(!hideDoubts);
                      //         },
                      //         child: Material(
                      //           elevation: 1,
                      //           // color: Colors.transparent,
                      //           borderRadius:
                      //               const BorderRadius.all(Radius.circular(10)),
                      //           // color: AppColors.primary,

                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 10, vertical: 6),
                      //             child: Text(
                      //               hideDoubts
                      //                   ? LocaleKeys.show_doubts.tr
                      //                   : LocaleKeys.hide_doubts.tr,
                      //               textAlign: TextAlign.center,
                      //               style: const TextStyle(
                      //                 fontSize: 12,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     }),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                    ],
                  )),
              Obx(() {
                return AnimatedPositioned(
                    duration: 300.ms,
                    top: controller.showAppBar.value ? -45 : 15,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Get.dialog(NewsOptionsDialog(
                          newsOrThread: controller
                              .newsOrThread[controller.currentNewsIndex.value],
                        ));
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            Icons.menu,
                            weight: 900,
                            color: Colors.white70,
                            size: 30,
                          )),
                    )
                    // child:  FormHelper.iconButton(
                    //       icon: HeroIcons.bars_3,
                    //       onTap: () {
                    //         Get.dialog(NewsOptionsDialog(
                    //           newsOrThread: controller.newsOrThread[
                    //               controller.currentNewsIndex.value],
                    //         ));
                    //       },
                    //     ),

                    );
              }),
            ],
          );
        }),
      
      ),
    );
  }
}

class AnimatedAppBar extends StatelessWidget {
  const AnimatedAppBar({
    super.key,
    required this.controller,
  });

  final NewsStoriesController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.75),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
          duration: 600.ms,
          height: controller.showAppBar.value ? 70 : 0,
          curve: Curves.fastLinearToSlowEaseIn,
          child: MyShowCaseWidget(
            shapeBorder: const RoundedRectangleBorder(),
            globalKey: controller.showAppBar.value
                ? ShowCaseActionsConstaints.newsTopBarActionKey
                : null,
            description: "Tap anywhere on screen to open actions menu",
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Icon(HeroIcons.chevron_left),
                          Text("Home"),
                        ],
                      ),
                    ),
                  ),
                ),
                // FormHelper.iconButton(
                //   icon: HeroIcons.chevron_left,
                //   onTap: () {
                //     Get.back();
                //     // GetNamed(
                //     // Routes.DISCOVERY);
                //   },
                // ),
                const Spacer(),
                FormHelper.iconButton(
                  iconSize: 18,
                  label: "Report",
                  iconColor: Colors.red.shade500,
                  icon: Bootstrap.flag,
                  onTap: () {
                    Get.bottomSheet(
                      ReportBottomSheet(
                        newsOrThread: controller
                            .newsOrThread[controller.currentNewsIndex.value],
                      ),
                      isScrollControlled: true,
                    );
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    StreamBuilder<NewsBookmark?>(
                        stream: controller.getBookmarkById(),
                        builder: (context, snapshot) {
                          NewsBookmark? bookmark;
                          if (snapshot.hasData) {
                            Get.find<Logger>().i(snapshot.data);
                            bookmark = snapshot.data;
                          }

                          return MyShowCaseWidget(
                            globalKey: null,
                            description: "Click here to save this news",
                            child: FormHelper.iconButton(
                              iconSize: 18,
                              label: "Save",
                              icon: bookmark != null
                                  ? Bootstrap.bookmark_star_fill
                                  : Bootstrap.bookmark_star,
                              iconColor: bookmark != null ? Colors.green : null,
                              onTap: () async {
                                if (bookmark != null) {
                                  await controller.removeFromBookmark();
                                } else {
                                  await controller.addToBookmark();
                                }
                              },
                            ),
                          );
                        }),
                    const SizedBox(
                      width: 5,
                    ),
                    MyShowCaseWidget(
                      globalKey: controller.showAppBar.value
                          ? ShowCaseActionsConstaints.newsShareActionKey
                          : null,
                      description: "Click here to share this news",
                      child: FormHelper.iconButton(
                        iconSize: 18,
                        label: "Share",
                        icon: Bootstrap.share_fill,
                        onTap: () {
                          controller.shareNewsClicked();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FormHelper.iconButton(
                      label: "Close",
                      iconColor: Colors.red,
                      icon: HeroIcons.x_mark,
                      onTap: () {
                        controller.showAppBar.value = false;
                      },
                    ),
                  ],
                )
              ],
            ),
          ));
    });
  }
}
