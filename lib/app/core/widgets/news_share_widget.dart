import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/news/news.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';

class NewsShare extends StatelessWidget {
  final News news;
  const NewsShare({super.key, required this.news});

  getHeightFromText() {
    final span =
        TextSpan(text: news.description, style: Get.textTheme.bodyLarge);

    TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textScaleFactor: Get.textScaleFactor,
    );
    textPainter.layout(minWidth: 0, maxWidth: Get.width - 40);
    final linkSize = textPainter.size;
    debugPrint(linkSize.toString());
    return linkSize.height + Get.height * 0.3 + 450;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: getHeightFromText(),
        // height: news.description.length > 360 ? Get.height * 1.2 : Get.height,
        child: Stack(
          children: [
            Material(
              elevation: 3,
              child: SizedBox(
                  height: Get.height * 0.3,
                  // height: widget.news.description.length > 400
                  //     ? Get.height * 0.25
                  //     : Get.height * 0.3,
                  width: double.maxFinite,
                  child: news.urlToImage == null
                      ? Center(
                          child: LottieBuilder.asset(Assets.lottie.error404))
                      : CachedNetworkImage(
                          imageUrl: news.urlToImage ?? "",
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) {
                            return Center(
                                child: LottieBuilder.asset(
                                    Assets.lottie.error404));
                          },
                        )),
            ),
            Positioned(
              top: Get.height * 0.18,
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: Get.width,
                child: Material(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
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
                        Material(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Get.theme.colorScheme.onBackground,
                              width: 2,
                            ),
                          ),
                          color: Get.isDarkMode
                              ? Get.theme.colorScheme.surface
                              : const Color(0xffF6FFF8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  news.title.trim(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          news.description.trim(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Center(
                          child: Text(
                              "To See Full News Download Our App \n\"Reveal Inside\"",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.inter,
                                height: 1.2,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  child: Image.asset(Assets.images.logo.path,
                                      width: 37),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
