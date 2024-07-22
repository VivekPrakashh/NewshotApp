import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/models/notification_logs/notification_log.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/image_loader.dart';
import '../../../data/services/news_services.dart';
import '../../../routes/app_pages.dart';
import '../../news_stories/ui_states/news_or_thread.dart';
import '../controllers/notification_history_controller.dart';

class NotificationHistoryView extends GetView<NotificationHistoryController> {
  const NotificationHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.notification_history.tr),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 5),
            child: TextFormField(
              onChanged: (value) {
                controller.searchString.value = value;
              },
              style: const TextStyle(
                fontSize: 14.5,
              ),
              decoration: const InputDecoration(
                // filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                isDense: true,
                suffixIcon: Icon(
                  Icons.search,
                  size: 24,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                hintText: "Search...",
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        // ignore: invalid_use_of_protected_member
        final logs = controller.notificationLogs.value
            .where((p0) => p0.article.notificationTitle
                .toLowerCase()
                .contains(controller.searchString.toLowerCase()))
            .toList();

        return controller.isLoading.value
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please Wait!!\n"),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  return NotificationLogItem(
                    notificationLog: logs[index],
                  );
                },
              );
      }),
    );
  }
}

class NotificationLogItem extends StatelessWidget {
  final NotificationLogs notificationLog;
  const NotificationLogItem({
    super.key,
    required this.notificationLog,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.getAppTextScaleFactor.when(
            small: () => 90,
            normal: () => 106,
            large: () => Get.locale!.isEnglish() ? 120 : 132),
        child: InkWell(
          onTap: () async {
            FocusScope.of(context).unfocus();

            await notificationItemClick();
          },
          child: Card(
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: ImageLoader(
                      url: notificationLog.article.urlToImage,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (notificationLog.article.category != null)
                        Text(
                          notificationLog.article.category!,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.locale!.isEnglish() ? 13 : 15,
                          ),
                        ),
                      Text(
                        notificationLog.article.notificationTitle.trim(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Get.locale!.isEnglish() ? 13 : 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ).paddingSymmetric(vertical: 5, horizontal: 4),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> notificationItemClick() async {
    EasyLoading.show(status: "Loading...");
    final news = await Get.find<NewsServices>().getNewsByIds(ids: [
      notificationLog.article.id
    ]).then((value) => value.fold((l) {
          l.maybeMap(
            orElse: () {
              Get.snackbar("Unable to load! Please Try again Later", "",
                  duration: 6.seconds,
                  icon: const Icon(Icons.error),
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
        }, (r) => r.first));
    EasyLoading.dismiss();

    if (news != null) {
      Get.toNamed(Routes.NEWS_STORIES,
          arguments: NewsOrThread.news(news: news));
    }
  }
}
