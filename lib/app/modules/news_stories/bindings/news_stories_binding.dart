import 'package:get/get.dart';

import '../controllers/news_stories_controller.dart';

class NewsStoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsStoriesController>(
      () => NewsStoriesController(Get.find(), Get.find()),
    );
  }
}
