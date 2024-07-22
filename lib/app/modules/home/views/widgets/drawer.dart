import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/core/colors.dart';
import 'package:news_shots_app/app/core/gen/assets.gen.dart';
import 'package:news_shots_app/app/core/widgets/form_helper.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../../core/gen/fonts.gen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Theme.of(context).brightness == Brightness.dark
      //     ? const Color(0xff0b132b)
      //     : const Color.fromARGB(255, 209, 239, 251),
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                // FormHelper.iconButton(
                //     // backgroundColor: AppColors.red,
                //     iconColor: AppColors.red,
                //     onTap: () {
                //       Get.back();
                //     },
                //     icon: Icons.close),
                // const SizedBox(
                //   height: 10,
                // ),
                SizedBox(height: 30,),
                Row(
                  children: [
                      Center(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(Assets.images.logo.path,
                                  width: 40),
                            ),
                          ),
                          SizedBox(width: 15,),

                   SizedBox(
                            height: 23,
                            width: 160,
                            // child: Image.asset('assets/images/Revealimage.png')),
                         child:  Text(
                            "Reveal Inside",
                            style:TextStyle(
                              fontSize: 18,
                              color:   Get.isDarkMode ? Colors.grey.shade300 : AppColors.background,
                               fontFamily: FontFamily.inter,
                               fontWeight: FontWeight.w900
                            )
                            //  GoogleFonts.salsa(),
                          ),),

                  ],
                )
                // Material(
                //   shape: const RoundedRectangleBorder(
                //       side: BorderSide(),
                //       borderRadius: BorderRadius.all(Radius.circular(5))),
                //   color: AppColors.yellow,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //     ),
                //     child: Text(
                //       LocaleKeys.title_menu.tr,
                //       style: const TextStyle(
                //         fontSize: 26,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          DrawerItem(
            onTap: () {
              Get.toNamed(Routes.BOOKMARKS);
            },
            title: LocaleKeys.saved.tr,
            icon: Bootstrap.bookmark,
          ),
          DrawerItem(
            onTap: () {
              Get.toNamed(Routes.HISTORY);
            },
            title: LocaleKeys.history.tr,
            icon: Bootstrap.clock_history,
          ),
          DrawerItem(
            onTap: () {
              Get.toNamed(Routes.NOTIFICATION_HISTORY);
            },
            title: LocaleKeys.notification_history.tr,
            icon: Bootstrap.bell,
          ),
          DrawerItem(
            onTap: () {
              Get.toNamed(Routes.SETTINGS);
            },
            title: LocaleKeys.settings.tr,
            icon: Bootstrap.gear,
          ),
          DrawerItem(
            onTap: () {
              Get.toNamed(Routes.CONTACT_US);
            },
            title: LocaleKeys.contact.tr,
            icon: Bootstrap.envelope,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.35),
          Container(
            height: 52,
            width:  MediaQuery.of(context).size.width*0.65,
            decoration: BoxDecoration(
              color: Get.isDarkMode ?Colors.grey.shade300 :Colors.black ,
              borderRadius: BorderRadius.circular(10)),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Icon(Icons.arrow_back,color:  Get.isDarkMode ?AppColors.background :AppColors.white  ,),
              SizedBox(width: 10,),
               Text('Logout',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,
              color: Get.isDarkMode ?AppColors.background :AppColors.white  ,),)
             ],
              
          )
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        dense: true,
        
        shape: const RoundedRectangleBorder(
            // side: BorderSide(
            //   color: AppColors.primary,
            // ),
            borderRadius: BorderRadius.all(Radius.circular(10))),

        // tileColor:
        //     ColorScheme.fromSeed(seedColor: AppColors.primary).primaryContainer,
        // textColor: AppColors.primary,
        // splashColor: Colors.red,
        // tileColor: Theme.of(context).colorScheme.background,
        // iconColor: AppColors.primary,
        tileColor: Colors.yellow.shade200,
        selectedColor: Colors.yellow,
        iconColor: Colors.black,
        onTap: onTap,
        leading: Icon(icon, size: 22),
        title: Text(
          title,
          style:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color:  Get.isDarkMode ?AppColors.background :AppColors.background  ,
            ),
        ),
      ),
    );
  }
}
