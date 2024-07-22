// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:expandable_page_view/expandable_page_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:news_shots_app/app/core/colors.dart';
// import 'package:news_shots_app/app/core/extenstions.dart';
// import 'package:news_shots_app/app/core/widgets/form_helper.dart';
// import 'package:news_shots_app/app/data/models/news/news.dart';
// import 'package:news_shots_app/app/modules/home/controllers/discovery_page_controller.dart';
// import 'package:news_shots_app/app/modules/home/controllers/home_controller.dart';
// import 'package:news_shots_app/app/modules/home/uistate/news_with_loading.dart';
// import 'package:news_shots_app/generated/locales.g.dart';

// class DiscoverySection extends GetView<DiscoveryPageController> {
//   const DiscoverySection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 60,
//         // backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Align(
//           alignment: Alignment.centerRight,
//           child: FormHelper.iconButton(
//             icon: HeroIcons.bars_3_center_left,
//             onTap: () => Scaffold.of(context).openDrawer(),
//           ),
//         ),
//         actions: [
//           // FormHelper.iconButton(
//           //   icon: context.isDarkMode ? HeroIcons.sun : HeroIcons.moon,
//           //   onTap: () {
//           //     Get.toggleThemeMode();
//           //   },
//           // ),
//           // const SizedBox(
//           //   width: 10,
//           // ),
//           FormHelper.iconButton(
//             icon: HeroIcons.magnifying_glass,
//             onTap: () {},
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           FormHelper.iconButton(
//             icon: HeroIcons.chevron_right,
//             onTap: () {
//               Get.find<HomeController>().homePageController.animateToPage(1,
//                   duration: 600.milliseconds, curve: Curves.decelerate);
//             },
//           ),
//           const SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: [
//           const BreakingNewsSection(),
//           SliverToBoxAdapter(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   LocaleKeys.title_topics.tr,
//                   style: Get.textTheme.titleLarge,
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Text(LocaleKeys.button_view_all.tr))
//               ],
//             ).paddingSymmetric(horizontal: 20, vertical: 10),
//           ),
//           const TopicsCard(),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     LocaleKeys.title_recommendation.tr,
//                     style: Get.textTheme.titleLarge,
//                   ),
//                   TextButton(
//                       onPressed: () {},
//                       child: Text(LocaleKeys.button_view_all.tr))
//                 ],
//               ).paddingSymmetric(horizontal: 20),
//             ]),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             sliver: Obx(() {
//               return SliverList.builder(
//                 itemCount: controller.breakingNews.length,
//                 itemBuilder: (contex, index) =>
//                     NewsListCard(news: controller.breakingNews[index]),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BreakingNewsSection extends StatelessWidget {
//   const BreakingNewsSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//         delegate: SliverChildListDelegate([
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             LocaleKeys.title_breaking_news.tr,
//             style: Get.textTheme.titleLarge,
//           ),
//           TextButton(
//               onPressed: () {}, child: Text(LocaleKeys.button_view_all.tr))
//         ],
//       ).paddingSymmetric(horizontal: 20),
//       const SizedBox(
//         height: 10,
//       ),
//       const CarouselSection(),
//     ]));
//   }
// }

// class TopicsCard extends GetView<DiscoveryPageController> {
//   const TopicsCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       sliver: Obx(() {
//         final categories = Get.find<DiscoveryPageController>().categories;
//         if (categories.isNotEmpty) {
//           controller.initTabController(categories.length);
//         }
//         return SliverList(
//           delegate: SliverChildListDelegate(
//             categories.isEmpty
//                 ? []
//                 : [
//                     SizedBox(
//                       height: 40,
//                       child: TabBar(
//                           dividerColor: Colors.transparent,
//                           // indicatorWeight: 10,
//                           onTap: (value) {
//                             controller.contentPageController.animateToPage(
//                                 value,
//                                 duration: 400.milliseconds,
//                                 curve: Curves.decelerate);
//                           },
//                           indicator: const BoxDecoration(
//                               color: AppColors.primary,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           indicatorSize: TabBarIndicatorSize.tab,
//                           controller: controller.tabController,
//                           isScrollable: true,
//                           labelColor: Colors.white,
//                           tabs: categories
//                               .map((element) => Tab(
//                                     text: element.name,
//                                   ))
//                               .toList()),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Obx(() {
//                       final newsMap = controller.newsByCategoryMap.value;

