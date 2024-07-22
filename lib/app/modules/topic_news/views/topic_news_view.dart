import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:news_shots_app/app/modules/discovery/views/discovery_view.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../core/colors.dart';
import '../../../core/util_functions.dart';
import '../../../core/widgets/form_helper.dart';
import '../../../core/widgets/report_bottom_sheet.dart';
import '../../../data/db/database.dart';
import '../../../data/models/news/topic.dart';
import '../../news_details/views/news_details.dart';
import '../../news_details/views/news_options_dialog.dart';
import '../controllers/topic_news_controller.dart';

class TopicNewsView extends GetView<TopicNewsController> {
  const TopicNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Stack(
            children: [
              controller.news.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (value) =>
                                controller.onPageChange(value),
                            itemCount: controller.news.length + 1,
                            controller: controller.pageController,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              if (index == controller.news.length) {
                                return EndNews(
                                  currentTopic: controller.topic,
                                );
                              }

                              final news = controller.news[index];
                              return NewsDetails(
                                nextNews: const [
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                                hasPreviousNews: index > 0,
                                hashtag: controller.topic.hashtag,
                                onShareNewsClick: controller.shareNewsClicked,
                                showTopicButton: false,
                                news: news,
                                onInit: () {
                                  controller.insertNewsLogToDb(news.id!, true);
                                },
                                onRemoveBookmark: () =>
                                    controller.removeFromBookmark(news: news),
                                onAddBookmark: () =>
                                    controller.addToBookmark(news: news),
                                getBookmarkStream: () =>
                                    controller.getBookmarkById(id: news.id),
                              );
                            },
                          ),
                        ),
                        Obx(() {
                          if (controller.hideHeader.value) {
                            return Container();
                          }

                          final percent =
                              (controller.currentNewsIndex.value + 1) /
                                  controller.newsIdsToFetch.length;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  "${controller.currentNewsIndex.value + 1}/${controller.newsIdsToFetch.length}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Get.theme.colorScheme.primary,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: LinearProgressIndicator(
                                      value: percent,
                                      minHeight: 5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Obx(() {
                    return Row(
                      children: [
                        if (!controller.hideHeader.value) ...[
                          InkWell(
                            onTap: () {
                              UtilsFunction.shareNewsOrThread(NewsOrThread.news(
                                  news: controller.news[
                                      controller.currentNewsIndex.value]));
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
                                     color: Get.isDarkMode ?Colors.white :Colors.black ,
                                     
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
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    // const Icon(
                                    //   Bootstrap.share,
                                    //   size: 16,
                                    //   color: AppColors.primary,
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          // StreamBuilder<bool?>(
                          //     stream: Get.find<AppLocalDB>()
                          //         .localSessionsDao
                          //         .getHideDoubtsStreams(),
                          //     builder: (context, snapshot) {
                          //       final hideDoubts = snapshot.data ?? false;
                          //       return InkWell(
                          //         onTap: () {
                          //           Get.find<AppLocalDB>()
                          //               .localSessionsDao
                          //               .updatehideDoubtsOption(!hideDoubts);
                          //         },
                          //         child: Material(
                          //           elevation: 1,
                          //           borderRadius: const BorderRadius.all(
                          //               Radius.circular(10)),
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 10, vertical: 6),
                          //             child: Text(
                          //               hideDoubts
                          //                   ? LocaleKeys.show_doubts.tr
                          //                   : LocaleKeys.hide_doubts.tr,
                          //               textAlign: TextAlign.center,
                          //               style: const TextStyle(
                          //                 // color: AppColors.primary,
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
                        InkWell(
                            onTap: () {
                              Navigator.maybePop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.close,
                                    color: Colors.white, size: 30)))
                      ],
                    );
                  })),
              // Positioned(
              //   top: 15,
              //   right: 15,
              //   child: Obx(() {
              //     if (controller.hideHeader.value) {
              //       return Container();
              //     }
              //     return Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         // FormHelper.iconButton(
              //         //   iconSize: 18,
              //         //   icon: Bootstrap.share_fill,
              //         //   onTap: () {
              //         //     controller.shareNewsClicked();
              //         //   },
              //         // ),
              //         // const SizedBox(
              //         //   width: 10,
              //         // ),
              //         FormHelper.iconButton(
              //           icon: HeroIcons.bars_3,
              //           onTap: () {
              //             Get.dialog(NewsOptionsDialog(
              //               newsOrThread: NewsOrThread.news(
              //                   news: controller
              //                       .news[controller.currentNewsIndex.value]),
              //             ));
              //             // controller.showAppBar.value =
              //             //     !controller.showAppBar.value;
              //             // Get.back();
              //           },
              //         ),
              //       ],
              //     );
              //   }),
              // ),
              Positioned(
                top: 15,
                left: 15,
                child: InkWell(
                  onTap: () {
                    Get.dialog(NewsOptionsDialog(
                      newsOrThread: NewsOrThread.news(
                          news: controller
                              .news[controller.currentNewsIndex.value]),
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.2),
                           borderRadius: BorderRadius.circular(20)
                          ),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                //  child:   FormHelper.iconButton(
                //                 icon: HeroIcons.bars_3,
                //                 onTap: () {
                //                   Get.dialog(NewsOptionsDialog(
                //                     newsOrThread: NewsOrThread.news(
                //                         news: controller
                //                             .news[controller.currentNewsIndex.value]),
                //                   ));
                //                 },
                //               ),
              )
              // AnimatedAppBar(
              //   controller: controller,
              // )
            ],
          );
        }),
      ),
    );
  }
}

