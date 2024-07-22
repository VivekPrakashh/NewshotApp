import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/constants.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/core/text_scale_factors.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';
import 'package:news_shots_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';
// import 'package:news_shots_app/app/core/extenstions.dart';

import 'package:news_shots_app/generated/locales.g.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff0b132b)
          : const Color.fromARGB(255, 209, 239, 251),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(LocaleKeys.settings.tr),
        centerTitle: true,
        backgroundColor:
            Get.isDarkMode ? const Color(0xff034078) : const Color(0xff226CE0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return controller.appSettings.value == null
              ? const SizedBox()
              : ListView(
                  children: const [
                    ThemeCard(),
                    Language(),
                    FontSizes(),
                    NotificationPreferenceOption(),
                    Preferences(),
                    // HideTabOption(),
                    SizedBox(
                      height: 100,
                    )
                  ],
                );
        }),
      ),
    );
  }
}

class Preferences extends StatelessWidget {
  const Preferences({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final discoveryController = Get.find<DiscoveryController>();

    if (discoveryController.remoteUser == null) {
      return const SizedBox();
    }

    final categories = discoveryController.remoteUser!.categories;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ExpansionTile(
          initiallyExpanded: true,
          childrenPadding: const EdgeInsets.only(
            left: 14,
          ),
          title: Text(LocaleKeys.my_pref.tr),
          trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                Get.offAndToNamed(Routes.SELECT_CATEGORIES,
                    arguments: categories);
              },
              child: Text(LocaleKeys.edit.tr)),
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Wrap(
                spacing: 10,
                runSpacing: 5,
                children: categories
                    .map((e) => RawChip(
                          labelStyle: const TextStyle(
                            color: AppColors.primary,
                          ),
                          label: Text(e.getCategoryName),
                          padding: EdgeInsets.zero,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThemeCard extends GetView<SettingsController> {
  const ThemeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        child: ExpansionTile(
          initiallyExpanded: true,
          trailing:
              Text(controller.appSettings.value!.theme.name.tr.capitalize!,
                  style: const TextStyle(
                    fontSize: 14,
                  )),
          title: Text(LocaleKeys.theme.tr,
              style: const TextStyle(
                fontSize: 18,
              )),
          collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 5,
                children: ThemeMode.values
                    .map(
                      (e) => TabOptions(
                        icon: Icon(e == ThemeMode.dark
                            ? Icons.dark_mode
                            : e == ThemeMode.light
                                ? Icons.light_mode
                                : Icons.phone_android_rounded),
                        onTap: () {
                          controller.updateTheme(e);
                        },
                        label: e.name.toLowerCase().tr,
                        isActive: controller.appSettings.value!.theme == e,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 15,
            )
            // DefaultTabController(
            //   length: 3,
            //   initialIndex: controller.appSettings.value!.theme.index,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: TabBar(
            //         dividerColor: Colors.transparent,
            //         onTap: (value) =>
            //             controller.updateTheme(ThemeMode.values[value]),
            //         indicator: const BoxDecoration(
            //             color: AppColors.primary,
            //             borderRadius: BorderRadius.all(Radius.circular(10))),
            //         indicatorSize: TabBarIndicatorSize.tab,
            //         labelColor: AppColors.white,
            //         tabs: [
            //           Tab(
            //             text: LocaleKeys.system.tr,
            //             icon: const Icon(Icons.smartphone_sharp),
            //           ),
            //           Tab(
            //             text: LocaleKeys.light.tr,
            //             icon: const Icon(Icons.light_mode),
            //           ),
            //           Tab(
            //             text: LocaleKeys.dark.tr,
            //             icon: const Icon(Icons.dark_mode),
            //           ),
            //         ]),
            //   ),
            // )
          ],
        ),
      );
    });
  }
}

class Language extends GetView<SettingsController> {
  const Language({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        initiallyExpanded: true,
        trailing: Text(LocaleKeys.language.tr,
            style: const TextStyle(
              fontSize: 14,
            )),
        title: Text(LocaleKeys.title_language.tr,
            style: const TextStyle(
              fontSize: 18,
            )),
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        children: [
          Obx(() {
            return Column(
              children: [
                TabOptions(
                    icon: const Icon(Bootstrap.translate),
                    label: "English",
                    isActive:
                        controller.appSettings.value?.languageCode == 'en',
                    onTap: () {
                      controller.updateLocale(const Locale('en'));
                    }),
                const SizedBox(
                  height: 5,
                ),
                TabOptions(
                    icon: const Icon(Bootstrap.translate),
                    label: "हिंदी",
                    isActive:
                        controller.appSettings.value?.languageCode == 'hi',
                    onTap: () {
                      controller.updateLocale(const Locale('hi'));
                    }),
              ],
            );
          }),
          // Text("More Languages Coming Soon!")
        ],
      ),
    );
  }
}

