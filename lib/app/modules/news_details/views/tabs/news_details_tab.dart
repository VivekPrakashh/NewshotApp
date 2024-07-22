import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/widgets/image_loader.dart';
import 'package:news_shots_app/app/modules/news_details/views/news_details.dart';

import '../../../../core/colors.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/gen/fonts.gen.dart';
import '../../../../core/widgets/highlight_clickable_text.dart';
import '../../../../data/core/analytics_custom_event.dart';
import '../../../../data/db/database.dart';
import '../../../../data/models/news/news.dart';
import '../../../../routes/app_pages.dart';

class NewsDetailsTab extends StatefulWidget {
  final TabController tabController;
  final String? hastag;
  const NewsDetailsTab({
    super.key,
    required this.widget,
    required this.tabController,
    required this.hastag,
  });

  final NewsDetails widget;

  @override
  State<NewsDetailsTab> createState() => _NewsDetailsTabState();
}

class _NewsDetailsTabState extends State<NewsDetailsTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  onHighlightClick(String text) {
    final doubt = widget.widget.news.doubts
        .where((e) => e.doubt.toLowerCase() == text.toLowerCase())
        .firstOrNull;
    if (doubt != null) {
      Get.bottomSheet(DoubtBottomSheet(doubt: doubt));
    }
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.doubt_clicked.name, parameters: {
      "news_id": widget.widget.news.id ?? "no id",
      "news_title": widget.widget.news.title
          .substring(0, min(38, (widget.widget.news.title.length - 1))),
      "category": widget.widget.news.category?.name ?? "",
      "doubt": text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 3,
          child: SizedBox(
              height: Get.height * 0.335,
              width: double.maxFinite,
              child: widget.widget.news.urlToImage == null
                  ? Center(child: LottieBuilder.asset(Assets.lottie.error404))
                  : InkWell(
                      onTap: () {
                        Get.toNamed(Routes.IMAGE_PREVIEW,
                            arguments: widget.widget.news.urlToImage);
                      },
                      child: Hero(
                        tag: widget.widget.news.urlToImage!,
                        child: ImageLoader(
                          url: widget.widget.news.urlToImage ?? "",
                        ),
                      ),
                    )),
        ),
        SizedBox(
            width: double.maxFinite,
            child: Material(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.IMAGE_PREVIEW,
                                arguments: widget.widget.news.urlToImage);
                          },
                          child: SizedBox(
                            height: Get.height * 0.24,
                            width: Get.width,
                          ),
                        ),
                        Stack(
                          children: [
                            TitleSection(
                                hashtag: widget.hastag,
                                widget: widget.widget,
                                onHighlightClick: onHighlightClick),
                            Transform.translate(
                              offset: const Offset(0, -40),
                              // child: Container(
                              //   decoration: BoxDecoration(
                              //       color: Get.isDarkMode
                              //           ? Get.theme.colorScheme.surface
                              //           : const Color(0xffF6FFF8),
                              //       borderRadius: const BorderRadius.only(
                              //         topLeft: Radius.circular(10),
                              //         topRight: Radius.circular(10),
                              //       ),
                              //       border: Border(
                              //         top: BorderSide(
                              //           color: Get.theme.colorScheme.onBackground,
                              //           width: 1,
                              //         ),
                              //         right: BorderSide(
                              //           color: Get.theme.colorScheme.onBackground,
                              //           width: 1,
                              //         ),
                              //         left: BorderSide(
                              //           color: Get.theme.colorScheme.onBackground,
                              //           width: 1,
                              //         ),
                              //         bottom: BorderSide(
                              //           width: 0.1,
                              //           color: Get.theme.colorScheme.onBackground,
                              //         ),
                              //       )),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: Text(
                                  "Reveal Inside",
                                  style: TextStyle(
                                  backgroundColor:  Colors.black.withOpacity(0.4),
                                    fontSize: 16,
                                    // color: Theme.of(context).colorScheme.primary,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: FontFamily.openSans,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Stack(
                        //   children: [
                        //      Column(
                        //      crossAxisAlignment: CrossAxisAlignment.start,
                        //        children: [
                        //          Text(
                        //                 "Reveal Inside",
                        //                 style: TextStyle(
                        //                   color: Theme.of(context).colorScheme.primary,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontFamily: FontFamily.openSans,
                        //                 ),),
                        //                 SizedBox(height: 5,),
                        //                  Text(
                        //                 "${widget.widget.news.doubts.first}",
                        //                 maxLines: 2,
                        //                 style: TextStyle(
                        //                   color: Theme.of(context).colorScheme.primary,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontFamily: FontFamily.openSans,
                        //                 ),),

                        //        ],
                        //      )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // Material(
                        //   shape: RoundedRectangleBorder(
                        //     side: BorderSide(color: Theme.of(context).dividerColor),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 4, horizontal: 8),
                        HighlightedClickableText(
                            enableTextSelection: true,
                          
                          style: TextStyle(fontSize: 16),
                            onClick: onHighlightClick,
                            
                            text: widget.widget.news.description.trim(),
                            highlightedWords: widget.widget.news.doubts
                                .map((e) => e.doubt.toLowerCase())
                                .toList()),
                      ]),
                )))
      ],
    );

    // return SizedBox(
    //   height: Get.height,
    //   child: Stack(
    //     children: [
    //       Material(
    //         elevation: 3,
    //         child: SizedBox(
    //             height: Get.height * 0.3,
    //             width: double.maxFinite,
    //             child: widget.widget.news.urlToImage == null
    //                 ? Center(child: LottieBuilder.asset(Assets.lottie.error404))
    //                 : InkWell(
    //                     onTap: () {
    //                       Get.toNamed(Routes.IMAGE_PREVIEW,
    //                           arguments: widget.widget.news.urlToImage);
    //                     },
    //                     child: Hero(
    //                       tag: widget.widget.news.urlToImage!,
    //                       child: ImageLoader(
    //                         url: widget.widget.news.urlToImage ?? "",
    //                       ),
    //                     ),
    //                   )),
    //       ),
    //       Positioned(
    //         top: Get.height * 0.2,
    //         left: 0,
    //         right: 0,
    //         bottom: 0,
    //         child: SizedBox(
    //           width: double.maxFinite,
    //           // height: Get.height,
    //           child: Material(
    //             color: Colors.transparent,
    //             elevation: 0,
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    //               child: Column(
    //                 children: [
    //                   Flexible(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Stack(
    //                           children: [
    //                             TitleSection(
    //                                 hashtag: widget.hastag,
    //                                 widget: widget.widget,
    //                                 onHighlightClick: onHighlightClick),
    //                             Transform.translate(
    //                               offset: const Offset(0, -28),
    //                               child: Container(
    //                                 decoration: BoxDecoration(
    //                                     color: Get.isDarkMode
    //                                         ? Get.theme.colorScheme.surface
    //                                         : const Color(0xffF6FFF8),
    //                                     borderRadius: const BorderRadius.only(
    //                                       topLeft: Radius.circular(10),
    //                                       topRight: Radius.circular(10),
    //                                     ),
    //                                     border: Border(
    //                                       top: BorderSide(
    //                                         color: Get
    //                                             .theme.colorScheme.onBackground,
    //                                         width: 1,
    //                                       ),
    //                                       right: BorderSide(
    //                                         color: Get
    //                                             .theme.colorScheme.onBackground,
    //                                         width: 1,
    //                                       ),
    //                                       left: BorderSide(
    //                                         color: Get
    //                                             .theme.colorScheme.onBackground,
    //                                         width: 1,
    //                                       ),
    //                                       bottom: BorderSide(
    //                                         width: 0,
    //                                         color: Get
    //                                             .theme.colorScheme.onBackground,
    //                                       ),
    //                                     )),
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.only(
    //                                       top: 6, left: 10, right: 10),
    //                                   child: Text(
    //                                     "Reveal Inside",
    //                                     style: TextStyle(
    //                                       color: Theme.of(context)
    //                                           .colorScheme
    //                                           .primary,
    //                                       fontWeight: FontWeight.bold,
    //                                       fontFamily: FontFamily.openSans,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                         const SizedBox(
    //                           height: 6,
    //                         ),
    //                         HighlightedClickableText(
    //                             enableTextSelection: true,
    //                             style: Theme.of(context).textTheme.bodyLarge!,
    //                             onClick: onHighlightClick,
    //                             text: widget.widget.news.description.trim(),
    //                             highlightedWords: widget.widget.news.doubts
    //                                 .map((e) => e.doubt.toLowerCase())
    //                                 .toList()),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class DoubtBottomSheet extends StatelessWidget {
  const DoubtBottomSheet({
    super.key,
    required this.doubt,
  });

  final NewsDoubts doubt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      doubt.doubt.capitalizeFirst ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              Text(
                doubt.answer,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final Function(String text) onHighlightClick;
  final String? hashtag;

  const TitleSection({
    super.key,
    required this.widget,
    required this.onHighlightClick,
    required this.hashtag,
  });

  final NewsDetails widget;

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   shape: RoundedRectangleBorder(
    //     side: BorderSide(
    //       color: Get.theme.colorScheme.onBackground,
    //       width: 1,
    //     ),
    //   ),
    //   // color: const Color(0xffF6FFF8),
    //   color: Get.isDarkMode
    //       ? Get.theme.colorScheme.surface
    //       : const Color(0xffF6FFF8),
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            StreamBuilder<NewsBookmark?>(
                stream: widget.getBookmarkStream(),
                builder: (context, snapshot) {
                  NewsBookmark? bookmark;
                  if (snapshot.hasData) {
                    bookmark = snapshot.data;
                  }
                  return InkWell(
                    onTap: () async {
                      if (bookmark != null) {
                        widget.onRemoveBookmark();
                      } else {
                        widget.onAddBookmark();
                      }
                      Get.find<FirebaseAnalytics>().logEvent(
                        name: AnalyticsCustomEvent.news_title_click.name,
                        parameters: {
                          "news_id": widget.news.id ?? "no id",
                          "news_title": widget.news.title.substring(
                            0,
                            min(
                              38,
                              (widget.news.title.length - 1),
                            ),
                          ),
                          "category": widget.news.category?.name ?? ""
                        },
                      );
                    },
                    child: HighlightedClickableText(
                      onClick: onHighlightClick,
                      highlightedWords: widget.news.doubts
                          .map((e) => e.doubt.toLowerCase())
                          .toList(),
                      text: widget.news.title.trim(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 21,
                             backgroundColor:  Colors.black.withOpacity(0.6),
                            color: bookmark != null ? AppColors.action2 : Colors.white,
                          ),
                    ),
                  );
                }),
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
                if (hashtag != null)
                  Text(
                    hashtag!,
                    style: const TextStyle(
                      color: AppColors.red,
                    ),
                  ),
                const Spacer(),
                // TextButton.icon(
                //     style: TextButton.styleFrom(
                //         minimumSize: Size.zero,
                //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 0, horizontal: 0)),
                //     onPressed: () async {
                //       final result = await Get.bottomSheet(
                //         PollBottomSheet(
                //           news: widget.news,
                //         ),
                //         isScrollControlled: true,
                //       );
                //       if (result != null) {
                //         // pollAnswred = result;
                //         Get.find<TimeTrackController>(tag: widget.news.id!)
                //             .hasAnsweredPoll = result;
                //         // widget.isPollAnswerd(result);
                //       }
                //     },
                //     icon: const Icon(Icons.bar_chart),
                //     label: const Text("Poll"))
              ],
            ),
          ],
        ));
  }
}
