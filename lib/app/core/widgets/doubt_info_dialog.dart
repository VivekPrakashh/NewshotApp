// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_shots_app/app/core/gen/assets.gen.dart';
// import 'package:news_shots_app/app/data/db/database.dart';

// class DoubtInfoDialog extends StatelessWidget {
//   final String message;
//   final String title;
//   const DoubtInfoDialog(
//       {super.key, required this.message, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       clipBehavior: Clip.hardEdge,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AppBar(
//             title: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             automaticallyImplyLeading: false,
//             centerTitle: true,
//           ),
//           Image.asset(Assets.images.doubt.path),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             child: Text(
//               message,
//               style: const TextStyle(
//                 fontSize: 15,
//               ),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Get.find<AppLocalDB>()
//                     .localSessionsDao
//                     .updateDoubtAlertShown(true);
//                 Get.back();
//               },
//               child: const Text("Ok")),
//           const SizedBox(
//             height: 10,
//           )
//         ],
//       ),
//     );
//   }
// }
