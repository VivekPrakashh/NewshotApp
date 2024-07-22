import 'package:get/get.dart';

import '../controllers/notification_history_controller.dart';

class NotificationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationHistoryController>(
      () => NotificationHistoryController(Get.find()),
    );
  }
}
