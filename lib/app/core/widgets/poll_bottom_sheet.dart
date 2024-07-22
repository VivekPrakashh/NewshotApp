import 'dart:math';
import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/widgets/poll_share_widget.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../generated/locales.g.dart';
import '../../data/core/analytics_custom_event.dart';
import '../../data/db/database.dart';
import '../../data/models/news/news.dart';
import '../../data/services/dynamic_link_services.dart';
import 'form_helper.dart';

class PollBottomSheet extends StatefulWidget {
  final News news;

  const PollBottomSheet({
    super.key,
    required this.news,
  });

  @override
  State<PollBottomSheet> createState() => _PollBottomSheetState();
}

class _PollBottomSheetState extends State<PollBottomSheet> {
  bool hasAnswer = false;
  // final pollResult = Rxn<Map<String, int>>();
  final poll = Rxn<Poll>();

  onAnswerPoll(String answer) {
    try {
      final db = Get.find<AppLocalDB>().newsLogsDao;
      db.setPollAnswer(newsId: widget.news.id!, answer: answer);

      Get.find<NewsServices>()
          .sendPollAnswer(widget.news.poll!, answer)
          .then((value) {
        value.fold((l) {
          l.maybeMap(
            orElse: () {
              Get.snackbar("Something Wrong!! Try Again Later", "",
                  duration: 6.seconds,
                  icon: const Icon(Icons.warning),
                  backgroundColor: const Color.fromARGB(184, 255, 177, 171),
                  snackPosition: SnackPosition.BOTTOM,
                  messageText: const SizedBox());
            },
            noInternet: (value) {
              Get.snackbar(
                "Network Error",
                "Your Internet Is Not Working",
                duration: 6.seconds,
                icon: const Icon(Icons.error),
                backgroundColor: const Color.fromARGB(184, 255, 177, 171),
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          );
        }, (r) {
          poll.value = r;
          // pollResult.value = r.results;
        });
      });
      Get.find<FirebaseAnalytics>()
          .logEvent(name: AnalyticsCustomEvent.poll_answered.name, parameters: {
        "news_id": widget.news.id ?? "No Ids",
        "news_title": widget.news.title
            .substring(0, min(38, (widget.news.title.length - 1))),
        "category": widget.news.category?.name ?? "",
      });
    } on Exception catch (e, s) {
      Get.snackbar("Something Wrong!! Try Again Later", "",
          duration: 6.seconds,
          icon: const Icon(Icons.error),
          backgroundColor: const Color.fromARGB(184, 255, 177, 171),
          snackPosition: SnackPosition.BOTTOM,
          messageText: const SizedBox());
      Get.find<Logger>().e("Error on Answer Poll", error: e, stackTrace: s);
    }
  }

  Future<void> sharePollResult() async {
    final image = await ScreenshotController.widgetToUiImage(
      PollShareWidget(
        poll: poll.value!,
        news: widget.news,
      ),
      targetSize: Size(Get.size.width, Get.size.height * 0.8),
      context: context,
    );
    final newsShareLink =
        await DynamicLinkServices.createNewsShareLink(widget.news.id!);

    final png = await image.toByteData(format: ImageByteFormat.png);

    Uint8List pngBytes = png!.buffer.asUint8List();

    final file =
        XFile.fromData(pngBytes, name: "test.png", mimeType: "image/png");
    Share.shareXFiles([file],
        text: "Shared via Reveal Inside\nSee here: $newsShareLink");
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.poll_shared.name, parameters: {
      "news_id": widget.news.id ?? 'No Ids',
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });
  }

  @override
  void initState() {
    Get.find<AppLocalDB>()
        .newsLogsDao
        .getPollAnswerFuture(newsId: widget.news.id!)
        .then((value) {
      if (value != null) {
        Get.find<NewsServices>()
            .getNewsByIds(ids: [widget.news.id!]).then((value) {
          value.fold((l) => null, (r) {
            return {
              if (r.isNotEmpty)
                {
                  poll.value = r.first.poll
                  // pollResult.value = r.first.poll?.results,
                }
            };
          });
        });
      }
    });
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.poll_open.name, parameters: {
      "news_id": widget.news.id ?? "No Ids",
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.news.poll);
    // final options =
    //     widget.news.poll!.results.entries.map((e) => e.key).toList();

    return WillPopScope(
      onWillPop: () {
        Get.back(
          result: hasAnswer,
        );
        return Future.value(false);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).cardColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                backgroundColor: Theme.of(context).cardColor,
                automaticallyImplyLeading: false,
                actions: [
                  FormHelper.iconButton(
                    onTap: () {
                      Get.back(result: hasAnswer);
                    },
                    icon: Icons.close,
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      widget.news.poll!.question.capitalize!.trim(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    StreamBuilder<String?>(
                        stream: Get.find<AppLocalDB>()
                            .newsLogsDao
                            .getPollAnswer(newsId: widget.news.id!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final answer = snapshot.data;
                            if (answer != null) {
                              hasAnswer = true;
                            }
                            return Material(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  side: BorderSide(
                                    color: Colors.blueGrey.shade600,
                                  )),
                              // elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 15, left: 15, right: 15),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (poll.value != null) {
                                          sharePollResult();
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.share),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              LocaleKeys.share_poll.tr,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Material(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(14)),
                                      child: Obx(() {
                                        // final total = poll.value?.results.values
                                        //     .fold(
                                        //         0,
                                        //         (previousValue, element) =>
                                        //             previousValue + element);
                                        return poll.value == null
                                            ? const Center(
                                                child: Text("Fetching results"),
                                              )
                                            : Column(
                                                children: [
                                                  PollOptionsWidget(
                                                    answer: answer,
                                                    poll: poll.value!,
                                                    isFirst: true,
                                                  ),
                                                  PollOptionsWidget(
                                                    answer: answer,
                                                    poll: poll.value!,
                                                    isFirst: false,
                                                  ),
                                                  // Align(
                                                  //   alignment:
                                                  //       Alignment.centerRight,
                                                  //   child: Text(
                                                  //       "${LocaleKeys.total_votes.tr}:$total",
                                                  //       style: Get
                                                  //           .textTheme.bodyLarge),
                                                  // )
                                                ],
                                              );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().fadeIn();
                          } else {
                            return Column(
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      onAnswerPoll('yes');
                                    },
                                    child: Text(
                                      widget.news.poll!.yesOption.trim(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      onAnswerPoll('no');
                                    },
                                    child: Text(
                                      widget.news.poll!.noOption.trim(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PollOptionsWidget extends StatelessWidget {
  final bool isFirst;
  const PollOptionsWidget({
    super.key,
    required this.answer,
    required this.poll,
    required this.isFirst,
  });

  final String? answer;
  final Poll poll;

  @override
  Widget build(BuildContext context) {
    final total = (poll.results.values
            .fold(0, (previousValue, element) => previousValue + element)) +
        10;
    final percentage =
        ((((((isFirst ? poll.results.values.first : poll.results.values.last)) +
                        5) *
                    100) /
                total))
            .round();

    // final percentage = 56;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              14,
            ),
            side: BorderSide(
              color: answer ==
                      (isFirst
                          ? poll.results.keys.first
                          : poll.results.keys.last)
                  ? Colors.green
                  : Get.theme.highlightColor,
              width: 1.5,
            )),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            LinearProgressIndicator(
              color: answer ==
                      (isFirst
                          ? poll.results.keys.first
                          : poll.results.keys.last)
                  ? Colors.green.withOpacity(0.4)
                  : Get.isDarkMode
                      ? AppColors.cardDark
                      : AppColors.card,
              value: percentage / 100,
              minHeight: kMinInteractiveDimension,
            ),
            SizedBox(
              height: kMinInteractiveDimension,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.bar_chart,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                            "${(isFirst ? poll.yesOption : poll.noOption).capitalize}")),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("${percentage.round()}%")
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: kMinInteractiveDimension,
            //   child: ListTile(
            //     dense: true,
            //     leading: const Icon(
            //       Icons.bar_chart,
            //     ),
            //     trailing: Text("$percentage%"),
            //     title: Text(
            //       "${(isFirst ? poll.yesOption : poll.noOption).capitalize}",
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

List<Widget> addItemsBetweenElements(List<Widget> list, Widget item) {
  if (list.isEmpty) return list;

  List<Widget> result = [];
  for (int i = 0; i < list.length - 1; i++) {
    result.addAll([list[i], item]);
  }
  result.add(list.last);
  return result;
}
