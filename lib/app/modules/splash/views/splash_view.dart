import 'package:flutter/material.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/core/gen/fonts.gen.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset(Assets.images.logo.path,
                                      width: 200),
                                ),
                                const SizedBox(height: 5,),
                                 Text(
                              "Reveal Inside",
                              style:TextStyle(
                                fontSize: 22,
                                color:   Get.isDarkMode ? Colors.grey.shade300 : AppColors.background,
                                 fontFamily: FontFamily.inter,
                                 fontWeight: FontWeight.w900
                              )
                              //  GoogleFonts.salsa(),
                            ),
                              ],
                            ),
                          ),
    );
    // print(MediaQuery.of(context));
    // Clipboard.setData(ClipboardData(text: MediaQuery.of(context).toString()));

    // final categories = <String>[
    //   "Business",
    //   "National",
    //   "Health",
    //   "Sports",
    //   "Lifestyle",
    //   "World News",
    //   "Crime and Justice",
    //   "Entertainment",
    //   "Technology"
    // ];

    // return Scaffold(
    //   // backgroundColor: AppColors.primary,
    //   backgroundColor:
    //       Get.isDarkMode ? const Color(0xff272727) : AppColors.white,
    //   body: Stack(
    //     children: [
    //       Positioned(
    //         bottom: -40,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //           alignment: Alignment.center,
    //           child: Lottie.asset(
    //             Assets.lottie.vault,
    //             fit: BoxFit.fill,
    //             // width: 250,
    //             height: 250,
    //           ),
    //         ),
    //       ),
    //       Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           // crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Column(
    //               children: [
    //                 // const SizedBox(
    //                 //   height: 20,
    //                 // ),
    //                 ClipRRect(
    //                   borderRadius: const BorderRadius.all(Radius.circular(60)),
    //                   child: SizedBox(
    //                     width: Get.width * 0.3,
    //                     height: Get.width * 0.3,
    //                     child: Image.asset(
    //                       Assets.images.logo.path,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Stack(
    //                   alignment: Alignment.center,
    //                   children: [
    //                     SizedBox(
    //                       width: 320,
    //                       child: CustomPaint(
    //                         painter: RPSCustomPainter(AppColors.primary),
    //                         size: const Size(320, 65),
    //                       ),
    //                     ),
    //                     // SizedBox(
    //                     //   width: 330,
    //                     //   child: Row(
    //                     //     mainAxisSize: MainAxisSize.min,
    //                     //     children: [
    //                     //       Expanded(
    //                     //         flex: 7,
    //                     //         child: Transform.translate(
    //                     //           offset: const Offset(28, 0),
    //                     //           child: CustomPaint(
    //                     //             painter: RPSCustomPainter(AppColors.primary),
    //                     //             size: const Size(320, 65),
    //                     //           ),
    //                     //         ),
    //                     //       ),
    //                     //       Expanded(
    //                     //         flex: 6,
    //                     //         child: Transform.translate(
    //                     //           offset: const Offset(-27, 5.5),
    //                     //           child: RotatedBox(
    //                     //             quarterTurns: 2,
    //                     //             child: CustomPaint(
    //                     //               painter: RPSCustomPainter(Colors.yellow),
    //                     //               size: const Size(320, 65),
    //                     //             ),
    //                     //           ),
    //                     //         ),
    //                     //       ),
    //                     //     ],
    //                     //   ),
    //                     // ),
    //                     RichText(
    //                         text: TextSpan(
    //                             style: GoogleFonts.salsa(
    //                               fontSize: 34,
    //                               fontWeight: FontWeight.bold,
    //                               color: AppColors.red,
    //                             ),
    //                             children: const [
    //                           TextSpan(
    //                             text: "Reveal ",
    //                             // style: TextStyle(
    //                             //   shadows: [
    //                             //     Shadow(
    //                             //         // bottomLeft
    //                             //         offset: Offset(-1.5, -1.5),
    //                             //         color: Colors.red),
    //                             //     Shadow(
    //                             //         // bottomRight
    //                             //         offset: Offset(1.5, -1.5),
    //                             //         color: Colors.red),
    //                             //     Shadow(
    //                             //         // topRight
    //                             //         offset: Offset(1.5, 1.5),
    //                             //         color: Colors.red),
    //                             //     Shadow(
    //                             //         // topLeft
    //                             //         offset: Offset(-1.5, 1.5),
    //                             //         color: Colors.red),
    //                             //   ],
    //                             // ),
    //                           ),
    //                           TextSpan(
    //                             text: "Inside",
    //                             style: TextStyle(
    //                               color: AppColors.yellow,
    //                               // shadows: [
    //                               //   Shadow(
    //                               //       // bottomLeft
    //                               //       offset: Offset(-1.5, -1.5),
    //                               //       color: Colors.yellowAccent),
    //                               //   Shadow(
    //                               //       // bottomRight
    //                               //       offset: Offset(1.5, -1.5),
    //                               //       color: Colors.yellowAccent),
    //                               //   Shadow(
    //                               //       // topRight
    //                               //       offset: Offset(1.5, 1.5),
    //                               //       color: Colors.yellowAccent),
    //                               //   Shadow(
    //                               //       // topLeft
    //                               //       offset: Offset(-1.5, 1.5),
    //                               //       color: Colors.yellowAccent),
    //                               // ],
    //                             ),
    //                           ),
    //                         ])),
    //                     // Text(
    //                     //   "Reveal Inside",
    //                     //   style: GoogleFonts.salsa(
    //                     //     fontSize: 34,
    //                     //     fontWeight: FontWeight.bold,
    //                     //     color: AppColors.yellow,
    //                     //   ),
    //                     //   // style: TextStyle(
    //                     //   //   // color:AppColors.white,
    //                     //   //   fontSize: 30,
    //                     //   //   fontWeight: FontWeight.w700,
    //                     //   //   // fontFamily: FontFamily.openSans,
    //                     //   //   // decoration: TextDecoration.underline,
    //                     //   //   // decorationColor:AppColors.white,
    //                     //   // ),
    //                     // ),
    //                   ],
    //                 ),
    //               ],
    //             )
    //                 .animate()
    //                 .scale(
    //                   delay: 300.ms,
    //                 )
    //                 .slideY(
    //                   begin: 1,
    //                   end: 0,
    //                   delay: 300.ms,
    //                   curve: Curves.easeInOut,
    //                   duration: 400.ms,
    //                 ),

    //             // ...categories.mapIndexed(
    //             //     (i, e) => CategoryCard(categoryName: e.toUpperCase())
    //             //         .animate()
    //             //         .fadeIn(
    //             //           duration: 300.ms,
    //             //           delay: ((i * 100) + 200).ms,
    //             //           curve: Curves.easeInOut,
    //             //         )
    //             //         .slide(
    //             //           begin: Offset(i.isEven ? -5 : 5, (8 + i.toDouble())),
    //             //           end: const Offset(0, 0),
    //             //           duration: 600.ms,
    //             //           delay: ((i * 100) + 200).ms,
    //             //           curve: Curves.easeInOut,
    //             //         )
    //             //         // .then()
    //             //         .scale(
    //             //           begin: const Offset(0.9, 0.9),
    //             //           end: const Offset(1.1, 1.1),
    //             //         )
    //             //         // .tint(color: Colors.green)
    //             //         .then()
    //             //         .scale(
    //             //           begin: const Offset(1.1, 1.1),
    //             //           end: const Offset(1, 1),
    //             //         )
    //             //     // .tint(color:AppColors.white),
    //             //     )
    //             //
    //             // const CategoryCard(categoryName: "Business").animate().slide(
    //             //       begin: Offset(-2, 4),
    //             //       end: Offset(0, 0),
    //             //       duration: 800.ms,
    //             //     ),
    //             // const CategoryCard(categoryName: "National").animate().slide(
    //             //     begin: Offset(2, 5),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 400.ms),
    //             // const CategoryCard(categoryName: "Health").animate().slide(
    //             //     begin: Offset(-2, 6),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 800.ms),
    //             // const CategoryCard(categoryName: "Sports").animate().slide(
    //             //     begin: Offset(2, 7),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 1200.ms),
    //             // const CategoryCard(categoryName: "Lifestyle").animate().slide(
    //             //     begin: Offset(-2, 8),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 1600.ms),
    //             // const CategoryCard(categoryName: "World News").animate().slide(
    //             //     begin: Offset(2, 9),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 2000.ms),
    //             // const CategoryCard(categoryName: "Crime and Justics").animate().slide(
    //             //     begin: Offset(-2, 10),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 2400.ms),
    //             // const CategoryCard(categoryName: "Entertainment").animate().slide(
    //             //     begin: Offset(2, 11),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 2800.ms),
    //             // const CategoryCard(categoryName: "Technology").animate().slide(
    //             //     begin: Offset(-2, 12),
    //             //     end: Offset(0, 0),
    //             //     duration: 800.ms,
    //             //     delay: 3200.ms),

    //             // const Card(
    //             //   color: Color.fromARGB(255, 16, 16, 16),
    //             //   child: Padding(
    //             //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //             //     child: Text(
    //             //       "World News",
    //             //       style: TextStyle(
    //             //         color:AppColors.white,
    //             //         fontSize: 18,
    //             //       ),
    //             //     ),
    //             //   ),
    //             // )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  const CategoryCard({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      categoryName,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontWeight: FontWeight.w900,
        fontFamily: FontFamily.inter,
      ),
    );
    // return ConstrainedBox(
    //   constraints: const BoxConstraints(
    //     maxWidth: 300,
    //   ),
    //   child: const Material(
    //     borderRadius: BorderRadius.all(Radius.circular(14)),
    //     textStyle: TextStyle(
    //       color:AppColors.white,
    //       fontSize: 20,
    //     ),
    //     color: Color.fromARGB(255, 16, 16, 16),
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: Center(child: Text("World News")),
    //     ),
    //   ),
    // );
  }
}

