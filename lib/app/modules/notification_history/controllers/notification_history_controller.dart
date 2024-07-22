import 'package:get/get.dart';
import 'package:news_shots_app/app/data/models/notification_logs/notification_log.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

class NotificationHistoryController extends GetxController {
  final NewsServices _newsServices;
  final notificationLogs = <NotificationLogs>[].obs;

  NotificationHistoryController(this._newsServices);
  final isLoading = false.obs;
  final searchString = "".obs;

  @override
  void onInit() {
    fetchNotificationHistories();

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

  fetchNotificationHistories() async {
    isLoading.value = true;
    await _newsServices.fetchNotificationHistory().then((value) {
      value.fold((l) => null, (r) {
        notificationLogs.value = r;
      });
    });
    isLoading.value = false;
  }
}
