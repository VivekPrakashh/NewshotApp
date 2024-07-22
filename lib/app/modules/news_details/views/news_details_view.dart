import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/data/models/threads/thread.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:news_shots_app/app/modules/news_details/views/news_options_dialog.dart';
import 'package:news_shots_app/app/modules/news_stories/views/thread_view.dart'
    hide ThreadsView;
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/colors.dart';
import '../../../core/util_functions.dart';
import '../../../core/widgets/form_helper.dart';
import '../../../core/widgets/report_bottom_sheet.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/db/database.dart';
import '../../news_stories/ui_states/news_or_thread.dart';
import '../controllers/news_details_controller.dart';
import 'news_details.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.initialized;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          // onTap: () {
          //   controller.showAppBar.value = !controller.showAppBar.value;
          // },
          child: Stack(
            children: [
              Obx(() {
                return controller.newsList.isEmpty
                    ? const SizedBox()
                    : const Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(child: Text("You are at The End")));
              }),
              Obx(() {
                return controller.newsList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) =>
                            controller.onPageChange(value),
                        itemCount: controller.newsList.length,
                        controller: controller.pageController,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return controller.newsList[index].when(
                              news: (news) => NewsDetails(
                                    hasPreviousNews: index > 0,
                                    onShareNewsClick:
                                        controller.shareNewsClicked,
                                    key: Key(news.id!),
                                    news: news,
                                    onInit: () {
                                      controller.insertNewsLogToDb(
                                          news.id!, true);
                                    },
                                    onRemoveBookmark: () =>
                                        controller.removeFromBookmark(
                                            news:
                                                NewsOrThread.news(news: news)),
                                    onAddBookmark: () =>
                                        controller.addToBookmark(
                                            news:
                                                NewsOrThread.news(news: news)),
                                    getBookmarkStream: () =>
                                        controller.getBookmarkById(id: news.id),
                                  ),
                              thread: (thread) => ThreadsView(
                                    thread: thread,
                                  ));
                        },
                      );
              }),
              // Obx(() {
              //   return AnimatedPositioned(
              //       curve: Curves.fastLinearToSlowEaseIn,
              //       top: controller.showAppBar.value ? -45 : 15,
              //       right: 15,
              //       duration: 600.milliseconds,
              //       child: FormHelper.iconButton(
              //         icon: HeroIcons.bars_3,
              //         onTap: () {
              //           controller.showAppBar.value = true;
              //         },
              //       ));
              // }),
              // AnimatedAppbar(controller: controller),
              // Obx(() {
              //   return AnimatedPositioned(
              //     duration: 300.milliseconds,
              //     top: controller.showAppBar.value ? -45 : 15,
              //     right: 15,
              //     child: Row(
              //       children: [
              //         FormHelper.iconButton(
              //           iconSize: 18,
              //           icon: Bootstrap.share_fill,
              //           onTap: () {
              //             controller.shareNewsClicked();
              //           },
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         FormHelper.iconButton(
              //           icon: HeroIcons.bars_3,
              //           onTap: () {
              //             Get.dialog(NewsOptionsDialog(
              //               newsOrThread: controller
              //                   .newsList[controller.currentNewsIndex.value],
              //             ));
              //             // controller.showAppBar.value =
              //             //     !controller.showAppBar.value;
              //             // Get.back();
              //           },
              //         ),
              //       ],
              //     ),
              //   );
              // }),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          UtilsFunction.shareNewsOrThread(controller
                              .newsList[controller.currentNewsIndex.value]);
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
                                 const Icon(
                                  Bootstrap.share,
                                  size: 16,
                                  color: Colors.black,
                                  // color: AppColors.primary,
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
                       FormHelper.iconButton(
                        icon: HeroIcons.bars_3,
                        onTap: () {
                          Get.dialog(Builder(builder: (context) {
                            return Theme(
                              data: Theme.of(context),
                              child: NewsOptionsDialog(
                                newsOrThread: controller.newsList[
                                    controller.currentNewsIndex.value],
                              ),
                            );
                          }));
                        },
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
                      //           borderRadius:
                      //               const BorderRadius.all(Radius.circular(10)),
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
                  )),
              Obx(() {
                return AnimatedPositioned(
                  duration: 300.milliseconds,
                  top: controller.showAppBar.value ? -45 : 15,
                  left: 15,
                  child: FormHelper.iconButton(
                    icon: HeroIcons.chevron_left,
                    onTap: () => Navigator.maybePop(context),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedAppbar extends StatelessWidget {
  final NewsDetailsController controller;
  const AnimatedAppbar({super.key, required this.controller});

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
        duration: 600.milliseconds,
        height: controller.showAppBar.value ? 65 : 0,
        curve: Curves.fastLinearToSlowEaseIn,
        // padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        // height: 80,
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
            // SizedBox(
            //   width: 8,
            // ),
            // FormHelper.iconButton(
            //   icon: HeroIcons.chevron_left,
            //   onTap: () {
            //     Get.back();
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
                          .newsList[controller.currentNewsIndex.value]),
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
                      label: "Save",
                      iconSize: 18,
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
                    );
                  });
            }),
            const SizedBox(
              width: 5,
            ),
            FormHelper.iconButton(
              iconSize: 18,
              label: "Share",
              icon: Bootstrap.share_fill,
              onTap: () {
                controller.shareNewsClicked();
              },
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
            )
          ],
        ),
      );
    });
  }
}

