import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/topics_controller.dart';

class TopicsView extends GetView<TopicsController> {
  const TopicsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_all_topics.tr),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: controller.topics.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () {
              // Get.toNamed(
              //   Routes.NEWS_DETAILS,
              //   arguments: NewsDetailsArguments(
              //     news: [],
              //     currentIndex: 0,
              //     onLoad: (count) {
              //       return controller.loadTopics(index, count);
              //     },
              //   ),
              // );
            },
            title: Text(
              controller.topics[index].name,
            ),
          ),
        ),
      ),
    );
  }
}
