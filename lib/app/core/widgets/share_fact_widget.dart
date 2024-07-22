import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/models/threads/thread.dart';

import '../../modules/news_stories/views/thread_view.dart';

class ThreadShareWidget extends StatelessWidget {
  final Thread thread;
  final int currentIndex;
  const ThreadShareWidget(
      {super.key, required this.thread, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final currentFact =
        thread.facts.isNotEmpty ? thread.facts[currentIndex] : null;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: thread.backgroundImgUrl == null
            ? null
            : BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(thread.backgroundImgUrl!),
                  fit: BoxFit.cover,
                ),
              ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentFact != null &&
                    currentFact.titleHeader != null &&
                    currentFact.titleHeader!.isNotEmpty)
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        currentFact.titleHeader!,
                        style: Get.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (currentFact != null)
                  AspectRatio(
                    aspectRatio: 1,
                    child: FactCard(fact: currentFact),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (thread.facts.length > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: thread.facts.mapIndexed((i, e) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(Icons.circle_outlined),
                          if (currentIndex == i)
                            const Icon(
                              Icons.circle,
                              size: 16,
                            )
                        ],
                      );
                    }).toList(),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (currentFact != null &&
                    currentFact.titleFooter != null &&
                    currentFact.titleFooter!.isNotEmpty)
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        currentFact.titleFooter!,
                        style: Get.textTheme.headlineLarge,
                      ),
                    ),
                  ),
              ],
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
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
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
