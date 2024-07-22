import 'package:get/get.dart';

import '../controllers/topics_controller.dart';

class TopicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicsController>(
      () => TopicsController(Get.find()),
    );
  }
}
