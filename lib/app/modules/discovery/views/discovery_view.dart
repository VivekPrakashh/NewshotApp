import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/adview.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/data/models/news/topic.dart';
import 'package:news_shots_app/app/helper/ad_helper.dart';
import 'package:news_shots_app/app/modules/home/views/widgets/drawer.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:news_shots_app/app/modules/topic_news/bindings/topic_news_binding.dart';
import 'package:news_shots_app/app/modules/topic_news/controllers/topic_news_controller.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/colors.dart';
import '../../../core/gen/fonts.gen.dart';
import '../../../core/widgets/form_helper.dart';
import '../../../core/widgets/news_list_card.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../home/uistate/news_with_loading.dart';
import '../controllers/discovery_controller.dart';

class DiscoveryView extends GetView<DiscoveryController> {
  const DiscoveryView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      onFirstBackPress: (_) {
        EasyLoading.showToast("Press back again to exit app",
            toastPosition: EasyLoadingToastPosition.bottom);
      },
      child: Scaffold(
       bottomNavigationBar: AdHelper.nativeBannerAd(),
        

        // floatingActionButton: controller.isDebug
        //     ? FloatingActionButton(
        //         onPressed: () {
        //           Get.toNamed(
        //             Routes.DEBUG,
        //           );
        //         },
        //         child: const Icon(Icons.bug_report),
        //       )
        //     : null,
        drawer: const AppDrawer(),
        body: SafeArea(
          child: RefreshIndicator(
            notificationPredicate: (notification) {
              if (notification is OverscrollNotification || Platform.isIOS) {
                return notification.depth == 2;
              }
              return notification.depth == 0;
            },
            color: Get.isDarkMode ? AppColors.white : AppColors.background,
            onRefresh: () {
              Get.find<FirebaseAnalytics>().logEvent(
                name: AnalyticsCustomEvent.force_refress_news.name,
              );
              return controller.refressSliderSlide();
            },
            child: NotificationListener<OverscrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels != 0 &&
                    notification.metrics.axis == Axis.vertical) {
                  controller.fetchMore();
                }
                return false;
              },
              child: NestedScrollView(
                  physics: const ClampingScrollPhysics(),
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxScrolled) => [
                        SliverAppBar(
                          floating: true,
                          automaticallyImplyLeading: false,
                          elevation: 0,
                           leading:   Center(
                             child: Builder(builder: (context) {
                                return FormHelper.iconButton(
                                  size: 40,
                                  icon: HeroIcons.bars_3,
                                  onTap: () => Scaffold.of(context).openDrawer(),
                                );
                              }),
                           ),
                           //Center(
                          //   child: ClipRRect(
                          //     borderRadius:
                          //         const BorderRadius.all(Radius.circular(50)),
                          //     child: Image.asset(Assets.images.logo.path,
                          //         width: 40),
                          //   ),
                          // ),
                          leadingWidth: 60,
                          title:SizedBox(
                            height: 23,
                            width: 160,
                            // child: Image.asset('assets/images/Revealimage.png')),
                         child:  Center(
                           child: Text(
                              "Reveal Inside",
                              style:TextStyle(
                                fontSize: 18,
                                color:   Get.isDarkMode ? Colors.grey.shade300 : AppColors.background,
                                 fontFamily: FontFamily.inter,
                                 fontWeight: FontWeight.w900
                              )
                              //  GoogleFonts.salsa(),
                            ),
                         ),),

                          centerTitle: true,
                          actions: [
                          Center(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(Assets.images.logo.path,
                                  width: 32),
                            ),
                          ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                          
                        CategoryTabBar(
                          controller: controller,
                        ),
                       
                      ],
                     
                   body: const CategoriesCard()),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesCard extends GetView<DiscoveryController> {
  const CategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() {
        final categories = controller.categories;

        controller.isTopicLoading.value;

        return TabBarView(
          controller: controller.categoriesTabController,
          children: List.generate(categories.length + 2, (index) {
            if (index == 0) {
              return Obx(() {
                final topics = List<Topic>.from(controller.topics);

                return controller.news.isEmpty
                    ? const CategoryNewsListShimmer()
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                if ((index + 1) % 2 == 0 && topics.isNotEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: TopicListCard(
                                        topic: topics.removeAt(0)),
                                  );
                                }

                                return const Divider(
                                 color:Colors.transparent,
                                );
                              },
                              itemCount: controller.news.length,
                              itemBuilder: (context, index) {
                                final news = controller.news[index];
                                return NewsListCardHome(
                                  news: news,
                                  onTap: () {
                                   
                                    Get.toNamed(
                                      Routes.NEWS_STORIES,
                                      arguments: NewsOrThread.news(news: news),
                                    )?.then((value) {
                                      controller.initialFetch(false);
                                      controller
                                          .checkNotificationPermissionAndShowAlert();
                                    });
                                    Get.find<FirebaseAnalytics>().logEvent(
                                        name: AnalyticsCustomEvent
                                            .for_you_open_news.name,
                                        parameters: {
                                          "news_id": news.id ?? "no id",
                                          "news_title": news.title.substring(0,
                                              min(38, (news.title.length - 1))),
                                          "category": news.category?.name ?? "",
                                        });
                                    
                                  }
                                );
                              },
                            ),
                          ),
                          // if (controller.isLoading.value)
                          //   const LinearProgressIndicator()
                        ],
                      );
              });
            }
            if (index == 1) {
              if (controller.isTopicLoading.value) {
                return const CategoryNewsListShimmer();
              } else {
                return ListView.separated(
                  separatorBuilder: (_, __) => const Divider(
                    color: AppColors.primary,
                  ),
                  itemCount: controller.topics.length,
                  itemBuilder: (context, index) =>
                      TopicListCard(topic: controller.topics[index]),
                );
              }
            }

            return NewsByCategoryTab(index: index, controller: controller);
          }),
        );
      }),
    );
  }
}

