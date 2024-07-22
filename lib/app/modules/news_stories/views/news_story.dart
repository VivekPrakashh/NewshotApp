import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/widgets/show_case_widget.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:showcaseview/showcaseview.dart';
// import 'package:url_launcher/url_launcher_string.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/widgets/image_loader.dart';
import '../../../core/widgets/poll_bottom_sheet.dart';
import '../../../data/db/database.dart';
import '../../../data/models/news/news.dart';
import '../../../routes/app_pages.dart';
import '../controllers/news_stories_controller.dart';

class NewsStory extends StatefulWidget {
  final NewsStoriesController controller;
  final News news;
  final GlobalKey? factButtonGlobalKey;
  final GlobalKey? pollButtonGlobalKey;
  const NewsStory({
    super.key,
    required this.news,
    required this.controller,
    this.factButtonGlobalKey,
    this.pollButtonGlobalKey,
  });

  @override
  State<NewsStory> createState() => _NewsStoryState();
}

class _NewsStoryState extends State<NewsStory> with WidgetsBindingObserver {
  DateTime? _startTime;

  @override
  void initState() {
    widget.controller.insertNewsLogToDb(widget.news.id!, true);
    WidgetsBinding.instance.addObserver(this);
    // Get.find<FirebaseAnalytics>()
    //     .logEvent(name: AnalyticsCustomEvent.news_viewed.name, parameters: {
    //   "news_id": widget.news.id,
    //   "news_title": widget.news.title
    //       .substring(0, min(38, (widget.news.title.length - 1))),
    //   "category": widget.news.category?.name ?? "",
    // });

    if (widget.factButtonGlobalKey != null) {
      Future.delayed(800.milliseconds, () {
        ShowCaseWidget.of(context).startShowCase([widget.factButtonGlobalKey!]);
      });
    }
    super.initState();
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

  // launchNewsSource(String url) {
  //   launchUrlString(
  //     url,
  //     mode: LaunchMode.inAppWebView,
  //   );
  // }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  updateDuration() {
    if (Get.currentRoute != Routes.NEWS_SOURCE &&
        Get.currentRoute != Routes.IMAGE_PREVIEW) {
      final duration = DateTime.now().difference(_startTime!);
      widget.controller
          .updateDuration(widget.news.id!, duration.inMilliseconds);
      if (kDebugMode) {
        EasyLoading.showToast("duration.inSeconds:${duration.inSeconds}s",
            toastPosition: EasyLoadingToastPosition.bottom);
      }
      _startTime = null;

      // widget.controller.sendNewsDuration(
      //   widget.news,
      //   duration,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1) {
          // print("percentage:${info.visibleFraction}");
          _startTime ??= DateTime.now();
          // print("News start:${widget.news.id}");
        }

        if (info.visibleFraction == 0.0 && _startTime != null) {
          updateDuration();
        }
      },
      key: Key(widget.news.id!),
      child: Scaffold(
        bottomNavigationBar: (widget.news.faq.isNotEmpty ||
                (widget.news.formattedDescription != null &&
                    widget.news.formattedDescription!.isNotEmpty))
            ? MyShowCaseWidget(
                globalKey: widget.factButtonGlobalKey,
                shapeBorder: const RoundedRectangleBorder(),
                description: "Click here to see facts about this news",
                child: ClipRect(
                  // Clip the blurred container to the same size as the parent
                  child: Container(
                    decoration: BoxDecoration(
                      image: widget.news.urlToImage != null
                          ? DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.news.urlToImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY:
                              5), // Adjust the sigma values for the desired blur effect
                      child: InkWell(
                        onTap: () async {
                          Get.toNamed(Routes.NEWS_SOURCE,
                              arguments: widget.news);
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: Get.height * 0.07,
                            // maxHeight: Get.height * 0.09,
                          ),

                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: widget.news.faq.isEmpty
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        LocaleKeys.read_more.tr,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                          // decoration: TextDecoration.underline,
                                          // decorationColor:AppColors.white,
                                          decorationThickness: 1.2,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Icon(
                                        Icons.double_arrow,
                                        color: AppColors.white,
                                        size: 26,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      )
                                    ],
                                  )
                                : Text(
                                    widget.news.faq.first.question,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        // floatingActionButton: ElevatedButton.icon(
        //   onPressed: () {},
        //   label: const Text("Share Your Opinion"),
        //   icon: const Icon(Icons.bar_chart),
        // ),

        // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        // floatingActionButton: Container(
        //   height: Get.height * 0.01,
        //   decoration: BoxDecoration(
        //       image: widget.news.urlToImage != null
        //           ? DecorationImage(
        //               image:
        //                   CachedNetworkImageProvider(widget.news.urlToImage!))
        //           : null),
        //   // child: ,
        // ),
        // floatingActionButton: widget.news.poll == null
        //     ? null
        //     : Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             if (widget.news.faq.isNotEmpty)
        //               InkWell(
        //                 onTap: () async {
        //                   final result = await Get.bottomSheet(
        //                     PollBottomSheet(
        //                       news: widget.news,
        //                     ),
        //                     isScrollControlled: true,
        //                   );
        //                   if (result != null) {
        //                     widget.controller.pollAnswred = result;
        //                   }
        //                 },
        //                 child: Material(
        //                   borderRadius: BorderRadius.circular(8),
        //                   color: AppColors.action1,
        //                   child: const Padding(
        //                     padding: EdgeInsets.symmetric(
        //                         horizontal: 12, vertical: 5),
        //                     child: Text(
        //                       "Share You Opinion",
        //                       style: TextStyle(
        //                         color:AppColors.white,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ElevatedButton.icon(
        //               icon: const Icon(Icons.question_answer),
        //               style: ElevatedButton.styleFrom(
        //                 padding: const EdgeInsets.only(
        //                     top: 12, bottom: 8, left: 16, right: 16),
        //               ),
        //               onPressed: () async {
        //                 final percentage = await Get.toNamed(Routes.NEWS_SOURCE,
        //                     arguments: widget.news);
        //                 if (percentage is int) {
        //                   widget.controller.faqReadPercentage = percentage;
        //                   print('faqPercentage$percentage');
        //                 }
        //               },
        //               label: Text(
        //                 "See All Facts",
        //                 // LocaleKeys.button_see_facts.tr,
        //                 // "${LocaleKeys.button_whats_your_opinion.tr}\n(Poll)",
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                   fontSize: 14.spMin,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        body: Column(
          children: [
            Transform.scale(
              origin: const Offset(0, 2),
              scaleY: 1.1,
              child: Stack(
                children: [
                  Material(
                    elevation: 3,
                    child: SizedBox(
                        height: widget.news.description.length > 400
                            ? Get.height * 0.25
                            : Get.height * 0.3,
                        width: double.maxFinite,
                        child: widget.news.urlToImage == null
                            ? Center(
                                child:
                                    LottieBuilder.asset(Assets.lottie.error404))
                            : InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.IMAGE_PREVIEW,
                                      arguments: widget.news.urlToImage);
                                },
                                child: Hero(
                                  tag: widget.news.urlToImage!,
                                  child:
                                      ImageLoader(url: widget.news.urlToImage!),
                                ),
                              )),
                  ),
                  if (widget.news.poll != null && widget.news.pollApproved)
                    Positioned(
                      right: 10,
                      bottom: 15,
                      child: Transform.scale(
                        scale: 0.9,
                        child: MyShowCaseWidget(
                          globalKey: widget.pollButtonGlobalKey,
                          description:
                              "Click here to give your opinion on this news",
                          child: IconButton.filled(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            onPressed: () async {
                              final result = await Get.bottomSheet(
                                PollBottomSheet(
                                  news: widget.news,
                                ),
                                isScrollControlled: true,
                              );
                              if (result != null) {
                                widget.controller.pollAnswred = result;
                              }
                            },
                            // label: const Text("Your Opinion"),
                            icon: const Icon(Icons.bar_chart),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Material(
                      elevation: 2,
                      borderRadius: const BorderRadius.only(
                        // topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<NewsBookmark?>(
                                stream: widget.controller
                                    .getBookmarkById(id: widget.news.id),
                                builder: (context, snapshot) {
                                  NewsBookmark? bookmark;
                                  if (snapshot.hasData) {
                                    bookmark = snapshot.data;
                                  }

                                  return InkWell(
                                    onTap: () async {
                                      if (bookmark != null) {
                                        await widget.controller
                                            .removeFromBookmark(
                                                news: NewsOrThread.news(
                                                    news: widget.news));
                                      } else {
                                        await widget.controller.addToBookmark(
                                            currentNewsOrThread:
                                                NewsOrThread.news(
                                                    news: widget.news));
                                      }
                                    },
                                    child: Text(
                                      widget.news.title.trim(),
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            color: bookmark != null
                                                ? AppColors.action2
                                                : null,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.news.description.trim(),
                              style: Theme.of(context).textTheme.bodyLarge,
                              // style: TextStyle(
                              //     fontSize: Get.height > 650 ? 16.5 : 14,
                              //     fontWeight: FontWeight.w300,
                              //     fontFamily: "Inter"
                              //     // color: Get.theme.dividerColor,
                              //     // overflow: TextOverflow.ellipsis,
                              //     ),
                              // textAlign: TextAlign.left,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.news.createdAt?.getTimeAgo ?? "",
                                  style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                if (widget.news.source != null &&
                                    widget.news.source?.name != null)
                                  Icon(Icons.circle,
                                      size: 7,
                                      color: Theme.of(context).disabledColor),
                                const SizedBox(
                                  width: 8,
                                ),
                                if (widget.news.source != null &&
                                    widget.news.source?.name != null)
                                  Text(
                                    widget.news.source!.name!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -18),
                    child: Material(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        child: Text(
                          "Reveal Inside",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