//                       return ExpandablePageView.builder(
//                         onPageChanged: (value) {
//                           controller.tabController.animateTo(value);
//                           controller.fetchNewsByCategory(value);
//                         },
//                         controller: controller.contentPageController,
//                         itemCount: categories.length,
//                         itemBuilder: (context, index) {
//                           final news =
//                               newsMap[index] ?? const NewsWithLoading();
//                           // print(controller.newsByCategoryMap);
//                           return news.isLoading
//                               ? const Center(
//                                   child: CircularProgressIndicator(),
//                                 )
//                               : news.news.isEmpty
//                                   ? const Center(
//                                       child: Text("Empty!!"),
//                                     )
//                                   : ListView.builder(
//                                       primary: false,
//                                       itemCount: news.news.length,
//                                       shrinkWrap: true,
//                                       itemBuilder: (context, index) =>
//                                           NewsListCard(
//                                         news: news.news[index],
//                                       ),
//                                     );
//                         },
//                       );
//                     }),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                   ],
//           ),
//         );
//       }),
//     );
//   }
// }

// class NewsListCard extends StatelessWidget {
//   final News news;
//   const NewsListCard({
//     super.key,
//     required this.news,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 100,
//         child: Card(
//           child: Row(
//             children: [
//               AspectRatio(
//                 aspectRatio: 1,
//                 child: Card(
//                   clipBehavior: Clip.hardEdge,
//                   child: news.urlToImage == null
//                       ? const Center(
//                           child: Icon(
//                             Icons.error_outline,
//                             color: Colors.red,
//                           ),
//                         )
//                       : CachedNetworkImage(
//                           imageUrl: news.urlToImage!,
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       news.category?.name ?? "",
//                       style: const TextStyle(
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Text(
//                       news.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 15,
//                         // fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       news.publishedOn?.getTimeAgo ?? "",
//                       style: const TextStyle(color: Colors.grey, fontSize: 12),
//                     )
//                   ],
//                 ).paddingSymmetric(vertical: 5, horizontal: 4),
//               )
//             ],
//           ),
//         ));
//   }
// }

// class CarouselSection extends GetView<DiscoveryPageController> {
//   const CarouselSection({
//     super.key,
//   });

//   // final HomeController controller;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Obx(() {
//         return controller.breakingNews.isEmpty
//             ? const Center(
//                 child: Text("Loading..."),
//               )
//             : CarouselSlider.builder(
//                 // carouselController: controller.carouselController,
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   enlargeStrategy: CenterPageEnlargeStrategy.zoom,
//                   viewportFraction: 0.9,
//                 ),
//                 itemCount: controller.breakingNews.length,
//                 itemBuilder:
//                     (BuildContext context, int itemIndex, int pageViewIndex) {
//                   final news = controller.breakingNews[itemIndex];
//                   return Stack(
//                     children: [
//                       Container(
//                         width: double.maxFinite,
//                         margin: const EdgeInsets.symmetric(horizontal: 8),
//                         decoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: DecorationImage(
//                               image: news.urlToImage != null
//                                   ? CachedNetworkImageProvider(news.urlToImage!)
//                                   : const CachedNetworkImageProvider(
//                                       "https://images.unsplash.com/photo-1442850473887-0fb77cd0b337?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8TmF0dXJlL3x8fHx8fDE2ODUwMDA0NTg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=540"),
//                               fit: BoxFit.cover,
//                             )),
//                         foregroundDecoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.transparent,
//                               Colors.black,
//                             ],
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             stops: [0.4, 1],
//                           ),
//                         ),
//                       ),
//                       if (news.category != null)
//                         Positioned(
//                           left: 10,
//                           top: 6,
//                           child: Card(
//                             color: AppColors.action2,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 4),
//                               child: Text(
//                                 news.category!.name,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       Positioned(
//                           bottom: 10,
//                           left: 25,
//                           right: 25,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "${news.source?.name ?? ""} • ${news.publishedOn != null ? news.publishedOn!.getTimeAgo : ''}",
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 news.title,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 17,
//                                   color: Colors.white,
//                                 ),
//                               )
//                             ],
//                           ))
//                     ],
//                   );
//                 },
//               );
//       }),
//     );
//   }
// }
