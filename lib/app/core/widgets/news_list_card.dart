import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';

import '../../data/models/news/news.dart';
import '../colors.dart';
import 'image_loader.dart';

class NewsListCard extends StatelessWidget {
  final News news;
  final VoidCallback onTap;
  const NewsListCard({
    super.key,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
          height: Get.getAppTextScaleFactor.when(
              small: () => 90,
              normal: () => Get.locale!.isEnglish() ? 106 : 120,
              large: () => Get.locale!.isEnglish() ? 120 : 140),
          child: InkWell(
            onTap: onTap,
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    height: Get.getAppTextScaleFactor.when(
                        small: () => 90,
                        normal: () => 106,
                        large: () => Get.locale!.isEnglish() ? 120 : 132),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        child: news.urlToImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                              )
                            : ImageLoader(
                                url: news.urlToImage!,
                                // fit: BoxFit.cover,
                                // errorWidget: (context, url, error) =>
                                //     const Center(
                                //   child: Icon(
                                //     Icons.error_outline,
                                //     color: Colors.red,
                                //   ),
                                // ),
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (Get.locale?.isEnglish() ?? true)
                              ? news.category?.name ?? ""
                              : news.category?.hindiName ?? "",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.locale!.isEnglish() ? 13 : 15,
                          ),
                        ),
                        Text(
                          (news.createdAt?.hour.isEven ?? false)
                              ? news.notificationTitle?.trim() ??
                                  news.title.trim()
                              : news.title.trim(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Get.locale!.isEnglish() ? 13 : 15,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const Spacer(),
                        // Text(
                        //   news.createdAt?.getTimeAgo ?? "",
                        //   style: TextStyle(
                        //       color: Theme.of(context).disabledColor,
                        //       fontSize: 10),
                        // )
                      ],
                    ).paddingSymmetric(vertical: 5, horizontal: 4),
                  )
                ],
              ),
            ),
          ));
    });
  }
}

class NewsListCardHome extends StatelessWidget {
  final News news;
  final VoidCallback onTap;
  const NewsListCardHome({
    super.key,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
            // side: BorderSide(
            //   color: AppColors.primary,
            // ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(news: news),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    color: AppColors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      child: Text(
                        (Get.locale?.isEnglish() ?? true)
                            ? news.category?.name ?? ""
                            : news.category?.hindiName ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    (news.createdAt?.hour.isEven ?? false)
                        ? news.notificationTitle?.trim() ?? news.title.trim()
                        : news.title.trim(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: CachedNetworkImage(
        imageUrl: news.urlToImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.maxFinite,
      ),
    );
    // return Container(
    //   constraints: const BoxConstraints(
    //     maxHeight: 240,
    //     minHeight: 0,
    //   ),
    //   child: ClipRRect(
    //     child: Stack(
    //       children: <Widget>[
    //         if (news.urlToImage != null)
    //           CachedNetworkImage(
    //             imageUrl: news.urlToImage!,
    //             fit: BoxFit.cover,
    //             width: double.infinity,
    //             height: double.maxFinite,
    //           ),
    //         if (news.urlToImage != null)
    //           BackdropFilter(
    //             filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
    //             child: CachedNetworkImage(
    //               imageUrl: news.urlToImage!,
    //               fit: BoxFit.fitHeight,
    //               // fit: BoxFit.cover,
    //               width: double.infinity,
    //             ),
    //           )
    //       ],
    //     ),
    //   ),
    // );
  }
}
