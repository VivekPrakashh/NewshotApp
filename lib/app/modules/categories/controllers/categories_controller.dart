import 'package:get/get.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';

import '../../../data/models/news/news.dart';
import '../../../data/services/news_services.dart';

class CategoriesController extends GetxController {
  final List<Category> categories = Get.arguments;
  final NewsServices _newsServices;

  CategoriesController(this._newsServices);

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

  Future<List<News>> loadNewsByCategory(int index, int limit) {
    return _newsServices
        .fetchNewsByCategory(category: categories[index], limit: limit)
        .then((value) => value.fold(
              (l) => [],
              (r) => r,
            ));
  }
}
