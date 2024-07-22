import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:news_shots_app/generated/locales.g.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/services/news_services.dart';

class SelectCategoriesController extends GetxController {
  final NewsServices newsServices = Get.find<NewsServices>();
  final categories = <Category>[].obs;
  final selectedCategories = <Category>[].obs;
  // final selectedSubCategories = <SubCategory>{}.obs;
  // final pageController = PageController();

  @override
  void onInit() {
    // if (Get.arguments != null && Get.arguments is List<Category>) {
    //   selectedCategories.addAll(Get.arguments);
    // }

    _fetchCategories();
    super.onInit();
  }

  initialSelect(List<Category> categories) {
    if (Get.arguments != null && Get.arguments is List<Category>) {
      selectedCategories.addAll(categories.where((element) =>
          (Get.arguments as List<Category>)
              .any((cat) => cat.id == element.id)));
    } else {
      // selectedCategories.value = List.from(categories); // INFO: disable select all categories
    }
  }

  // computeSelectedSubCategories() {
  //   selectedSubCategories.clear();
  //   for (var element in selectedCategories) {
  //     selectedSubCategories.addAll(element.subcategories);
  //   }
  // }

  handleNext() async {
    // if (selectedSubCategories.length < 5) {
    //   EasyLoading.showToast(
    //     LocaleKeys.select_atleast_5_sub_category.tr,
    //     toastPosition: EasyLoadingToastPosition.bottom,
    //   );
    //   return;
    // }

    await Permission.notification.request();
    EasyLoading.show(
        status: "${LocaleKeys.setting_pref.tr}...",
        maskType: EasyLoadingMaskType.black);
    await newsServices.subscribeToCategory(selectedCategories.toList());

    EasyLoading.dismiss();

    EasyLoading.showToast(
      LocaleKeys.pref_set_message.tr,
      toastPosition: EasyLoadingToastPosition.bottom,
      duration: 8.seconds,
    );

    Get.back();
    if (Get.isRegistered<DiscoveryController>()) {
      Get.find<DiscoveryController>()
          .askForPreference(refetch: true)
          .then((value) {
        Get.find<DiscoveryController>().initialFetch(false);
      });
    }
    return;
  }

  selectAll() {
    selectedCategories.value = List.from(categories);
  }

  Future<void> _fetchCategories() async {
    await newsServices.fetchCategories().then(
      (value) async {
        await value.fold((l) {}, (r) async {
          if (r.isNotEmpty) {
            categories.value = r;
            initialSelect(categories);

            // if (selectedSubCategories.isNotEmpty) {
            //   selectedCategories.value = List.from(categories.where((element) =>
            //       selectedSubCategories
            //           .any((sub) => sub.parentCategory == element.id)));
            // }
          }
        });
      },
    );
  }
}
