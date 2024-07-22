import 'package:get/get.dart';

import '../controllers/news_source_controller.dart';

class NewsSourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsSourceController>(
      () => NewsSourceController(Get.find()),
    );
  }
}
