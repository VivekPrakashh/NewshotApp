import 'package:get/get.dart';
import 'package:news_shots_app/app/data/models/news/topic.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

import '../../../data/models/news/news.dart';

class TopicsController extends GetxController {
  final List<Topic> topics = Get.arguments;
  final NewsServices _newsServices;

  TopicsController(this._newsServices);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<News>> loadTopics(int index, int limit) {
    return _newsServices
        .fetchNewsByTopic(topic: topics[index], limit: limit)
        .then((value) => value.fold(
              (l) => [],
              (r) => r,
            ));
  }
}
