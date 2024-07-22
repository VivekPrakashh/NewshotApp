// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_shots_app/app/data/models/news/category.dart';
// import 'package:news_shots_app/app/data/models/news/news.dart';
// import 'package:news_shots_app/app/data/services/news_services.dart';

// import '../uistate/news_with_loading.dart';

// class DiscoveryPageController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   final breakingNews = <News>[].obs;
//   final categories = <Category>[].obs;
//   final isLoading = false.obs;
//   final newsByCategoryMap = Rx<Map<int, NewsWithLoading>>({});
//   final NewsServices _newsServices;
//   final currentPage = 0.obs;

//   final PageController contentPageController = PageController();
//   late final TabController tabController;
//   bool isTabInit = false;

//   DiscoveryPageController(this._newsServices);

//   @override
//   void onInit() {
//     // _newsServices.fetchBreakingNews().then((value) {
//     //   value.fold((l) {}, (r) {
//     //     breakingNews.value = r;
//     //   });
//     // });

//     _newsServices.fetchCategories().then(
//       (value) {
//         value.fold((l) {}, (r) {
//           categories.value = r;
//           if (r.isNotEmpty) {
//             newsByCategoryMap.value = {
//               ...newsByCategoryMap.value,
//               0: const NewsWithLoading()
//             };
//             _newsServices.fetchNewsByCategory(category: r.first).then((value) {
//               value.fold((l) => null, (r) {
//                 // print(r);
//                 newsByCategoryMap.value = {
//                   ...newsByCategoryMap.value,
//                   0: NewsWithLoading(news: r, isLoading: false)
//                 };
//               });
//             });
//           }
//         });
//       },
//     );
//     super.onInit();
//   }

//   fetchNewsByCategory(
//     int index,
//   ) {
//     if (categories.isNotEmpty) {
//       newsByCategoryMap.value = {
//         ...newsByCategoryMap.value,
//         index: const NewsWithLoading()
//       };

//       _newsServices
//           .fetchNewsByCategory(category: categories[index])
//           .then((value) {
//         value.fold((l) => null, (r) {
//           // print(r);
//           newsByCategoryMap.value = {
//             ...newsByCategoryMap.value,
//             index: NewsWithLoading(isLoading: false, news: r)
//           };
//         });
//       });
//     }
//   }

//   Future<void> reFetch() async {
//     breakingNews.value = [];
//     // await _newsServices.fetchBreakingNews().then((value) {
//     //   value.fold((l) {}, (r) {
//     //     breakingNews.value = r;
//     //   });
//     // });
//     fetchNewsByCategory(contentPageController.page?.toInt() ?? 0);
//   }

//   initTabController(int itemCount) {
//     if (!isTabInit) {
//       tabController = TabController(length: itemCount, vsync: this);

//       tabController.addListener(() {
//         currentPage.value = tabController.index;
//       });
//       isTabInit = true;
//     }
//   }
// }
