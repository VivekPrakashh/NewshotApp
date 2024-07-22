import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/flutter_rating_dialog.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

import '../../../../generated/locales.g.dart';
import '../../../controller/time_tracking_controller.dart';
import '../../../core/colors.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/models/news/news.dart';
import '../../../data/models/quiz/quiz.dart';

class QuizPage extends StatefulWidget {
  final News news;
  const QuizPage({super.key, required this.news});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final currentQuestionIndex = 0.obs;
  final isLoading = false.obs;

  final respondedAnswer = <String>[].obs;
  List<Quiz> questions = [];
  final correctOrWrongEmoji = Rxn<Widget>();
  bool isSecondLastCorrent = false;
  bool shouldShowRatingDialog = false;
  DateTime? _startTime;
  @override
  void initState() {
    Get.find<FirebaseAnalytics>()
        .logEvent(name: AnalyticsCustomEvent.quiz_open.name, parameters: {
      "news_id": widget.news.id ?? "no id",
      "news_title": widget.news.title
          .substring(0, min(38, (widget.news.title.length - 1))),
      "category": widget.news.category?.name ?? "",
    });
    fetchQuiz();
    fetchRatingReminder();
    super.initState();
  }

  fetchRatingReminder() {
    Get.find<AppLocalDB>()
        .localSessionsDao
        .shouldShowRatingDialog()
        .then((value) {
      shouldShowRatingDialog = value;
    });
  }

