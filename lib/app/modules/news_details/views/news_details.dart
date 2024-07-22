import 'dart:async';
import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/controller/time_tracking_controller.dart';
import 'package:news_shots_app/app/modules/news_details/controllers/news_details_controller.dart';
import 'package:news_shots_app/app/modules/news_details/views/embed_social.dart';
import 'package:news_shots_app/app/modules/news_stories/controllers/news_stories_controller.dart';
import 'package:news_shots_app/app/modules/topic_news/controllers/topic_news_controller.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/colors.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/db/database.dart';
import '../../../data/models/news/news.dart';
import 'tabs/faq_tab.dart';
import 'tabs/news_details_tab.dart';

class NewsDetails extends StatefulWidget {
  final News news;
  final List<Widget>? nextNews;
  final VoidCallback onInit;
  final VoidCallback onAddBookmark;
  final VoidCallback onRemoveBookmark;
  final VoidCallback onShareNewsClick;
  final Stream<NewsBookmark?> Function() getBookmarkStream;
  final bool showTopicButton;
  final String? hashtag;
  final bool hasPreviousNews;
  final bool hideNextPrevioudControl;

  const NewsDetails({
    super.key,
    required this.news,
    required this.onInit,
    required this.getBookmarkStream,
    required this.onAddBookmark,
    required this.onRemoveBookmark,
    this.showTopicButton = true,
    required this.onShareNewsClick,
    this.hashtag,
    required this.hasPreviousNews,
    this.nextNews,
    this.hideNextPrevioudControl = false,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  DateTime? _startTime;
  late int animationDuration;
  TabController? _tabController;
  final Map<TabType, DateTime> _startTimePerTab = {};
  final Map<TabType, int> _timeSpentPerTab = {};
  @override
  void initState() {
    debugPrint(widget.news.title.length.toString());
    debugPrint(widget.news.description.length.toString());
    Get.put(
      TimeTrackController(news: widget.news),
      tag: widget.news.id!,
      // permanent: true,
    );

    widget.onInit();

    super.initState();
    _tabController = TabController(vsync: this, length: calculateTabLength());

    _tabController!.addListener(_handleTabChange);
    _startTimePerTab[_getTabType(0)] = DateTime.now();
  }

  void _handleTabChange() {
    if (_tabController!.previousIndex != _tabController!.index) {
      // Update time spent on the previous tab
      _updateTimeSpent(_getTabType(_tabController!.previousIndex));

      // Start time tracking for the new tab
      _startTimePerTab[_getTabType(_tabController!.index)] = DateTime.now();
    }
  }

  void _updateTimeSpent(TabType tabType) {
    if (_startTimePerTab.containsKey(tabType)) {
      DateTime startTime = _startTimePerTab[tabType]!;
      int timeSpent = DateTime.now().difference(startTime).inSeconds;
      _timeSpentPerTab.update(
          tabType, (existingTime) => existingTime + timeSpent,
          ifAbsent: () => timeSpent);
      _startTimePerTab.remove(tabType);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _updateTimeSpent(_getTabType(_tabController!.index));
    _tabController!.dispose();

    if (Get.isRegistered<TimeTrackController>(tag: widget.news.id!)) {
      Get.find<TimeTrackController>(
        tag: widget.news.id!,
      ).mapTime(_timeSpentPerTab);
      Get.delete<TimeTrackController>(
        tag: widget.news.id!,
      );
    }

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      Get.find<TimeTrackController>(
        tag: widget.news.id!,
      ).mapTime(_timeSpentPerTab);
      Get.delete<TimeTrackController>(
        tag: widget.news.id!,
      );
      _startTimePerTab.clear();
      _timeSpentPerTab.clear();
    }

    if (state == AppLifecycleState.resumed) {
      Get.put(
        TimeTrackController(news: widget.news),
        tag: widget.news.id!,
      );
      _startTimePerTab[_getTabType(0)] = DateTime.now();
    }
    super.didChangeAppLifecycleState(state);
  }

  onVisible() {
    if (_startTime == null) {
      debugPrint("onVisible ${widget.news.title}");
      Get.find<FirebaseAnalytics>()
          .logEvent(name: AnalyticsCustomEvent.news_viewed.name, parameters: {
        "news_id": widget.news.id ?? 'no id',
        "news_title": widget.news.title
            .substring(0, min(38, (widget.news.title.length - 1))),
        "category": widget.news.category?.name ?? "",
      });
    }
    _startTime ??= DateTime.now();
    if (!Get.isRegistered<TimeTrackController>(tag: widget.news.id!)) {
      Get.put(
        TimeTrackController(news: widget.news),
        tag: widget.news.id!,
        // permanent: true,
      );
    }
  }

  int calculateTabLength() {
    int currentTabLength = 1;
    if (widget.news.sections.isNotEmpty) {
      currentTabLength++;
    }
    if ((widget.news.faq.isNotEmpty && widget.news.faqApproved)) {
      currentTabLength++;
    }
    if (widget.news.formattedDescription != null &&
        widget.news.formattedDescription!.isNotEmpty) {
      currentTabLength++;
    }
    if (widget.news.quizApproved) {
      currentTabLength++;
    }
    return currentTabLength;
  }

  TabType _getTabType(int index) {
    List<TabType> tabOrder = [];

    // Always add the news tab
    tabOrder.add(TabType.news);
    if (widget.news.sections.isNotEmpty) {
      tabOrder.add(TabType.sections);
    }

    // Conditionally add other tabs based on availability
    if (widget.news.faq.isNotEmpty && widget.news.faqApproved) {
      tabOrder.add(TabType.faq);
    }
    if (widget.news.formattedDescription != null &&
        widget.news.formattedDescription!.isNotEmpty) {
      tabOrder.add(TabType.details);
    }
    if (widget.news.quizApproved) {
      tabOrder.add(TabType.quiz);
    }

    return tabOrder[index];
  }

  bool shouldShowSwipeMessage() {
    if (_tabController?.index == 0) {
      return false;
    }
    if (widget.news.description.length > 400 || widget.news.title.length > 60) {
      return false;
    }
    if (Get.isRegistered<NewsStoriesController>() &&
        Get.find<NewsStoriesController>().readNewsIds.length > 10) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.hideNextPrevioudControl
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomBar(
                    widget: widget,
                    tabController: _tabController!,
                    showPreviousButton: widget.hasPreviousNews),
              ],
            ),
      body: ListView(
        children: [
          NewsDetailsTab(
              widget: widget,
              tabController: _tabController!,
              hastag: widget.hashtag),
          if ((widget.news.faq.isNotEmpty && widget.news.faqApproved))
            FaqSection(
              news: widget.news,
            ),
          // if (widget.news.formattedDescription != null &&
          //     widget.news.formattedDescription!.isNotEmpty)
          //   FullArticle(news: widget.news)
          // else
          //   const SizedBox(
          //     height: 120,
          //   ),
          if (widget.news.xUrl != null) ...[
            EmbedSocial(
              tweetUrl: widget.news.xUrl!,
            ),
            const Divider()
          ],
          if (widget.nextNews != null) ...widget.nextNews!,
        ],
      ),
    );
  }
}

