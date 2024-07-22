// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:lottie/lottie.dart';

// import '../../../core/gen/assets.gen.dart';
// import '../../../core/widgets/form_helper.dart';
// import '../../../data/models/news/news.dart';
// import '../controllers/home_controller.dart';
// import '../../../core/extenstions.dart';

// class StoriesSection extends GetView<HomeController> {
//   const StoriesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Stack(
//         children: [
//           GestureDetector(
//             onTap: () {
//               controller.showAppBar.value = !controller.showAppBar.value;
//             },
//             child: SizedBox(
//               width: Get.width,
//               height: Get.height,
//               child: controller.news.isEmpty
//                   ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Lottie.network(
//                               "https://assets10.lottiefiles.com/private_files/lf30_oqpbtola.json"),
//                           const Text(
//                             "No News Found",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ],
//                       ),
//                     )
//                   : PageView.builder(
//                       onPageChanged: (index) {
//                         controller.onStoryChange(index);
//                       },
//                       itemCount: controller.news.length,
//                       controller: controller.storiesPageController,
//                       scrollDirection: Axis.vertical,
//                       itemBuilder: (context, index) {
//                         return NewsStory(
//                           news: controller.news[index],
//                         );
//                       },
//                     ),
//             ),
//           ),
//           AnimatedAppBar(
//             controller: controller,
//           )
//         ],
//       );
//     });
//   }
// }

// class AnimatedAppBar extends StatelessWidget {
//   const AnimatedAppBar({
//     super.key,
//     required this.controller,
//   });

//   final HomeController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       // duration: 600.milliseconds,
//       top: 0,
//       left: 0,
//       right: 0,
//       child: Obx(() {
//         return AnimatedSwitcher(
//           switchInCurve: Curves.fastLinearToSlowEaseIn,
//           switchOutCurve: Curves.fastEaseInToSlowEaseOut,
//           duration: 600.ms,
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(0.0, -1.0), // Slide from right to left
//                 end: const Offset(0.0, 0.0),
//               ).animate(animation),
//               child: child,
//             );
//           },
//           child: controller.showAppBar.value
//               ? AppBar(
//                   leadingWidth: 60,
//                   backgroundColor:
//                       Get.theme.scaffoldBackgroundColor.withOpacity(0.3),
//                   elevation: 0,
//                   leading: Align(
//                     alignment: Alignment.centerRight,
//                     child: Builder(
//                         builder: (context) => FormHelper.iconButton(
//                               icon: HeroIcons.bars_3_center_left,
//                               onTap: () => Scaffold.of(context).openDrawer(),
//                             )),
//                   ),
//                   actions: [
//                     FormHelper.iconButton(
//                       icon: controller.toggleBookmark.value
//                           ? Icons.bookmark
//                           : Icons.bookmark_outline,
//                       iconColor:
//                           controller.toggleBookmark.value ? Colors.green : null,
//                       onTap: () {
//                         controller.toggleBookmark.value =
//                             !controller.toggleBookmark.value;
//                       },
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     FormHelper.iconButton(
//                       icon: HeroIcons.share,
//                       onTap: () {},
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     )
//                   ],
//                 )
//               : const SizedBox(),
//         );
//       }),
//     );
//   }
// }

// class NewsStory extends StatelessWidget {
//   final News news;
//   const NewsStory({
//     super.key,
//     required this.news,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: ElevatedButton.icon(
//           onPressed: () {
//             Get.bottomSheet(
//               PollBottomSheet(),
//             );
//           },
//           icon: const Icon(FontAwesome.circle_question),
//           label: const Text("What's Your opinion?")),
//       body: Column(
//         children: [
//           Transform.scale(
//             origin: const Offset(0, 2),
//             scaleY: 1.1,
//             child: Material(
//               elevation: 3,
//               child: SizedBox(
//                   height: Get.height * 0.3,
//                   width: double.maxFinite,
//                   child: news.urlToImage == null
//                       ? Center(
//                           child: LottieBuilder.asset(Assets.lottie.error404))
//                       : Image.network(
//                           news.urlToImage ?? "",
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Center(
//                                 child: LottieBuilder.asset(
//                                     Assets.lottie.error404));
//                           },
//                         )),
//             ),
//           ),
//           Expanded(
//             child: SizedBox(
//               width: double.maxFinite,
//               child: Material(
//                 elevation: 2,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       news.title,
//                       style: GoogleFonts.poppins(
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       news.description,
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(news.publishedOn?.getDate() ?? ""),
//                     const Spacer(),
//                   ],
//                 ).paddingSymmetric(horizontal: 18, vertical: 20),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PollBottomSheet extends StatelessWidget {
//   final hasAnswer = false.obs;
//   PollBottomSheet({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         clipBehavior: Clip.hardEdge,
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//         color: Theme.of(context).cardColor,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AppBar(
//               backgroundColor: Theme.of(context).cardColor,
//               automaticallyImplyLeading: false,
//               actions: [
//                 FormHelper.iconButton(
//                   onTap: () {
//                     Get.back();
//                   },
//                   icon: Icons.close,
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Do you think Ashwin is a better batsman than a bowler?",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Obx(() {
//                     return (hasAnswer.value)
//                         ? Material(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                                 side: BorderSide(
//                                   color: Colors.blueGrey.shade600,
//                                 )),
//                             // elevation: 10,
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 5, bottom: 15, left: 15, right: 15),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                           onPressed: () {},
//                                           icon: const Icon(Icons.share)),
//                                       const Text(
//                                         "Share Poll Results",
//                                         style: TextStyle(fontSize: 16),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   const Material(
//                                     clipBehavior: Clip.hardEdge,
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(14)),
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           flex: 3,
//                                           child: Material(
//                                             color: Colors.green,
//                                             child: Padding(
//                                               padding: EdgeInsets.all(8.0),
//                                               child: Text(
//                                                 "Yes (30%)",
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 7,
//                                           child: Material(
//                                             color: Colors.blue,
//                                             child: Padding(
//                                               padding: EdgeInsets.all(8.0),
//                                               child: Text("No (70%)",
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.white)),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ).animate().fadeIn()
//                         : Row(
//                             children: [
//                               Expanded(
//                                 child: OutlinedButton(
//                                   onPressed: () {
//                                     hasAnswer.value = true;
//                                   },
//                                   child: const Text("Yes"),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Expanded(
//                                 child: OutlinedButton(
//                                   onPressed: () {
//                                     hasAnswer.value = true;
//                                   },
//                                   child: const Text("No"),
//                                 ),
//                               ),
//                             ],
//                           );
//                   })
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
