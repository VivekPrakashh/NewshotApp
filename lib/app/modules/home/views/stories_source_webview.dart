// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:news_shots_app/app/modules/home/controllers/home_controller.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class StoriesSourceSection extends StatefulWidget {
//   const StoriesSourceSection({super.key});

//   @override
//   State<StoriesSourceSection> createState() => _StoriesSourceSectionState();
// }

// class _StoriesSourceSectionState extends State<StoriesSourceSection> {
//   final controller = Get.find<HomeController>();
//   StreamSubscription? currentNewsSubs;
//   late final WebViewController webViewController;
//   final progress = 0.0.obs;
//   final isLoadingCompleted = false.obs;

//   Future<void> _launchUrl(String url) async {
//     try {
//       if (!await launchUrl(
//         Uri.parse(url),
//         mode: LaunchMode.externalApplication,
//       )) {
//         throw Exception('Could not launch $url');
//       }
//     } on Exception catch (e) {
//       debugPrint(e.toString());
//       // Get.find<Logger>().e("Error in launching url : ${e.toString()}", e, s);
//     }
//   }

//   @override
//   void initState() {
//     webViewController = WebViewController();
//     if (Get.find<HomeController>().homePageController.page! > 1) {
//       print(".............................loading webview news ..............");
//       webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
//       webViewController.setNavigationDelegate(NavigationDelegate(
//         onProgress: (progress) {
//           this.progress.value = progress / 100;
//         },
//         onPageFinished: (url) {
//           isLoadingCompleted.value = true;
//         },
//         onNavigationRequest: (request) {
//           // print(request.isMainFrame);
//           // print(request.url);

//           return NavigationDecision.navigate;
//         },
//       ));

//       if (controller.hasSourceOfCurrentNews) {
//         webViewController.loadRequest(
//             Uri.parse(controller.news[controller.currentNewsIndex.value].url!));
//       }
//     }

//     super.initState();
//   }

//   @override
//   dispose() {
//     webViewController.loadRequest(Uri.parse('about:blank'));
//     super.dispose();
//   }

//   copyUrlToClipBoard() {
//     Clipboard.setData(ClipboardData(
//             text: controller.news[controller.currentNewsIndex.value].url!))
//         .then((value) {
//       EasyLoading.showToast("Copied to Clipboard",
//           toastPosition: EasyLoadingToastPosition.bottom);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (await webViewController.canGoBack()) {
//           webViewController.goBack();
//         } else {
//           controller.homePageController.animateToPage(1,
//               duration: 400.milliseconds, curve: Curves.easeInQuad);
//         }
//         return Future.value(false);
//       },
//       child: SafeArea(
//         child: Scaffold(
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(40),
//             child: AppBar(
//               leading: IconButton(
//                 onPressed: () {
//                   controller.homePageController.animateToPage(1,
//                       duration: 400.milliseconds, curve: Curves.easeInQuad);
//                 },
//                 icon: const Icon(Icons.arrow_back),
//               ),
//               actions: [
//                 PopupMenuButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   itemBuilder: (context) => [
//                     PopupMenuItem(
//                       height: 35,
//                       onTap: () {
//                         copyUrlToClipBoard();
//                       },
//                       child: const Text("Copy link"),
//                     ),
//                     PopupMenuItem(
//                       height: 35,
//                       onTap: () {
//                         _launchUrl(controller
//                             .news[controller.currentNewsIndex.value].url!);
//                       },
//                       child: const Text("Open in browser"),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             // child: Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 0),
//             //   child: Row(
//             //     children: [
//             //       IconButton(
//             //           onPressed: () {},
//             //           icon: const Icon(
//             //             Icons.arrow_back,
//             //             // size: 30,
//             //           ))
//             //     ],
//             //   ),
//             // ),
//           ),
//           // height: Get.height,
//           body: Column(
//             children: [
//               Obx(() {
//                 return isLoadingCompleted.value
//                     ? const SizedBox()
//                     : LinearProgressIndicator(
//                         value: progress.value,
//                       );
//               }),
//               Expanded(
//                 child: WebViewWidget(
//                   controller: webViewController,
//                   gestureRecognizers: {
//                     Factory<VerticalDragGestureRecognizer>(
//                         () => VerticalDragGestureRecognizer()),
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