// class RPSCustomPainter extends CustomPainter {
//   final Color color;

//   RPSCustomPainter(this.color);
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Layer 1

//     Paint paint_fill_0 = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.1250000, size.height * 0.2100000);
//     path_0.lineTo(size.width * 0.8775000, size.height * 0.2200000);
//     path_0.lineTo(size.width * 0.7800000, size.height * 0.5000000);
//     path_0.lineTo(size.width * 0.8775000, size.height * 0.8000000);
//     path_0.lineTo(size.width * 0.1275000, size.height * 0.7900000);
//     path_0.lineTo(size.width * 0.1825000, size.height * 0.5000000);
//     path_0.lineTo(size.width * 0.1250000, size.height * 0.2100000);
//     path_0.close();

//     canvas.drawPath(path_0, paint_fill_0);

//     // Layer 1

//     Paint paint_stroke_0 = Paint()
//       ..color = Colors.transparent
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_0, paint_stroke_0);

//     // Layer 1 Copy

//     Paint paint_fill_1 = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_1 = Path();
//     path_1.moveTo(size.width * 0.8772250, size.height * 0.9130000);
//     path_1.lineTo(size.width * 0.1247250, size.height * 0.8915000);
//     path_1.lineTo(size.width * 0.2225000, size.height * 0.6130000);
//     path_1.lineTo(size.width * 0.1252750, size.height * 0.3115000);
//     path_1.lineTo(size.width * 0.8752750, size.height * 0.3330000);
//     path_1.lineTo(size.width * 0.8200000, size.height * 0.6221000);
//     path_1.lineTo(size.width * 0.8772250, size.height * 0.9130000);
//     path_1.close();

