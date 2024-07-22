import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/widgets/form_helper.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';
import '../../../../generated/locales.g.dart';
import '../../../core/constants.dart';
import '../../../core/text_scale_factors.dart';
import '../../../core/util_functions.dart';
import '../../../core/widgets/report_bottom_sheet.dart';
import '../../../data/core/analytics_custom_event.dart';
import '../../../data/db/database.dart';
import '../../../data/services/news_services.dart';

class NewsOptionsDialog extends StatefulWidget {
  final NewsOrThread newsOrThread;
  const NewsOptionsDialog({super.key, required this.newsOrThread});

  @override
  State<NewsOptionsDialog> createState() => _NewsOptionsDialogState();
}

class _NewsOptionsDialogState extends State<NewsOptionsDialog> {
  Stream<NewsBookmark?> getBookmarkById() {
    return Get.find<AppLocalDB>()
        .newsBookmarksDao
        .getBookmarkByIdStream(widget.newsOrThread.id);
  }

  shareNewsClicked() async {
    UtilsFunction.shareNewsOrThread(widget.newsOrThread);
  }

  updateHideMenuOption(bool hidden) {
    Get.find<AppLocalDB>().localSessionsDao.updateNewsMenuOption(hidden);
  }

  updateHideDoubtsOption(bool hidden) {
    Get.find<AppLocalDB>().localSessionsDao.updatehideDoubtsOption(hidden);
  }

  updatetheme(ThemeMode theme) {
    Get.find<AppLocalDB>().localSessionsDao.updateThemeMode(theme);
    Get.changeThemeMode(theme);
    Get.back();
    Get.find<NewsServices>().updateCurrentUser(theme: theme);
  }

  updateFontSize(TextScaleFactor textScaleFactor) {
    Get.changeTextScaleFactor(textScaleFactor);
  }

