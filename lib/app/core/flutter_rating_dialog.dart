import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/local_session/local_session.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key});
  // final currentRating = 4.0.obs;

  // getCurrentIcon() {
  //   switch (currentRating.value) {
  //     case 1:
  //       return Icons.sentiment_very_dissatisfied;
  //     case 2:
  //       return Icons.sentiment_dissatisfied;
  //     case 3:
  //       return Icons.sentiment_neutral;
  //     case 4:
  //       return Icons.sentiment_satisfied;
  //     case 5:
  //       return Icons.sentiment_very_satisfied;

  //     default:
  //       return Icons.sentiment_very_satisfied;
  //   }
  // }

  handleDoNotShowAgain() async {
    // await sharedPreferences?.setBool(
    //     SharedPreferanceConstants.ratingDialogKey, true);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                  width: 50,
                  height: 40,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close)))),

          // Lottie.asset(Assets.lottie.rating, height: 200),
          Lottie.asset(Assets.lottie.star, height: 50),
          const SizedBox(
            height: 5,
          ),

          const Text(
            "Please Take A Moment\nTo Rate Us 😊",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Thank You",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onSelected: (value) {
                      Get.find<AppLocalDB>()
                          .localSessionsDao
                          .setRatingReminder(value == 0
                              ? RatingReminder.nextTwoDay
                              : value == 1
                                  ? RatingReminder.nextWeek
                                  : RatingReminder.never);
                      Get.back();
                    },
                    position: PopupMenuPosition.under,
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Center(child: Text("In 2 Days")),
                      ),
                      const PopupMenuItem(
                          value: 1, child: Center(child: Text("Next Week"))),
                      const PopupMenuItem(
                          value: 2, child: Center(child: Text("Next Century"))),
                    ],
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      child: Text(
                        "Remind Me",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.colorScheme.primary,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: () {
                      InAppReview.instance
                          .openStoreListing(appStoreId: 'com.revealInside');
                    },
                    child: const Text("Now"),
                  ),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Get.find<AppLocalDB>()
                    .localSessionsDao
                    .setRatingReminder(RatingReminder.never);
              },
              child: const Text("Don't Show Again")),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