//     canvas.drawPath(path_1, paint_fill_1);

//     // Layer 1 Copy

//     Paint paint_stroke_1 = Paint()
//       ..color = Colors.transparent
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_1, paint_stroke_1);

//     // Layer 1 Copy Copy

//     Paint paint_fill_2 = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_2 = Path();
//     path_2.moveTo(size.width * 0.8692750, size.height * 0.8374000);
//     path_2.lineTo(size.width * 0.1167750, size.height * 0.8159000);
//     path_2.lineTo(size.width * 0.2145500, size.height * 0.5374000);
//     path_2.lineTo(size.width * 0.1173250, size.height * 0.2359000);
//     path_2.lineTo(size.width * 0.8673250, size.height * 0.2574000);
//     path_2.lineTo(size.width * 0.8120500, size.height * 0.5465000);
//     path_2.lineTo(size.width * 0.8692750, size.height * 0.8374000);
//     path_2.close();

//     canvas.drawPath(path_2, paint_fill_2);

//     // Layer 1 Copy Copy

//     Paint paint_stroke_2 = Paint()
//       ..color = Colors.transparent
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_2, paint_stroke_2);

//     // Layer 1 Copy Copy Copy

//     Paint paint_fill_3 = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_3 = Path();
//     path_3.moveTo(size.width * 0.8692750, size.height * 0.7524000);
//     path_3.lineTo(size.width * 0.1167750, size.height * 0.7309000);
//     path_3.lineTo(size.width * 0.2145500, size.height * 0.4524000);
//     path_3.lineTo(size.width * 0.1173250, size.height * 0.1509000);
//     path_3.lineTo(size.width * 0.8673250, size.height * 0.1724000);
//     path_3.lineTo(size.width * 0.8120500, size.height * 0.4615000);
//     path_3.lineTo(size.width * 0.8692750, size.height * 0.7524000);
//     path_3.close();

//     canvas.drawPath(path_3, paint_fill_3);

//     // Layer 1 Copy Copy Copy

//     Paint paint_stroke_3 = Paint()
//       ..color = Colors.transparent
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_3, paint_stroke_3);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