class ThreadsView extends StatefulWidget {
  final Thread thread;
  const ThreadsView({super.key, required this.thread});

  @override
  State<ThreadsView> createState() => _ThreadsViewState();
}

class _ThreadsViewState extends State<ThreadsView> with WidgetsBindingObserver {
  final currentIndex = 0.obs;
  DateTime? _startTime;

  Fact? getCurrentFact() {
    if (widget.thread.facts.isEmpty) {
      currentIndex.value;
      return null;
    }
    return widget.thread.facts[currentIndex.value];
  }

  @override
  void initState() {
    super.initState();
    Get.find<NewsDetailsController>()
        .insertNewsLogToDb(widget.thread.id, false);
    WidgetsBinding.instance.addObserver(this);
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.thread_viewed.name, parameters: {
      "thread_id": widget.thread.id,
      "thread_title": widget.thread.threadTitle
              ?.substring(0, min(widget.thread.threadTitle!.length, 38)) ??
          "no title",
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  updateDuration() async {
    final duration = DateTime.now().difference(_startTime!);
    await Get.find<DiscoveryController>()
        .updateDuration(widget.thread.id, duration.inMilliseconds);
    if (kDebugMode) {
      EasyLoading.showToast("thread Duration:${duration.inSeconds}s",
          toastPosition: EasyLoadingToastPosition.bottom);
    }
    _startTime = null;
    await Get.find<DiscoveryController>()
        .sendThreadDuration(widget.thread, duration);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      if (_startTime != null) {
        updateDuration();
      }
    }

    if (state == AppLifecycleState.resumed) {
      _startTime ??= DateTime.now();
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) async {
        if (info.visibleFraction == 1) {
          // print("percentage:${info.visibleFraction}");
          _startTime ??= DateTime.now();
          // print("News start:${widget.news.id}");
        }

        if (info.visibleFraction == 0.0 && _startTime != null) {
          await updateDuration();
        }
      },
      key: Key(widget.thread.id),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: widget.thread.backgroundImgUrl == null
            ? null
            : BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      widget.thread.backgroundImgUrl!),
                  fit: BoxFit.cover,
                ),
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final title = getCurrentFact()?.titleHeader;
              if (title != null && title.isNotEmpty) {
                return Material(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      title,
                      style: Get.textTheme.headlineLarge,
                    ),
                  ),
                );
              }

              return const SizedBox();
            }),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: PageView.builder(
                onPageChanged: (value) {
                  currentIndex.value = value;
                },
                itemCount: widget.thread.facts.length,
                itemBuilder: (context, index) =>
                    FactCard(fact: widget.thread.facts[index]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (widget.thread.facts.length > 1)
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.thread.facts.mapIndexed((i, e) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(Icons.circle_outlined),
                        if (currentIndex.value == i)
                          const Icon(
                            Icons.circle,
                            size: 16,
                          )
                      ],
                    );
                  }).toList(),
                );
              }),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              final title = getCurrentFact()?.titleFooter;
              if (title != null && title.isNotEmpty) {
                return Material(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      title,
                      style: Get.textTheme.headlineLarge,
                    ),
                  ),
                );
              }

              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
