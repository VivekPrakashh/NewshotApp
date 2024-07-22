import 'package:get/get.dart';

class HomeController extends GetxController {
  // final PageController homePageController = PageController(initialPage: 1);
  // final PageController storiesPageController = PageController();

  // final NewsServices _newsServices;
  // final news = <News>[].obs;
  // final currentNewsIndex = 0.obs;
  // final showAppBar = false.obs;
  // final toggleBookmark = false.obs;

  // HomeController(this._newsServices);

  // bool get hasSourceOfCurrentNews {
  //   return news.isNotEmpty && news[currentNewsIndex.value].url != null;
  // }

  // void _handleMessage(RemoteMessage message) {
  //   final newsObj = jsonDecode(message.data['news']);
  //   final initialNews = News.fromJson(newsObj);

  //   news.insert(currentNewsIndex.value, initialNews);
  // }

  // @override
  // Future<void> onInit() async {
  //   // webViewController
  //   final RemoteMessage? message =
  //       await FirebaseMessaging.instance.getInitialMessage();

  //   if (message != null) {
  //     print("initial message getInitialMessage");

  //     _handleMessage(message);
  //   }

  //   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

  //   // if (Get.arguments is News) {
  //   //   news.insert(currentNewsIndex.value, Get.arguments as News);
  //   //   if (hasSourceOfCurrentNews) {
  //   //     // webViewController
  //   //     //     .loadRequest(Uri.parse(news[currentNewsIndex.value].url!));
  //   //   }
  //   // }

  //   _newsServices.fetchNews(cacheRequest: false).then((value) {
  //     news.value = [...news, ...value];
  //   });
  //   super.onInit();
  // }

  // Future<void> fetchNews() async {
  //   news.value = [];
  //   await _newsServices.fetchNews(cacheRequest: false).then((value) {
  //     news.value = [...value];
  //   });
  // }

  // onStoryChange(int index) {
  //   currentNewsIndex.value = index;
  //   if (hasSourceOfCurrentNews) {
  //     // webViewController
  //     //     .loadRequest(Uri.parse(news[currentNewsIndex.value].url!));
  //     // webViewController?.loadUrl(
  //     //     urlRequest:
  //     //         URLRequest(url: Uri.parse(news[currentNewsIndex.value].url!)));
  //   }
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