class TwitterEmbed extends StatelessWidget {
  const TwitterEmbed({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class BottomBar extends StatefulWidget {
  final TabController tabController;
  final bool showPreviousButton;
  const BottomBar({
    super.key,
    required this.widget,
    required this.tabController,
    required this.showPreviousButton,
  });

  final NewsDetails widget;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final hideBar = true.obs;
  bool previouslyHidden = false;
  Timer? timer;
  Timer? snackbarTimer;
  final showSnackbar = true.obs;
  @override
  void initState() {
    super.initState();
  }

  handleNextNews() {
    if (Get.isRegistered<NewsStoriesController>()) {
      Get.find<NewsStoriesController>()
          .storiesPageController
          .nextPage(duration: 500.milliseconds, curve: Curves.easeInOut);
      return;
    }
    if (Get.isRegistered<NewsDetailsController>()) {
      Get.find<NewsDetailsController>()
          .pageController
          .nextPage(duration: 500.milliseconds, curve: Curves.easeInOut);
      return;
    }
    if (Get.isRegistered<TopicNewsController>()) {
      Get.find<TopicNewsController>()
          .pageController
          .nextPage(duration: 500.milliseconds, curve: Curves.easeInOut);
      return;
    }
  }

  handlePreviousNews() {
    if (Get.isRegistered<NewsStoriesController>()) {
      Get.find<NewsStoriesController>()
          .storiesPageController
          .previousPage(duration: 400.milliseconds, curve: Curves.ease);
      return;
    }
    if (Get.isRegistered<NewsDetailsController>()) {
      Get.find<NewsDetailsController>()
          .pageController
          .previousPage(duration: 400.milliseconds, curve: Curves.ease);
      return;
    }
    if (Get.isRegistered<TopicNewsController>()) {
      Get.find<TopicNewsController>()
          .pageController
          .previousPage(duration: 400.milliseconds, curve: Curves.ease);
      return;
    }
  }

  bool shouldShowNextButton() {
    if (widget.tabController.length == 1) return true;
    if (hideBar.value) {
      if (widget.tabController.index == 0) {
        return false;
      }
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    timer?.cancel();
    snackbarTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.isDarkMode
        ? const ColorScheme.dark(
            primary: AppColors.primary,
            brightness: Brightness.dark,
            primaryContainer: AppColors.cardDark,
          )
        : ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light,
          );
    return WillPopScope(
      onWillPop: () {
        EasyLoading.dismiss();
        final currentTabIndex = widget.tabController.index;
        if (currentTabIndex == 0) {
          return Future.value(true);
        } else {
          widget.tabController.animateTo(0);
          return Future.value(false);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(colorScheme: colorScheme),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              child: Builder(builder: (context) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.showPreviousButton)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          handlePreviousNews();
                        },
                        child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.1),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${LocaleKeys.previous.tr} ",
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                const Icon(
                                  Bootstrap.box_arrow_in_up,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.showPreviousButton)
                      const SizedBox(
                        width: 5,
                      ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        handleNextNews();
                      },
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.1),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${LocaleKeys.next_news.tr} ",
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              const Icon(
                                Bootstrap.box_arrow_in_down,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Obx(() {
            showSnackbar.value;
            return AnimatedSize(
              duration: 300.ms,
              child: !showSnackbar.value
                  ? const SizedBox()
                  : SizedBox(
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: IgnorePointer(
                              ignoring: true,
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Material(
                                  shape: Border(
                                      top: BorderSide(
                                          color:
                                              Theme.of(context).dividerColor)),
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      LocaleKeys.snackbar_share_message.tr,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.deferToChild,
                                  onTap: widget.widget.onShareNewsClick,
                                  child: const Icon(
                                    Icons.share,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            );
          })
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final int index;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final TabController tabController;

  const CustomTab({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIcon,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, child) {
        final bool isSelected = tabController.index == index;

        return Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (index == 0)
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      Assets.images.logo.path,
                      width: isSelected ? 26 : 22,
                      // color: isSelected ? AppColors.white : AppColors.primary,
                    ),
                  )
                else
                  Icon(
                    isSelected ? selectedIcon : icon,
                    color: isSelected ? AppColors.white : null,
                    size: isSelected ? 20 : 18,
                  ),
                if (!isSelected)
                  Text(
                    label,
                    style: const TextStyle(fontSize: 12, height: 1.3),
                  )
              ],
            ),
            AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  axis: Axis
                      .horizontal, // You can change this to Axis.horizontal if needed
                  child: child,
                );
              },
              duration: tabController.animationDuration,
              child: isSelected
                  ? Center(
                      child: Text(
                        "  $label",
                        style: TextStyle(
                          color: isSelected ? AppColors.white : null,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}

enum TabType { news, sections, faq, details, quiz }