class EndNews extends StatefulWidget {
  final Topic currentTopic;
  const EndNews({
    super.key,
    required this.currentTopic,
  });

  @override
  State<EndNews> createState() => _EndNewsState();
}

class _EndNewsState extends State<EndNews> with SingleTickerProviderStateMixin {
  final isAnimationCompleted = false.obs;
  final topics = <Topic>[].obs;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: 2000.ms);
    animationController.forward();
    topics.value = List.from(Get.find<DiscoveryController>().topics);
    topics.removeWhere((element) => element.id == widget.currentTopic.id);
    Future.delayed(2000.ms, () {
      isAnimationCompleted.value = true;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedSwitcher(
        duration: 600.ms,
        child: isAnimationCompleted.value
            ? Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    LocaleKeys.explore_more_topic_message.tr,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Expanded(
                    child: topics.length > 3
                        ? CarouselSlider.builder(
                            itemCount: topics.length,
                            itemBuilder: (context, index, realIndex) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: TopicListCard(topic: topics[index]),
                            ),
                            options: CarouselOptions(
                              scrollDirection: Axis.vertical,
                              autoPlay: true,
                              viewportFraction: 0.32,
                              padEnds: false,
                            ),
                          )
                        : ListView.builder(
                            itemCount: topics.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TopicListCard(topic: topics[index]),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        child: Lottie.asset(Assets.lottie.allDone,
                            controller: animationController)),
                    const Text(
                      "You're all caught up! 🌟",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}

class AnimatedAppBar extends StatelessWidget {
  final TopicNewsController controller;
  const AnimatedAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
        duration: 600.ms,
        height: controller.showAppBar.value ? 65 : 0,
        curve: Curves.fastLinearToSlowEaseIn,
        // padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        // height: 80,
        child: Row(
          children: [
            FormHelper.iconButton(
              icon: HeroIcons.arrow_left,
              onTap: () {
                Get.back();
              },
            ),
            const Spacer(),
            FormHelper.iconButton(
              iconColor: Colors.red.shade500,
              icon: Icons.report,
              onTap: () {
                Get.bottomSheet(
                  ReportBottomSheet(
                      newsOrThread: NewsOrThread.news(
                          news: controller
                              .news[controller.currentNewsIndex.value])),
                  isScrollControlled: true,
                );
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(() {
              return StreamBuilder<NewsBookmark?>(
                  stream: controller.getBookmarkById(),
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
                          await controller.addToBookmark(news: null);
                        }
                      },
                    );
                  });
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
              width: 5,
            ),
            FormHelper.iconButton(
              icon: HeroIcons.x_mark,
              onTap: () {
                controller.showAppBar.value = false;
              },
            )
          ],
        ),
      );
    });
  }
}