  fetchQuiz() async {
    isLoading.value = true;
    await Get.find<NewsServices>()
        .fetchQuiz(newsId: widget.news.id!)
        .then((value) {
      value.fold((l) {
        l.maybeMap(
          orElse: () {
            Get.snackbar("Unable to fetch Quiz. Try Again Later", "",
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
        questions = r.$1;
        printInfo(info: questions.map((e) => e.correctOption).toString());
        final questionResponse = r.$2;
        for (var quiz in questions) {
          final hasResponse = questionResponse
              .firstWhereOrNull((element) => element.quiz == quiz.id);

          if (hasResponse != null) {
            respondedAnswer.add(hasResponse.answer);
          }
        }
        if (respondedAnswer.isNotEmpty) {
          if (respondedAnswer.length < questions.length) {
            currentQuestionIndex.value = respondedAnswer.length;
          }
        }
      });
    });
    isLoading.value = false;
  }

  handleSubmit(Quiz quiz, String answer) {
    if (answer == quiz.correctOption) {
      if (isSecondLastCorrent &&
          (questions.indexOf(quiz) == questions.length - 1)) {
        if (shouldShowRatingDialog) {
          Future.delayed(
            3.seconds,
            () {
              Get.dialog(const RatingDialog());
            },
          );
        }
      }

      if (questions.indexOf(quiz) == questions.length - 2) {
        isSecondLastCorrent = true;
      }
      playSuccessEmoji();
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.quiz_answer_correct.name,
          parameters: {
            "news_id": widget.news.id ?? "no id",
            "news_title": widget.news.title
                .substring(0, min(38, (widget.news.title.length - 1))),
            "category": widget.news.category?.name ?? "",
            "quiz":
                quiz.question.substring(0, min(38, (quiz.question.length - 1)))
          });
    } else {
      playWrongEmoji();
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.quiz_answer_wrong.name,
          parameters: {
            "news_id": widget.news.id ?? "no id",
            "news_title": widget.news.title
                .substring(0, min(38, (widget.news.title.length - 1))),
            "category": widget.news.category?.name ?? "",
            "quiz":
                quiz.question.substring(0, min(38, (quiz.question.length - 1))),
            "optionResponded": answer
          });
    }
    Get.find<NewsServices>().sendQuizResponse(quizId: quiz.id, option: answer);
  }

  playSuccessEmoji() {
    // playWrongEmoji();
    // return;
    final rightanimations = [
      Assets.lottie.rightEmoji,
      Assets.lottie.success1,
      Assets.lottie.success2,
      Assets.lottie.success3,
      Assets.lottie.success4,
      Assets.lottie.success5,
      // Assets.lottie.success6,
      Assets.lottie.success7,
      Assets.lottie.success8,
      Assets.lottie.success9,
      Assets.lottie.success10,
      // Assets.lottie.success11,
      Assets.lottie.success12,
      // Assets.lottie.success13,
      Assets.lottie.success14,
    ];

    rightanimations.shuffle();

    final successAnimation = SizedBox(
      child: SizedBox(
              child: Center(
                  child:
                      Lottie.asset(rightanimations.first, fit: BoxFit.contain)))
          .animate()
          .fadeIn()
          .slideY(
              begin: 1, end: 0, duration: 600.ms, curve: Curves.fastOutSlowIn)
          .then(delay: 2500.ms)
          .fadeOut()
          .slideY(begin: 0, end: 1, curve: Curves.bounceOut),
    ).animate();
    correctOrWrongEmoji.value = successAnimation;
    final oldIndex = currentQuestionIndex.value;
    Future.delayed(NumDurationExtensions(4).seconds, () {
      correctOrWrongEmoji.value = null;
      if (oldIndex != currentQuestionIndex.value) return;
      if ((((respondedAnswer.length - 1) >= currentQuestionIndex.value) &&
          currentQuestionIndex < questions.length - 1)) {
        currentQuestionIndex.value = currentQuestionIndex.value + 1;
      }
    });
  }

  playWrongEmoji() {
    final oldIndex = currentQuestionIndex.value;
    Future.delayed(NumDurationExtensions(3).seconds, () {
      // correctOrWrongEmoji.value = null;
      if (oldIndex != currentQuestionIndex.value) return;
      if ((((respondedAnswer.length - 1) >= currentQuestionIndex.value) &&
          currentQuestionIndex < questions.length - 1)) {
        currentQuestionIndex.value = currentQuestionIndex.value + 1;
      }
    });
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused ||
  //       state == AppLifecycleState.inactive) {
  //     if (_startTime != null) {
  //       // updateDuration();
  //       Get.find<TimeTrackController>(tag: widget.news.id).setTimeSpendInQuiz =
  //           DateTime.now().difference(_startTime!).inSeconds;
  //       _startTime = null;
  //       print("didChangeAppLifecycleState delete TimeTrackController");
  //       Get.delete<TimeTrackController>(tag: widget.news.id, force: true);
  //     }
  //   }

  //   if (state == AppLifecycleState.resumed) {
  //     _startTime ??= DateTime.now();
  //     if (!Get.isRegistered<TimeTrackController>(tag: widget.news.id)) {
  //       Get.put(TimeTrackController(news: widget.news),
  //           tag: widget.news.id, permanent: true);
  //     }
  //   }
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  void dispose() {
    if (_startTime != null) {
      final duration = DateTime.now().difference(_startTime!).inSeconds;
      Get.find<TimeTrackController>(tag: widget.news.id).setTimeSpendInQuiz =
          duration;
      // Get.find<FirebaseAnalytics>()
      //     .logEvent(name: AnalyticsCustomEvent.quiz_close.name, parameters: {
      //   "news_id": widget.news.id,
      //   "news_title": widget.news.title
      //       .substring(0, min(38, (widget.news.title.length - 1))),
      //   "category": widget.news.category?.name ?? "",
      //   "duartion": duration,
      // });
      _startTime = null;
    }
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.title_quiz.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Obx(() {
          return isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : questions.isEmpty
                  ? const Center(
                      child: Text("No Quiz found!!"),
                    )
                  : Column(
                      children: [
                        QuestionProgress(
                          currentQuestionIndex: respondedAnswer.length - 1,
                          questionsCount: questions.length,
                        ),
                        QuestionsBullets(
                          onBulletClick: (index) {
                            // print((respondedAnswer.length - 1) >= index);
                            if ((respondedAnswer.length - 1) >= index) {
                              currentQuestionIndex.value = index;
                            }
                          },
                          currentQuestionIndex: currentQuestionIndex.value,
                          questionsCount: questions.length,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              AnimatedSwitcher(
                                duration: 600.ms,
                                // switchInCurve: Curves.easeInOutQuad,
                                // transitionBuilder: (Widget child,
                                //     Animation<double> animation) {
                                //   final offsetAnimation = Tween<Offset>(
                                //     begin: const Offset(0.0, 1.0),
                                //     end: const Offset(0.0, 0.0),
                                //   ).animate(animation);
                                //   return SlideTransition(
                                //       position: offsetAnimation, child: child);
                                // },

                                // transitionBuilder: (child, animation) => SlideTransition(position: position),
                                child: Question(
                                  key: Key(
                                      currentQuestionIndex.value.toString()),
                                  isLastQuestion: questions.length - 1 ==
                                      currentQuestionIndex.value,
                                  question:
                                      questions[currentQuestionIndex.value],
                                  respondedAnswer:
                                      (respondedAnswer.length - 1) >=
                                              currentQuestionIndex.value
                                          ? respondedAnswer[
                                              currentQuestionIndex.value]
                                          : null,
                                  handleSubmit: (value) {
                                    respondedAnswer.add(value);
                                    handleSubmit(
                                        questions[currentQuestionIndex.value],
                                        value);
                                  },
                                  handleNext: () {
                                    if ((currentQuestionIndex <
                                            questions.length - 1) &&
                                        (respondedAnswer.length - 1) >=
                                            currentQuestionIndex.value) {
                                      correctOrWrongEmoji.value = null;

                                      currentQuestionIndex.value =
                                          currentQuestionIndex.value + 1;
                                    }
                                  },
                                  handleBack: currentQuestionIndex > 0
                                      ? () {
                                          correctOrWrongEmoji.value = null;
                                          // playSuccessEmoji();
                                          currentQuestionIndex.value =
                                              currentQuestionIndex.value - 1;
                                        }
                                      : null,
                                ),
                              ),
                              // if (correctOrWrongEmoji.value != null)
                              AnimatedSwitcher(
                                duration: 200.ms,
                                child: correctOrWrongEmoji.value != null
                                    ? correctOrWrongEmoji.value!
                                    : const SizedBox(),
                              )
                            ],
                          ),
                        )
                      ],
                    );
        }),
      ),
    );
  }
}

