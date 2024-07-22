import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/widgets/poll_bottom_sheet.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';

import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';

class PollShareWidget extends StatelessWidget {
  final Poll poll;
  final News news;
  const PollShareWidget({super.key, required this.poll, required this.news});

  @override
  Widget build(BuildContext context) {
    // final total = poll.results.values
    //     .fold(0, (previousValue, element) => previousValue + element);
    return Theme(
      data: Theme.of(context),
      child: Material(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: news.urlToImage == null
                            ? Center(
                                child:
                                    LottieBuilder.asset(Assets.lottie.error404))
                            : CachedNetworkImage(
                                imageUrl: news.urlToImage ?? "",
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => Center(
                                  child: LottieBuilder.asset(
                                      Assets.lottie.error404),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        news.title,
                        style: Get.textTheme.titleMedium,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                poll.question,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  PollOptionsWidget(
                    answer: poll.results.entries.first.value >
                            poll.results.entries.last.value
                        ? poll.results.entries.first.key
                        : poll.results.entries.last.key,
                    poll: poll,
                    isFirst: true,
                  ),
                  PollOptionsWidget(
                    answer: poll.results.entries.first.value >
                            poll.results.entries.last.value
                        ? poll.results.entries.first.key
                        : poll.results.entries.last.key,
                    poll: poll,
                    isFirst: false,
                  ),
                ],
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
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
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Text("${LocaleKeys.total_votes.tr}:$total",
              //       style: Get.textTheme.bodyLarge),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
