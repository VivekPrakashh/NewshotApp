import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'widgets/drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.rootDelegate,
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          drawer: const AppDrawer(),
          drawerEnableOpenDragGesture: false,
          body: GetRouterOutlet(
            initialRoute: Routes.NEWS_STORIES,
            anchorRoute: Routes.HOME,
          ),

          // body: Obx(() {
          //   return PageView(
          //     controller: controller.homePageController,
          //     children: [
          //       const DiscoverySection(),
          //       const KeepAliveWrapper(child: StoriesSection()),
          //       if (controller.hasSourceOfCurrentNews) const StoriesSourceSection(),
          //     ],
          //   );
          // }),
        );
      },
    );
  }
}

// class ImageSlider extends StatefulWidget {
//   const ImageSlider({super.key});

//   @override
//   State<ImageSlider> createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<ImageSlider> {
//   final currentIndex = 0.obs;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: Get.height,
//       width: Get.width,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: Get.height,
//             width: Get.width,
//             child: Assets.images.background3.image(
//               fit: BoxFit.cover,
//               colorBlendMode: Get.isDarkMode ? null : BlendMode.dstIn,
//               color: Get.isDarkMode ? null : AppColors.card.withOpacity(0.9),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CarouselSlider.builder(
//                 options: CarouselOptions(
//                   scrollPhysics: const ClampingScrollPhysics(),
//                   enableInfiniteScroll: false,
//                   autoPlay: false,
//                   height: 450,
//                   onPageChanged: (index, reason) {
//                     currentIndex.value = index;
//                   },
//                 ),
//                 itemCount: 8,
//                 itemBuilder:
//                     (BuildContext context, int itemIndex, int pageViewIndex) =>
//                         Card(
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                   ),
//                   clipBehavior: Clip.hardEdge,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         width: double.maxFinite,
//                         child: Material(
//                             color: AppColors.cardDark,
//                             child: Text(
//                               "Beacon's Hidden Journey",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.lobster(
//                                 fontSize: 26,
//                                 color: Colors.white,
//                               ),
//                             )),
//                       ),
//                       const Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                         child: Text(
//                           "In a small coastal town, a mysterious lighthouse stood tall, captivating the locals with its enigmatic charm. Legends whispered of a hidden treasure hidden within its depths. One stormy night, a brave young woman ventured inside, guided by an ancient map. \"The true treasure lies in the journey itself.\"",
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: Get.width,
//                         child: Image.network(
//                           'https://images.unsplash.com/photo-1499002238440-d264edd596ec?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8TmF0dXJlL3x8fHx8fDE2ODUwMDA2ODI&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Obx(() {
//                 return Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: List.generate(
//                     8,
//                     (index) => Icon(
//                       Icons.circle,
//                       color: currentIndex.value == index
//                           ? AppColors.primary
//                           : AppColors.primary.withOpacity(0.5),
//                     ),
//                   ),
//                 );
//               })
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
