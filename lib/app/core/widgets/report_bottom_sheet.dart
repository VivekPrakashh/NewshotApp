import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

import '../../data/core/analytics_custom_event.dart';
import '../../modules/news_stories/ui_states/news_or_thread.dart';

class ReportBottomSheet extends StatefulWidget {
  final NewsOrThread newsOrThread;
  const ReportBottomSheet({
    super.key,
    required this.newsOrThread,
  });

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  final reportCategories = [
    "Wrong Information",
    "Hateful Comment",
    "Biased Story",
    "Copyright Violation",
    "Request a new Feature"
  ];
  final selectedCategory = RxnString();
  final comments = "".obs;

  sendReport() {
    Get.find<NewsServices>()
        .reportNewsOrThread(
            newsOrThread: widget.newsOrThread,
            reportReason: selectedCategory.value ?? "Other",
            comments: comments.value)
        .then((value) {
      Get.back();
      EasyLoading.showToast("Your report was sent successfully. Thank you.");
    });

    widget.newsOrThread.when(news: (news) {
      Get.find<FirebaseAnalytics>()
          .logEvent(name: AnalyticsCustomEvent.news_reported.name, parameters: {
        "news_id": news.id ?? "no id",
        "news_title": news.title.substring(0, min(38, (news.title.length - 1))),
        "category": news.category?.name ?? "",
        "reason": selectedCategory.value ?? "Other",
      });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.thread_reported.name,
          parameters: {
            "thread_id": thread.id,
            "thread_title": thread.contentTitle?.substring(
                    0, min(38, (thread.contentTitle?.length ?? 0 - 1))) ??
                "no title",
            "reason": selectedCategory.value ?? "Other",
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("Talk to us",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close,weight: 200,color: Get.isDarkMode ?Colors.grey.shade400 :Colors.black ,))
              ],
            ),
            const Divider(height: 0),
            Obx(() {
              selectedCategory.value;
              return ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: reportCategories.length,
                itemBuilder: (context, index) => RadioListTile<String>.adaptive(
                  dense: true,
                  value: reportCategories[index],
                  groupValue: selectedCategory.value,
                  onChanged: (value) {
                    selectedCategory.value = value;
                  },
                  title: Text(reportCategories[index],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        // fillColor: Theme.of(context).colorScheme.surfaceVariant,
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Type here...",
                        hintStyle: TextStyle(fontSize: 15,color:Colors.black),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        comments.value = value;
                      },
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                      // backgroundColor: Theme.of(context).primaryColor,
                      backgroundColor:  Get.isDarkMode ?Colors.grey.shade400 :Colors.black ,
                      foregroundColor: AppColors.white,
                      minimumSize: const Size.fromHeight(52),
                    ),
                    onPressed: () {
                      sendReport();
                    },
                    child:  Text("Let us know",
                     style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,
              color: Get.isDarkMode ?AppColors.background :AppColors.white  ,),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
