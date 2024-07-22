import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/core/gen/fonts.gen.dart';
import 'package:news_shots_app/app/data/models/news/news_section.dart';
// import 'package:pdf/pdf.dart';
// import 'package:social_share/social_share.dart';

// import 'package:pdf/widgets.dart' as pw;

class FaqShareWidget extends StatelessWidget {
  final List<NewsSection> faqs;
  final String newsTitle;
  const FaqShareWidget(
      {super.key, required this.faqs, required this.newsTitle});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // shrinkWrap: true,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              newsTitle,
              style: Get.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            ...faqs
                .slice(0, min(5, faqs.length - 1))
                .map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.question,
                          style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.inter,
                            height: 1.2,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // Text(e.answer,
                        //     style: const TextStyle(
                        //       fontSize: 16,
                        //       // fontWeight: FontWeight.bold,
                        //       fontFamily: FontFamily.inter,
                        //     )),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                      ],
                    ))
                .toList(),

            const Text(
              "..more   ",
              style: TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.bold,
                fontFamily: FontFamily.inter,
                height: 1,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                  "To See All Headlines Download Our App \n\"Reveal Inside\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.inter,
                    height: 1.2,
                  )),
            ),

            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(Assets.images.logo.path, width: 37),
                    ),
                    const Text(
                      "Reveal Inside",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Image.asset(
                  Assets.images.download.path,
                  width: 140,
                  height: 140,
                  // fit: BoxFit.fill,
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Image.asset(
            //       Assets.images.googlePlay.path,
            //       width: 120,
            //       height: 60,
            //     ),
            //     // Row(
            //     //   children: [
            //     //     ClipRRect(
            //     //       borderRadius: BorderRadius.circular(8),
            //     //       child: SizedBox(
            //     //         width: 35,
            //     //         child: AspectRatio(
            //     //           aspectRatio: 1,
            //     //           child: Image.asset(
            //     //             Assets.images.logo.path,
            //     //             fit: BoxFit.fitHeight,
            //     //             // width: 120,
            //     //           ),
            //     //         ),
            //     //       ),
            //     //     ),
            //     //     Material(
            //     //       borderRadius: const BorderRadius.only(
            //     //           topLeft: Radius.circular(8),
            //     //           topRight: Radius.circular(8)),
            //     //       child: Padding(
            //     //         padding: const EdgeInsets.symmetric(
            //     //             horizontal: 6, vertical: 3),
            //     //         child: Text(
            //     //           "Reveal Inside",
            //     //           style: TextStyle(
            //     //             color: Theme.of(context)
            //     //                 .colorScheme
            //     //                 .primary
            //     //                 .withOpacity(0.5),
            //     //             fontWeight: FontWeight.bold,
            //     //           ),
            //     //         ),
            //     //       ),
            //     //     )
            //     //   ],
            //     // ),
            //   ],
            // ),
            Center(
              child: Material(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
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
            ),
            const SizedBox(
              height: 30,
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 10,
            //   ),
            //   child: Column(
            //     children: [

            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// import 'package:pdf/pdf.dart';

// Future<Uint8List> generateFaqWidget(List<NewsFaq> faqs) {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.MultiPage(
//       build: (pw.Context context) {
//         return [
//           pw.Text("News Facts",
//               style: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 fontSize: 20,
//               )
//               // style: pw.Theme.of(context).,
//               ),
//           pw.SizedBox(
//             height: 8,
//           ),
//           pw.Divider(
//             color: PdfColor.fromHex('#000000'),
//           ),
//           ...faqs
//               .map((e) => pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text(
//                         e.question,
//                         style: pw.TextStyle(
//                           fontSize: 18,
//                           fontWeight: pw.FontWeight.bold,

//                           // fontFamily: FontFamily.inter,
//                         ),
//                       ),
//                       pw.SizedBox(
//                         height: 10,
//                       ),
//                       pw.Text(e.answer,
//                           style: const pw.TextStyle(
//                             fontSize: 16,
//                             // fontWeight: FontWeight.bold,
//                             // fontFamily: FontFamily.inter,
//                           )),
//                       pw.SizedBox(
//                         height: 15,
//                       ),
//                     ],
//                   ))
//               .toList()
//         ];
//       },
//       // margin: pw.EdgeInsets.zero,
//       pageFormat: PdfPageFormat.a4,
//     ),
//   );

//   return pdf.save();
// }