class QuestionProgress extends StatelessWidget {
  final int currentQuestionIndex;
  final int questionsCount;
  const QuestionProgress(
      {super.key,
      required this.currentQuestionIndex,
      required this.questionsCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${(currentQuestionIndex + 1)}/$questionsCount ${LocaleKeys.question.tr}",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                minHeight: 10,
                value: (currentQuestionIndex + 1) / questionsCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionsBullets extends StatelessWidget {
  final int currentQuestionIndex;
  final int questionsCount;
  final Function(int index) onBulletClick;
  const QuestionsBullets({
    super.key,
    required this.currentQuestionIndex,
    required this.questionsCount,
    required this.onBulletClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            questionsCount,
            (index) {
              final isActive = index == currentQuestionIndex;
              return InkWell(
                onTap: () => onBulletClick(index),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isActive
                          ? Get.theme.colorScheme.primary
                          : Get.theme.colorScheme.surfaceVariant,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 194, 193, 193),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: isActive
                            ? Theme.of(context).colorScheme.inversePrimary
                            : null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  final Quiz question;
  final Function(String response) handleSubmit;
  final VoidCallback handleNext;
  final VoidCallback? handleBack;
  final String? respondedAnswer;
  final bool isLastQuestion;

  const Question(
      {super.key,
      required this.question,
      required this.handleSubmit,
      this.respondedAnswer,
      required this.handleNext,
      this.handleBack,
      required this.isLastQuestion});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // late int correctAnswerIndex;
  // List<String> options = [];
  Map<String, String?> optionsMap = {};
  // late final bool hasResponded;

  // final groupValue = Rxn<String>();
  @override
  void initState() {
    optionsMap = widget.question.getAllOptionsMap();
    super.initState();
  }

  Color? getTileColor(String key) {
    return widget.respondedAnswer != null
        ? widget.question.correctOption == key
            ? Colors.green
            : widget.respondedAnswer == key
                ? Colors.red
                : null
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final hasResponded = widget.respondedAnswer != null;
    if (hasResponded) {
      // groupValue.value = null;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Flexible(
            child: AutoSizeText(
              widget.question.question.trim(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...optionsMap.entries.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Get.theme.colorScheme.primary,
                      )),
                  child: Material(
                    child: RadioListTile<String>(
                      dense: true,
                      // selected: groupValue.value == e.key,
                      onChanged: hasResponded
                          ? null
                          : (value) {
                              if (value != null) {
                                widget.handleSubmit.call((value));
                                // groupValue.value = value;
                              }
                            },
                      title: Text(
                        e.value!.trim(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: getTileColor(e.key) == null
                                ? null
                                : MaterialStateColor.resolveWith(
                                    (states) => AppColors.white)),
                      ),
                      value: e.key,
                      groupValue: null,
                      activeColor: AppColors.white,
                      tileColor: getTileColor(e.key),
                      selectedTileColor: Get.theme.primaryColor,

                      fillColor: getTileColor(e.key) == null
                          ? null
                          : MaterialStateColor.resolveWith(
                              (states) => AppColors.white),

                      // colo
                    ),
                  ),
                ),
              )),
          if (widget.isLastQuestion)
            Text(
              LocaleKeys.end_of_quiz.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              if (widget.handleBack != null)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 40),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: widget.handleBack,
                  child: const Text("Back"),
                ),
              const Spacer(),
              if ((hasResponded && !widget.isLastQuestion))
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 40),
                    backgroundColor:
                        hasResponded ? Colors.green : Get.theme.primaryColor,
                    foregroundColor: Get.theme.colorScheme.onPrimary,
                    // textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (hasResponded) {
                      widget.handleNext();
                    }
                  },
                  child:
                      hasResponded ? const Text("Next") : const Text("Submit"),
                ),
              if ((hasResponded && widget.isLastQuestion))
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.primaryColor,
                    foregroundColor: Get.theme.colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Go to News"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
