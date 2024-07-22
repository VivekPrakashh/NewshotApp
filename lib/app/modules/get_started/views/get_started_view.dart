import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/modules/get_started/views/term_and_condition_dialog.dart';
import '../../../../generated/locales.g.dart';
import '../../../core/colors.dart';
import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('GetStartedView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: LangaugePage(
                controller: controller,
              ),
            ),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                      value: controller.termAccepted.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.termAccepted.value = value;
                        }
                      });
                }),
                RichText(
                    text: TextSpan(style: Get.textTheme.labelLarge, children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.termAccepted.value =
                              !controller.termAccepted.value;
                        },
                      text: "By continuing you agree to "),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.dialog(const TermAndConditionDialog());
                        },
                      text: "Our Terms.",
                      style: const TextStyle(
                        color: Colors.blue,
                      ))
                ]))
              ],
            ),
            Obx(
              () => controller.isLoading.value
                  ? const LinearProgressIndicator()
                  : const SizedBox(),
            ),
            SizedBox(
              height: 52,
              width: double.maxFinite,
              child: Obx(() {
                return ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor:Colors.black,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)) ) ,
                  onPressed: !controller.termAccepted.value
                      ? null
                      : () {
                          controller.registerUser();
                          // if (controller.pageController.page! > 0) {

                          //   return;
                          // }
                          // controller.pageController
                          //     .nextPage(duration: 600.ms, curve: Curves.fastOutSlowIn);
                        },
                  child: Text(LocaleKeys.button_continue.tr,
                  style: TextStyle(color:!controller.termAccepted.value? Colors.grey:Colors.white),),
                  // icon: const Icon(Icons.navigate_next),
                  // label: const Text("Next"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemePage extends StatelessWidget {
  final GetStartedController controller;
  const ThemePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Transform.scale(
          scale: 1.2,
          child: Lottie.asset(Assets.lottie.theme),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Text(
                  LocaleKeys.theme.tr,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTabController(
                    // initialIndex: currentThemeMode.index,
                    length: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                          dividerColor: Colors.transparent,
                          onTap: (value) {
                            Get.changeThemeMode(ThemeMode.values[value]);
                            controller.selectedTheme.value =
                                ThemeMode.values[value];
                            // LocalDbServices.updateThemeMode(ThemeMode.values[value]);
                          },
                          indicator: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: AppColors.white,
                          tabs: [
                            Tab(
                              text: LocaleKeys.system.tr,
                              icon: const Icon(Icons.smartphone_sharp),
                            ),
                            Tab(
                              text: LocaleKeys.light.tr,
                              icon: const Icon(Icons.light_mode),
                            ),
                            Tab(
                              text: LocaleKeys.dark.tr,
                              icon: const Icon(Icons.dark_mode),
                            ),
                          ]),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LangaugePage extends StatefulWidget {
 const LangaugePage({
    super.key,
    required this.controller,
  });

  final GetStartedController controller;

  @override
  State<LangaugePage> createState() => _LangaugePageState();
}

class _LangaugePageState extends State<LangaugePage> {
  bool isChecked = false;
  

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          const SizedBox(),
          Transform.scale(
            scale: 1.4,
            child: SizedBox(
                height: 160, child: Image.asset('assets/images/language.png')),
          ),
          Column(children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Your ",
                  style: TextStyle(
                    fontSize: 22,
                    color:  Get.isDarkMode ? AppColors.background : AppColors.background,
                  ),
                ),
                Text(
                  "Language",
                  style: TextStyle(
                    color: Color(0xffFCCE0B),
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const Text(
              'अपनी भाषा चुनें',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              'Select your preferred language to use Reveal',
              style: TextStyle(
                color:  Get.isDarkMode ? AppColors.white : AppColors.background,
                fontSize: 14,
              ),
            ),
             Text(
              'Inside easily\!',
              style: TextStyle(
                color: Get.isDarkMode ? AppColors.white : AppColors.background,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return Column(children: [
                InkWell(
                  onTap: () {
                    const locale = Locale('en');
                    widget.controller.selectedLocale.value = locale;
                    // LocalDbServices.updateLocale(locale);
                    Get.updateLocale(locale);
                    
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: widget.controller.selectedLocale.value
                                      .languageCode ==
                                  'en'
                              ? Color(0xffFCCE0B)
                              : Color(0xffCCCCCC),
                        ),
                        color: Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color:  widget.controller.selectedLocale.value
                                      .languageCode ==
                                  'en'? Color(0xffD4E8FF):Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.asset('assets/images/englishIcon.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'English',
                           locale: Locale('en'),
                          style: TextStyle(
                            color: Color(0xff272727),
                            fontSize: 13,
                          ),
                        ),
                        Spacer(),
                        IgnorePointer(
                          ignoring: true,
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.yellow,
                            shape: CircleBorder(),
                            side: BorderSide(color: Color(0xffCCCCCC)),
                            value:  widget.controller.selectedLocale.value
                                        .languageCode ==
                                    'en',
                            onChanged: (bool? value) {
                              setState(() {
                                 isChecked = value!;
                               
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    const locale = Locale('hi');
                    widget.controller.selectedLocale.value = locale;
              
                    // LocalDbServices.updateLocale(locale);
                    Get.updateLocale(locale);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: widget.controller.selectedLocale.value
                                      .languageCode ==
                                  'hi'
                              ? Color(0xffFCCE0B)
                              : Color(0xffCCCCCC),
                        ),
                        color: Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: widget.controller.selectedLocale.value
                                      .languageCode ==
                                  'hi'? Color(0xffD4E8FF):Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.asset('assets/images/hindiIcon.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Hindi',
                          
                          style: TextStyle(
                            color: Color(0xff272727),
                            fontSize: 13,
                          ),
                        ),
                        Spacer(),
                        IgnorePointer(
                          ignoring: true,
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.yellow,
                            shape: CircleBorder(),
                            side: BorderSide(color: Color(0xffCCCCCC)),
                            value:  widget.controller.selectedLocale.value
                                        .languageCode ==
                                    'hi',
                            onChanged: (bool? value) {
                              setState(() {
                                 isChecked = value!;
                               
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              
                //   Container(
                //     padding: const EdgeInsets.symmetric(vertical: 15),
                //     width: double.maxFinite,
                //     child: Card(
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 15),
                //         child: Column(
                //           children: [
                //             const Text(
                //               "Choose Your Language",
                //               style: TextStyle(
                //                 fontSize: 22,
                //               ),
                //             ),
                //             const Text(
                //               'भाषा का चयन करें',
                //               style: TextStyle(
                //                 fontSize: 24,
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(
                //                 horizontal: 20,
                //               ),
                //               child: Obx(() {
                //                 return Column(
                //                   children: [
                //                     Expanded(
                //                       child: MaterialButton(
                //                         height: 70,
              
                //                         shape: const RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.all(Radius.circular(10))),
                //                         color: widget.controller
                //                                     .selectedLocale.value.languageCode ==
                //                                 'hi'
                //                             ? AppColors.action1
                //                             : null,
                //                         textColor: widget.controller
                //                                     .selectedLocale.value.languageCode ==
                //                                 'hi'
                //                             ? AppColors.white
                //                             : null,
                //                         onPressed: () {
                //                           const locale = Locale('hi');
                //                           widget.controller.selectedLocale.value = locale;
              
                //                           // LocalDbServices.updateLocale(locale);
                //                           Get.updateLocale(locale);
                //                         },
                //                         child: const Text(
                //                           "हिंदी",
                //                           locale: Locale('hi'),
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(
                //                       width: 10,
                //                     ),
                //                     Expanded(
                //                       child: MaterialButton(
                //                         shape: const RoundedRectangleBorder(
              
                //                             borderRadius:
                //                                 BorderRadius.all(Radius.circular(10))),
                //                         color: widget.controller
                //                                     .selectedLocale.value.languageCode ==
                //                                 'en'
                //                             ? AppColors.action1
                //                             : null,
                //                         textColor: widget.controller
                //                                     .selectedLocale.value.languageCode ==
                //                                 'en'
                //                             ? AppColors.white
                //                             : null,
                //                         onPressed: () {
                //                           const locale = Locale('en');
                //                           widget.controller.selectedLocale.value = locale;
                //                           // LocalDbServices.updateLocale(locale);
                //                           Get.updateLocale(locale);
                //                         },
                //                         child: const Text("English"),
                //                       ),
                //                     ),
                //                   ],
                //                 );
                //               }),
                //             ),
                //             const Divider(),
                //             // SizedBox(
                //             //   height: 10,
                //             // ),
                //             const Text(
                //               "You can select English or hindi language\nlater in the settings anytime",
                //               textAlign: TextAlign.center,
                //             ),
                //             // Spacer(),
                //             // Row(
                //             //   children: [
                //             //     Expanded(
                //             //       child: MaterialButton(
                //             //         height: 45,
                //             //         shape: RoundedRectangleBorder(
                //             //             borderRadius: BorderRadius.circular(10),
                //             //             side: const BorderSide(
                //             //               color: Colors.grey,
                //             //             )),
                //             //         onPressed: () {
                //             //           controller.selectLanguage(const Locale('en'));
                //             //         },
                //             //         child: const Text(
                //             //           "English",
                //             //           style: TextStyle(fontSize: 16),
                //             //         ),
                //             //       ),
                //             //     ),
                //             //     const SizedBox(
                //             //       width: 20,
                //             //     ),
                //             //     Expanded(
                //             //       child: MaterialButton(
                //             //         height: 45,
                //             //         shape: RoundedRectangleBorder(
                //             //             borderRadius: BorderRadius.circular(10),
                //             //             side: const BorderSide(
                //             //               color: Colors.grey,
                //             //             )),
                //             //         onPressed: () {
                //             //           controller.selectLanguage(const Locale('hi'));
                //             //         },
                //             //         child: const Text(
                //             //           "हिंदी",
                //             //           style: TextStyle(fontSize: 16),
                //             //         ),
                //             //       ),
                //             //     ),
                //             //   ],
                //             // ).paddingSymmetric(horizontal: 20, vertical: 20),
                //             // Spacer()
                //           ],
                //         ),
                //       ),
                //     ),
                //   ).animate().slideY(
                //         // delay: 1000.ms,
                //         duration: 600.ms,
                //         begin: 1.5,
                //         end: 0,
                //         curve: Curves.easeInOutCirc,
                //       ),
                // ],
              ]);
            })
          ])
        ]);
  }
}
