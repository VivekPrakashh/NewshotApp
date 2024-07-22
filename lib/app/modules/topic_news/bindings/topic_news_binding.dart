import 'package:get/get.dart';

import '../controllers/topic_news_controller.dart';

class TopicNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicNewsController>(
      () => TopicNewsController(Get.find(), Get.find()),
    );
  }
}
