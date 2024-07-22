import 'package:get/get.dart';
import 'package:news_shots_app/adview.dart';

import '../modules/bookmarks/bindings/bookmarks_binding.dart';
import '../modules/bookmarks/views/bookmarks_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/debug/bindings/debug_binding.dart';
import '../modules/debug/views/debug_view.dart';
import '../modules/demo/bindings/demo_binding.dart';
import '../modules/demo/views/demo_view.dart';
import '../modules/discovery/bindings/discovery_binding.dart';
import '../modules/discovery/views/discovery_view.dart';
import '../modules/get_started/bindings/get_started_binding.dart';
import '../modules/get_started/views/get_started_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image_preview/bindings/image_preview_binding.dart';
import '../modules/image_preview/views/image_preview_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/news_details/bindings/news_details_binding.dart';
import '../modules/news_details/views/news_details_view.dart';
import '../modules/news_source/bindings/news_source_binding.dart';
import '../modules/news_source/views/news_source_view.dart';
import '../modules/news_stories/bindings/news_stories_binding.dart';
import '../modules/news_stories/views/news_stories_view.dart';
import '../modules/notification_history/bindings/notification_history_binding.dart';
import '../modules/notification_history/views/notification_history_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/select_categories/bindings/select_categories_binding.dart';
import '../modules/select_categories/views/select_categories_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/topic_news/bindings/topic_news_binding.dart';
import '../modules/topic_news/views/topic_news_view.dart';
import '../modules/topics/bindings/topics_binding.dart';
import '../modules/topics/views/topics_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AD_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      popGesture: false,
    ),
    GetPage(
      name: _Paths.NEWS_SOURCE,
      page: () => const NewsSourceView(),
      binding: NewsSourceBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.DISCOVERY,
      page: () => const DiscoveryView(),
      binding: DiscoveryBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_STORIES,
      page: () => const NewsStoriesView(),
      binding: NewsStoriesBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARKS,
      page: () => const BookmarksView(),
      binding: BookmarksBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => const NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.TOPICS,
      page: () => const TopicsView(),
      binding: TopicsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_PREVIEW,
      page: () => const ImagePreviewView(),
      binding: ImagePreviewBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.TOPIC_NEWS,
      page: () => const TopicNewsView(),
      binding: TopicNewsBinding(),
      maintainState: false,
    ),
    GetPage(
      name: _Paths.DEMO,
      page: () => const DemoView(),
      binding: DemoBinding(),
    ),
    GetPage(
      name: _Paths.DEBUG,
      page: () => const DebugView(),
      binding: DebugBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_HISTORY,
      page: () => const NotificationHistoryView(),
      binding: NotificationHistoryBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_CATEGORIES,
      page: () => const SelectCategoriesView(),
      binding: SelectCategoriesBinding(),
    ),
     GetPage(
      name: _Paths.AD_VIEW,
      page: () => const Adview(),
     
    ),
  ];
}