  updateNotificationPref(NotificationPreference preference) {
    Get.find<AppLocalDB>()
        .localSessionsDao
        .updateNotificationPreference(preference);
    Get.find<NewsServices>()
        .updateCurrentUser(notificationPreference: preference);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        clipBehavior: Clip.hardEdge,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xff0b132b)
            : Colors.white,
        // : const Color.fromARGB(255, 209, 239, 251),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                  // Get.offAllNamed(Routes.DISCOVERY);
                },
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " ${LocaleKeys.back_to_home.tr}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                // child: Material(
                //   borderRadius: BorderRadius.circular(12),
                //   child: Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         const Icon(Icons.arrow_back),
                //         Text(" ${LocaleKeys.back_to_home.tr} "),
                //       ],
                //     ),
                //   ),
                // ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Get.isDarkMode
                  ? const Color(0xff272727)
                  : const Color(0xff272727),
              // actions: [
              //   FormHelper.iconButton(
              //       onTap: () {
              //         Get.back();
              //       },
              //       icon: Icons.close),
              //   const SizedBox(
              //     width: 10,
              //   )
              // ],
            ),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  if (widget.newsOrThread.isNews)
                    Text(
                      widget.newsOrThread.getNews()!.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 15),
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 10),
                  //   decoration: BoxDecoration(border: Border.all(width: 2)),
                  //   child: Text(
                  //     widget.newsOrThread.getNews()!.title,
                  //     textAlign: TextAlign.center,
                  //     style: const TextStyle(
                  //       fontSize: 17,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 20,
                    // ),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    children: [
                      InkWell(
                        onTap: () {
                          shareNewsClicked();
                        },
                        child: Card(
                          color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Bootstrap.share_fill,
                                size: 35,
                                color: AppColors.cardDark,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                LocaleKeys.share.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                LocaleKeys.share_message.tr,
                                style: const TextStyle(
                                   color: Colors.black,
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      StreamBuilder<NewsBookmark?>(
                          stream: getBookmarkById(),
                          builder: (context, snapshot) {
                            NewsBookmark? bookmark;
                            if (snapshot.hasData) {
                              Get.find<Logger>().i(snapshot.data);
                              bookmark = snapshot.data;
                            }

                            return InkWell(
                              onTap: () {
                                Get.back();
                                if (bookmark != null) {
                                  removeFromBookmark();
                                } else {
                                  addToBookmark();
                                }
                              },
                              child: Card(
                                color: Colors.grey.shade100,
                                shadowColor: Colors.grey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    bookmark != null
                                        ? const Icon(
                                            Bootstrap.bookmark_check_fill,
                                            size: 35,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Bootstrap.bookmark,
                                            color: Colors.black,
                                            size: 35,
                                          ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    if (bookmark != null)
                                      Text(
                                        LocaleKeys.saved.tr,
                                        style: const TextStyle(
                                           color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    else
                                      Text(
                                        LocaleKeys.save.tr,
                                        style: const TextStyle(
                                           color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    bookmark == null
                                        ? Text(
                                            LocaleKeys.save_message.tr,
                                            style: const TextStyle(
                                               color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                        : Text(
                                            LocaleKeys.bookmark_saved.tr,
                                            style: const TextStyle(
                                               color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                  ],
                                ),
                              ),
                            );
                          }),
                      InkWell(
                        onTap: () {
                          // Get.back();
                          Get.bottomSheet(
                            ReportBottomSheet(
                                newsOrThread: widget.newsOrThread),
                            isScrollControlled: true,
                          );
                        },
                        child: Card(
                           color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Bootstrap.flag_fill,
                                size: 30,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${LocaleKeys.issue.tr}?",
                                style: const TextStyle(
                                   color: Colors.black,
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                LocaleKeys.issue_message.tr,
                                style: const TextStyle(
                                   color: Colors.black,
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          InAppReview.instance
                              .openStoreListing(appStoreId: 'com.revealInside');
                        },
                        child: Card(
                           color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Bootstrap.star_fill,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Bootstrap.star_fill,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Bootstrap.star_fill,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Bootstrap.star_fill,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Bootstrap.star_fill,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                LocaleKeys.rate_us.tr,
                                style: const TextStyle(
                                   color: Colors.black,
                                    fontSize: 16, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(LocaleKeys.settings.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  const Divider(),
                  StreamBuilder(
                    stream: Get.find<AppLocalDB>()
                        .localSessionsDao
                        .getLocalSession(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null || snapshot.data!.isLeft()) {
                        return const SizedBox();
                      }

                      final localSession =
                          snapshot.data!.fold((l) => null, (r) => r);

                      // final hideNewsMenu = localSession!.hideNewsOption;
                      final hideDoubts = localSession!.hideDoubts;

                      return Column(
                        children: [
                          // Card(
                          //   shape: const RoundedRectangleBorder(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(6))),
                          //   // margin: const EdgeInsets.symmetric(vertical: 10),
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 12, vertical: 10),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text(LocaleKeys.hide_menu_title.tr),
                          //         PopupMenuButton(
                          //           onSelected: updateHideMenuOption,
                          //           padding: EdgeInsets.zero,
                          //           itemBuilder: (context) => [
                          //             PopupMenuItem(
                          //               height: 30,
                          //               value: true,
                          //               child: Text(LocaleKeys.hide.tr),
                          //             ),
                          //             PopupMenuItem(
                          //               height: 30,
                          //               value: false,
                          //               child: Text(LocaleKeys.show.tr),
                          //             ),
                          //           ],
                          //           child: hideNewsMenu
                          //               ? Text(
                          //                   LocaleKeys.hidden.tr,
                          //                   style: const TextStyle(
                          //                     fontSize: 12,
                          //                   ),
                          //                 )
                          //               : Text(
                          //                   LocaleKeys.always_visible.tr,
                          //                   style: const TextStyle(
                          //                     fontSize: 12,
                          //                   ),
                          //                 ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Card(
                             color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("News Doubts",style: TextStyle(color: Colors.black),),
                                  PopupMenuButton(
                                    onSelected: updateHideDoubtsOption,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        height: 30,
                                        value: true,
                                        child: Text(LocaleKeys.hide.tr),
                                      ),
                                      PopupMenuItem(
                                        height: 30,
                                        value: false,
                                        child: Text(LocaleKeys.show.tr),
                                      ),
                                    ],
                                    child: hideDoubts
                                        ? Text(
                                            LocaleKeys.hidden.tr,
                                            style: const TextStyle(
                                               color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          )
                                        : Text(
                                            LocaleKeys.always_visible.tr,
                                            style: const TextStyle(
                                               color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                             color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.theme.tr,style: TextStyle( color: Colors.black,),),
                                  PopupMenuButton(
                                    onSelected: updatetheme,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        height: 30,
                                        value: ThemeMode.system,
                                        child: Text(LocaleKeys.system.tr),
                                      ),
                                      PopupMenuItem(
                                        height: 30,
                                        value: ThemeMode.light,
                                        child: Text(LocaleKeys.light.tr),
                                      ),
                                      PopupMenuItem(
                                        height: 30,
                                        value: ThemeMode.dark,
                                        child: Text(LocaleKeys.dark.tr),
                                      ),
                                    ],
                                    child: Text(
                                        localSession.theme.name.tr.capitalize!,style: TextStyle( color: Colors.black,),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                             color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.title_font_size.tr, style: const TextStyle(
                                       color: Colors.black
                                      ),),
                                  PopupMenuButton(
                                    onSelected: updateFontSize,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        height: 30,
                                        value: const TextScaleFactor.normal(),
                                        child: Text(LocaleKeys.size_normal.tr),
                                      ),
                                      PopupMenuItem(
                                        height: 30,
                                        value: const TextScaleFactor.large(),
                                        child: Text(LocaleKeys.size_large.tr),
                                      ),
                                    ],
                                    child: Text(
                                      style: TextStyle( color: Colors.black, fontSize: 14,),
                                      Constants.textScaleFactor.value.when(
                                        small: () => LocaleKeys.size_small.tr,
                                        normal: () => LocaleKeys.size_normal.tr,
                                        large: () => LocaleKeys.size_large.tr,
                                      ),
                                     
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                             color: Colors.grey.shade100,
                          shadowColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.notification_preference.tr,style: TextStyle( color: Colors.black,)),
                                  PopupMenuButton(
                                    onSelected: updateNotificationPref,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) =>
                                        NotificationPreference.values
                                            .map(
                                              (e) => PopupMenuItem(
                                                height: 30,
                                                value: e,
                                                child: Text(e.name.tr),
                                              ),
                                            )
                                            .toList(),
                                    child: Text(
                                      localSession
                                          .notificationPreference.name.tr,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ExpansionTile(
                    minTileHeight: 45,
                    initiallyExpanded: true,
                    title: const Text(
                      "More Options",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        dense: true,
                        iconColor:Get.isDarkMode ?AppColors.white :AppColors.cardDark,
                        trailing: const Icon(Bootstrap.bookmark_check_fill),
                        onTap: () {
                          Get.offNamedUntil(
                              Routes.BOOKMARKS, (route) => route.isFirst);
                        },
                        title: const Text(
                          'Saved News',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        iconColor: Get.isDarkMode ?AppColors.white :AppColors.cardDark,
                        trailing: const Icon(Bootstrap.clock_history),
                        onTap: () {
                          Get.offNamedUntil(
                            Routes.HISTORY,
                            (route) => route.isFirst,
                          );
                        },
                        title: Text(
                          LocaleKeys.history.tr,
                          style: const TextStyle(
                            fontSize: 14,
                             fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        iconColor:Get.isDarkMode ?AppColors.white :AppColors.cardDark,
                        trailing: const Icon(Bootstrap.bell_fill),
                        onTap: () {
                          Get.offNamedUntil(Routes.NOTIFICATION_HISTORY,
                              (route) => route.isFirst);
                        },
                        title: Text(
                          LocaleKeys.notification_history.tr,
                          style: const TextStyle(
                            fontSize: 14,
                             fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 30,
              color: Get.isDarkMode
                  ? const Color(0xff272727)
                  : const Color(0xff272727),
            )
          ],
        ),
      ),
    );
  }

  removeFromBookmark() async {
    await Get.find<AppLocalDB>()
        .newsBookmarksDao
        .removeFromBookmark(widget.newsOrThread.id);

    widget.newsOrThread.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_removed.name,
          parameters: {
            "thread_id": widget.newsOrThread.id,
          });
    });
  }

  addToBookmark() async {
    await Get.find<AppLocalDB>()
        .newsBookmarksDao
        .addToBookmark(widget.newsOrThread);
    widget.newsOrThread.when(news: (news) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "news_id": news.id ?? 'no id',
            "news_title":
                news.title.substring(0, min(38, (news.title.length - 1))),
          });
    }, thread: (thread) {
      Get.find<FirebaseAnalytics>().logEvent(
          name: AnalyticsCustomEvent.bookmark_added.name,
          parameters: {
            "thread_id": thread.id,
            "thread_title": thread.threadTitle
                    ?.substring(0, min(thread.threadTitle!.length, 39)) ??
                'no title',
          });
    });
  }
}