class NewsByCategoryTab extends StatefulWidget {
  final int index;
  final DiscoveryController controller;
  const NewsByCategoryTab(
      {super.key, required this.index, required this.controller});

  @override
  State<NewsByCategoryTab> createState() => _NewsByCategoryTabState();
}

class _NewsByCategoryTabState extends State<NewsByCategoryTab> {
  @override
  void initState() {
    Future.delayed(100.ms, () {
      widget.controller
          .fetchNewsByCategory(widget.index - 2, cacheRequest: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final newsMap = widget.controller.newsByCategoryMap.value;
      final categories = widget.controller.categories;

      final news = newsMap[widget.index - 2] ?? const NewsWithLoading();

      final topicByCategory = widget.controller.topics
          .where((p0) => p0.category == categories[widget.index - 2].id)
          .toList();
      return news.isLoading && news.news.isEmpty
          ? const CategoryNewsListShimmer()
          : news.news.isEmpty && !news.isLoading
              ? const Center(
                  child: Text("Empty!!"),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          if ((index + 1) % 2 == 0 &&
                              topicByCategory.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: TopicListCard(
                                  topic: topicByCategory.removeAt(0)),
                            );
                          }

                          return const Divider(
                            color: AppColors.primary,
                          );
                        },
                        itemCount: news.news.length,
                        itemBuilder: (context, index) => NewsListCardHome(
                          news: news.news[index],
                          onTap: () {
                            Get.toNamed(
                              Routes.NEWS_STORIES,
                              arguments:
                                  NewsOrThread.news(news: news.news[index]),
                            )?.then((value) {
                              widget.controller.initialFetch(false);
                              widget.controller
                                  .checkNotificationPermissionAndShowAlert();
                            });
                            Get.find<FirebaseAnalytics>().logEvent(
                                name: AnalyticsCustomEvent
                                    .category_tab_open_news.name,
                                parameters: {
                                  "news_id": news.news[index].id ?? 'no id',
                                  "news_title": news.news[index].title
                                      .substring(
                                          0,
                                          min(
                                              38,
                                              (news.news[index].title.length -
                                                  1))),
                                  "category":
                                      news.news[index].category?.name ?? "",
                                });
                          },
                        ),
                      ),
                    ),
                    if (news.isLoading) const LinearProgressIndicator(),
                  ],
                );
    });
  }
}

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({
    super.key,
    required this.controller,
  });

  final DiscoveryController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      toolbarHeight: 60,
      flexibleSpace: Obx(() {
        // if (controller.news.isEmpty) {
        //   return const SizedBox();
        // }

        final categories = controller.categories;
        return Container(
          padding:
              const EdgeInsets.only(left: 18, bottom: 10, right: 18, top: 10),
              
          alignment: Alignment.centerLeft,
          child: Container(
            height: 38,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              onTap: (value) {
                if (value == 0) {
                  Get.find<FirebaseAnalytics>().logEvent(
                      name: AnalyticsCustomEvent.for_you_tab_click.name,
                      parameters: {});
                } else if (value == 1) {
                  Get.find<FirebaseAnalytics>().logEvent(
                      name: AnalyticsCustomEvent.news_tab_click.name,
                      parameters: {"category": "topics"});
                } else {
                  Get.find<FirebaseAnalytics>().logEvent(
                      name: AnalyticsCustomEvent.news_tab_click.name,
                      parameters: {
                        "category": controller.categories[value - 2].name
                      });
                }
              },
              indicator: BoxDecoration(
                  color:  Get.isDarkMode ? Colors.grey.shade300 : AppColors.background,
                 
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller.categoriesTabController,
              isScrollable: true,
              labelColor:  Get.isDarkMode ? AppColors.background : AppColors.white,
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor:  Get.isDarkMode ? AppColors.white : AppColors.background,
              unselectedLabelStyle: const TextStyle(),
              
              tabs: [
                Tab(
                   text: LocaleKeys.for_you.tr,
                  
                 ),
                Tab(
                     text: LocaleKeys.title_topics.tr,
                
                 
                ),
                ...categories
                    .map((element) => Tab(
                          text: Get.locale?.isEnglish() ?? true
                              ? element.name
                              : element.hindiName,
                        
                        ))
                    .toList()
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CategoryNewsListShimmer extends StatelessWidget {
  const CategoryNewsListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView(
        children: const [
          SizedBox(
            height: 260,
            width: double.maxFinite,
            child: Card(),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 260,
            width: double.maxFinite,
            child: Card(),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 260,
            width: double.maxFinite,
            child: Card(),
          ),
        ],
      ),
    )
        .animate(
          onComplete: (controller) => controller.loop(),
        )
        .shimmer(
          color: Theme.of(context).highlightColor,
          duration: 900.ms,
        );
  }
}

class TopicListCard extends StatelessWidget {
  const TopicListCard({
    super.key,
    required this.topic,
  });

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.getAppTextScaleFactor
            .when(small: () => 160, normal: () => 175, large: () => 175),
        child: GestureDetector(
          onTap: () async {
            if (Get.currentRoute == Routes.TOPIC_NEWS) {
              if (Get.isRegistered<TopicNewsController>()) {
                await Get.delete<TopicNewsController>();
              }
              TopicNewsBinding().dependencies();
              Get.offNamed(
                Routes.TOPIC_NEWS,
                arguments: topic,
                preventDuplicates: false,
              );
              return;
            }

            Get.toNamed(
              Routes.TOPIC_NEWS,
              arguments: topic,
            );
          },
          child: Stack(
            children: [
              Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                elevation: 3,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    // borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(topic.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: const BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black26,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // stops: [0.4, 1],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        color: AppColors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          child: Text(
                            topic.hashtag,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        topic.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        topic.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

// class CarouselSection extends GetView<DiscoveryController> {
//   const CarouselSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 160,
//       child: Obx(() {
//         return controller.sliderNews.isEmpty
//             ? Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       SizedBox(
//                         height: 20,
//                         width: Get.width * 0.5,
//                         child: Material(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(8)),
//                           color: Theme.of(context).cardColor,
//                         )
//                             .animate(
//                               onComplete: (controller) => controller.loop(),
//                             )
//                             .shimmer(
//                               color: Theme.of(context).highlightColor,
//                               duration: 900.ms,
//                             ),
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       SizedBox(
//                         height: 20,
//                         width: Get.width * 0.9,
//                         child: Material(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(8)),
//                           color: Theme.of(context).cardColor,
//                         )
//                             .animate(
//                               onComplete: (controller) => controller.loop(),
//                             )
//                             .shimmer(
//                               color: Theme.of(context).highlightColor,
//                               duration: 800.ms,
//                             ),
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       SizedBox(
//                         height: 20,
//                         width: Get.width * 0.9,
//                         child: Material(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(8)),
//                           color: Theme.of(context).cardColor,
//                         )
//                             .animate(
//                               onComplete: (controller) => controller.loop(),
//                             )
//                             .shimmer(
//                               color: Theme.of(context).highlightColor,
//                               duration: 800.ms,
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//                 .animate(
//                   onComplete: (controller) => controller.loop(),
//                 )
//                 .shimmer(
//                   color: Theme.of(context).highlightColor,
//                   duration: 600.ms,
//                 )
//             : CarouselSlider.builder(
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   enlargeStrategy: CenterPageEnlargeStrategy.zoom,
//                   viewportFraction: 0.9,
//                 ),
//                 itemCount: controller.sliderNews.length,
//                 itemBuilder:
//                     (BuildContext context, int itemIndex, int pageViewIndex) {
//                   final news = controller.sliderNews[itemIndex];
//                   return GestureDetector(
//                     onTap: () {
//                       Get.toNamed(
//                         Routes.NEWS_STORIES,
//                         arguments: NewsOrThread.news(news: news),
//                       )?.then((value) => controller.initialFetch(false));
//                       Get.find<FirebaseAnalytics>().logEvent(
//                           name: AnalyticsCustomEvent.trending_news_click.name,
//                           parameters: {
//                             "news_id": news.id,
//                             "news_title": news.title
//                                 .substring(0, min(38, (news.title.length - 1))),
//                             "category": news.category?.name ?? "",
//                           });
//                     },
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: double.maxFinite,
//                           margin: const EdgeInsets.symmetric(horizontal: 8),
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: DecorationImage(
//                               image: CachedNetworkImageProvider(
//                                   news.urlToImage ?? ""),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           foregroundDecoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             gradient: LinearGradient(
//                               colors: [
//                                 Colors.transparent,
//                                 Colors.black,
//                               ],
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               stops: [0.2, 1],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                             bottom: 10,
//                             left: 25,
//                             right: 25,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     if (news.category != null)
//                                       Material(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(5)),
//                                         textStyle: const TextStyle(
//                                           color: Colors.black,
//                                         ),
//                                         color: AppColors.yellow,
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 5, vertical: 2.5),
//                                           child: Text(
//                                             (Get.locale?.isEnglish() ?? true
//                                                     ? news.category?.name
//                                                     : news
//                                                         .category?.hindiName) ??
//                                                 "",
//                                           ),
//                                         ),
//                                       ),
//                                     // const Padding(
//                                     //   padding:
//                                     //       EdgeInsets.symmetric(horizontal: 6),
//                                     //   child: Icon(
//                                     //     Icons.circle,
//                                     //     color:AppColors.white,
//                                     //     size: 6,
//                                     //   ),
//                                     // ),
//                                     // if (news.createdAt != null)
//                                     //   Text(
//                                     //     news.publishedOn!.getTimeAgo,
//                                     //     style: const TextStyle(
//                                     //         color:AppColors.white, fontSize: 13),
//                                     //   )
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   news.title.trim(),
//                                   maxLines: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     color: AppColors.white,
//                                   ),
//                                 ),
//                               ],
//                             ))
//                       ],
//                     ),
//                   );
//                 },
//               );
//       }),
//     );
//   }
// }