class FontSizes extends StatelessWidget {
  const FontSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(() {
        final textScaleFactor = Constants.textScaleFactor.value;

        return ExpansionTile(
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          initiallyExpanded: true,
          trailing: Text(
            textScaleFactor.when(
              small: () => LocaleKeys.size_small.tr,
              normal: () => LocaleKeys.size_normal.tr,
              large: () => LocaleKeys.size_large.tr,
            ),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          title: Text(LocaleKeys.title_font_size.tr,
              style: const TextStyle(
                fontSize: 18,
              )),
          collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          children: [
            Column(
              children: [
                TabOptions(
                    icon: const Icon(Icons.format_size),
                    label: LocaleKeys.size_normal.tr,
                    isActive: textScaleFactor.isNormal,
                    onTap: () {
                      Get.changeTextScaleFactor(const TextScaleFactor.normal());
                    }),
                const SizedBox(
                  height: 5,
                ),
                TabOptions(
                    icon: const Icon(Icons.format_size),
                    label: LocaleKeys.size_large.tr,
                    isActive: textScaleFactor.isLarge,
                    onTap: () {
                      Get.changeTextScaleFactor(const TextScaleFactor.large());
                    }),
              ],
            ),

            // Text("More Languages Coming Soon!")
          ],
        );
      }),
    );
  }
}

class NotificationPreferenceOption extends GetView<SettingsController> {
  const NotificationPreferenceOption({super.key});

  IconData getIcon(NotificationPreference preference) {
    switch (preference) {
      case NotificationPreference.off:
        return Icons.notifications_off;
      case NotificationPreference.normal:
        return Icons.notifications;
      case NotificationPreference.all:
        return Icons.notifications_active;
      case NotificationPreference.importantOnly:
        return Icons.notification_important;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final notificationPreference =
          controller.appSettings.value?.notificationPreference ??
              NotificationPreference.normal;
      return Card(
        child: ExpansionTile(
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          initiallyExpanded: true,
          trailing: Text(notificationPreference.name.tr,
              style: const TextStyle(
                fontSize: 14,
              )),
          title: Text(LocaleKeys.notification_preference.tr,
              style: const TextStyle(
                fontSize: 18,
              )),
          collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 5,
              children: NotificationPreference.values
                  .map(
                    (e) => TabOptions(
                      icon: Icon(getIcon(e)),
                      onTap: () {
                        controller.updateNotificationPref(e);
                      },
                      label: e.name.tr,
                      isActive: notificationPreference == e,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 1.5,
                ),
              ),
              child: Text(
                "notification_messages_${notificationPreference.name}".tr,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            )
            // switch (notificationPreference) {
            //   NotificationPreference.all => const SizedBox(),
            //   NotificationPreference.normal => const SizedBox(),
            //   NotificationPreference.importantOnly => const SizedBox(),
            //   NotificationPreference.off => const SizedBox(),
            // }
          ],
        ),
      );
    });
  }
}

class HideTabOption extends GetView<SettingsController> {
  const HideTabOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hideNewsMenu =
          controller.appSettings.value?.hideNewsOption ?? false;
      return Card(
        child: ExpansionTile(
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          initiallyExpanded: true,
          trailing: Text(
              hideNewsMenu
                  ? LocaleKeys.hidden.tr
                  : LocaleKeys.always_visible.tr,
              style: const TextStyle(
                fontSize: 14,
              )),
          title: Text(LocaleKeys.hide_menu_title.tr,
              style: const TextStyle(
                fontSize: 18,
              )),
          collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          children: [
            Column(
              // spacing: 10,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: TabOptions(
                    icon: const Icon(Bootstrap.lightbulb),
                    onTap: () => controller.updateHideOption(!hideNewsMenu),
                    label: LocaleKeys.show.tr,
                    isActive: !hideNewsMenu,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: TabOptions(
                    icon: const Icon(Bootstrap.lightbulb_off),
                    onTap: () => controller.updateHideOption(!hideNewsMenu),
                    label: LocaleKeys.hide.tr,
                    isActive: hideNewsMenu,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class TabOptions extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Widget icon;
  const TabOptions({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      shape: RoundedRectangleBorder(
          side: isActive
              ? BorderSide.none
              : BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      color: isActive ? AppColors.action1 : null,
      textColor: isActive ? AppColors.white : null,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<T> insertBetweenEveryElement<T>(List<T> list, T itemToInsert) {
  // Check if the list has less than 2 elements, in which case there's no "between" to insert into
  if (list.length < 2) {
    return list;
  }

  List<T> result = [];
  for (int i = 0; i < list.length - 1; i++) {
    // Add the current item
    result.add(list[i]);
    // Add the item to insert
    result.add(itemToInsert);
  }
  // Add the last item of the original list
  result.add(list.last);

  return result;
}
