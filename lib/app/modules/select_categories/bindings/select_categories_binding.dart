import 'package:get/get.dart';

import '../controllers/select_categories_controller.dart';

class SelectCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCategoriesController>(
      () => SelectCategoriesController(),
    );
  }
}
