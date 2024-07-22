import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/models/threads/thread.dart';
import '../controllers/news_stories_controller.dart';

class ThreadsView extends StatefulWidget {
  final Thread thread;
  const ThreadsView({super.key, required this.thread});

  @override
  State<ThreadsView> createState() => _ThreadsViewState();
}

class _ThreadsViewState extends State<ThreadsView> with WidgetsBindingObserver {
  final currentIndex = 0.obs;
  DateTime? _startTime;

  Fact? getCurrentFact() {
    if (widget.thread.facts.isEmpty) {
      currentIndex.value;
      return null;
    }
    return widget.thread.facts[currentIndex.value];
  }

  @override
  void initState() {
    super.initState();
    Get.find<NewsStoriesController>()
        .insertNewsLogToDb(widget.thread.id, false);
    WidgetsBinding.instance.addObserver(this);
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.thread_viewed.name, parameters: {
      "thread_id": widget.thread.id,
      "thread_title": widget.thread.threadTitle
              ?.substring(0, min(widget.thread.threadTitle!.length, 38)) ??
          "no title",
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  updateDuration() {
    final duration = DateTime.now().difference(_startTime!);
    Get.find<DiscoveryController>()
        .updateDuration(widget.thread.id, duration.inMilliseconds);
    if (kDebugMode) {
      EasyLoading.showToast("thread Duration:${duration.inSeconds}s",
          toastPosition: EasyLoadingToastPosition.bottom);
    }
    _startTime = null;
    Get.find<DiscoveryController>().sendThreadDuration(widget.thread, duration);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      if (_startTime != null) {
        updateDuration();
      }
    }

    if (state == AppLifecycleState.resumed) {
      _startTime ??= DateTime.now();
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (Get.isRegistered<NewsStoriesController>()) {
                Get.find<NewsStoriesController>()
                    .storiesPageController
                    .previousPage(
                        duration: 400.milliseconds, curve: Curves.ease);
                return;
              }
            },
            child: Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).disabledColor.withOpacity(0.1),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${LocaleKeys.previous.tr} ",
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Icon(
                      Bootstrap.box_arrow_in_up,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (Get.isRegistered<NewsStoriesController>()) {
                Get.find<NewsStoriesController>()
                    .storiesPageController
                    .nextPage(duration: 600.milliseconds, curve: Curves.ease);
                return;
              }
            },
            child: Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).disabledColor.withOpacity(0.1),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${LocaleKeys.next_news.tr} ",
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Icon(
                      Bootstrap.box_arrow_in_down,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: VisibilityDetector(
        onVisibilityChanged: (info) {
          if (info.visibleFraction == 1) {
            // print("percentage:${info.visibleFraction}");
            _startTime ??= DateTime.now();
            // print("News start:${widget.news.id}");
          }

          if (info.visibleFraction == 0.0 && _startTime != null) {
            updateDuration();
          }
        },
        key: Key(widget.thread.id),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: widget.thread.backgroundImgUrl == null
              ? null
              : BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        widget.thread.backgroundImgUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                final title = getCurrentFact()?.titleHeader;
                if (title != null && title.isNotEmpty) {
                  return Material(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        title,
                        style: Get.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return const SizedBox();
              }),
              const SizedBox(
                height: 10,
              ),
              AspectRatio(
                aspectRatio: 1,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentIndex.value = value;
                  },
                  itemCount: widget.thread.facts.length,
                  itemBuilder: (context, index) =>
                      FactCard(fact: widget.thread.facts[index]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.thread.facts.length > 1)
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.thread.facts.mapIndexed((i, e) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(Icons.circle_outlined),
                          if (currentIndex.value == i)
                            const Icon(
                              Icons.circle,
                              size: 16,
                            )
                        ],
                      );
                    }).toList(),
                  );
                }),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                final title = getCurrentFact()?.titleFooter;
                if (title != null && title.isNotEmpty) {
                  return Material(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        title,
                        style: Get.textTheme.headlineLarge,
                      ),
                    ),
                  );
                }

                return const SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class FactCard extends StatelessWidget {
  final Fact fact;

  const FactCard({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: fact.imgUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
