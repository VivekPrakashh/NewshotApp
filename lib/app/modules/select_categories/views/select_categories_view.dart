import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/models/news/category.dart';
import 'package:news_shots_app/app/routes/app_pages.dart';
import 'package:news_shots_app/generated/locales.g.dart';

import '../../../core/colors.dart';
import '../controllers/select_categories_controller.dart';

class SelectCategoriesView extends GetView<SelectCategoriesController> {
  const SelectCategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        return Container(
          height: 52,
          margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
            ),
           
            onPressed: controller.selectedCategories.length < 3
                ? null
                : () {
                  
                     controller.handleNext();
                  },
            icon: const Icon(Bootstrap.check),
            label: Obx(() {
              return Text(
                  "${LocaleKeys.set_pref.tr} (${controller.selectedCategories.length}/${controller.categories.length})");
            }),
          ),
        );
      }),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
        
          children: [
         
             SizedBox(
                height: 223,
                 child: Image.asset('assets/images/FollowIcon.png')),
            const Row(
              children: [
                Text('Follow your ',
                  // LocaleKeys.follow_interest.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                   Text(
                  'Interest',
                  style: TextStyle(
                    color: Color(0xffFCCE0B),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CategoriesListPageView(
                controller: controller,
              ),
            ),
            // Flexible(
            //   child: PageView(
            //     controller: controller.pageController,
            //     children: [
            //       CategoriesListPageView(
            //         controller: controller,
            //       ),
            //       // SubCategoriesListPageView(
            //       //   controller: controller,
            //       // ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

// class SubCategoriesListPageView extends StatelessWidget {
//   const SubCategoriesListPageView({
//     super.key,
//     required this.controller,
//   });

//   final SelectCategoriesController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 20,
//         ),
//         Expanded(
//           child: ListView.separated(
//               physics: const BouncingScrollPhysics(),
//               padding: const EdgeInsets.only(bottom: 100),
//               separatorBuilder: (__, _) => const SizedBox(
//                     height: 18,
//                   ),
//               // shrinkWrap: true,
//               itemCount: controller.selectedCategories.length,
//               itemBuilder: (context, index) {
//                 final category = controller.selectedCategories[index];

//                 return InputDecorator(
//                   isFocused: true,
//                   decoration: InputDecoration(
//                       isDense: true,
//                       border: const OutlineInputBorder(),
//                       labelText: category.getCategoryName,
//                       floatingLabelStyle: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       )),
//                   child: Column(
//                     // initiallyExpanded: true,
//                     // childrenPadding: EdgeInsets.zero,
//                     // tilePadding: const EdgeInsets.symmetric(horizontal: 10),
//                     // title: Text(category.getCategoryName),
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(0),
//                         child: SizedBox(
//                           width: double.maxFinite,
//                           child: Obx(() {
//                             return Wrap(
//                               spacing: 4,
//                               alignment: WrapAlignment.start,
//                               runAlignment: WrapAlignment.start,
//                               children: category.subcategories
//                                   .map(
//                                     (e) => ChoiceChip(
//                                       label: Text(e.getName),
//                                       selected: controller.selectedSubCategories
//                                           .contains(e),
//                                       onSelected: (value) {
//                                         if (value) {
//                                           controller.selectedSubCategories
//                                               .add(e);
//                                         } else {
//                                           controller.selectedSubCategories
//                                               .remove(e);
//                                         }
//                                       },
//                                       labelStyle: const TextStyle(
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                   .toList(),
//                             );
//                           }),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               }),
//         )
//       ],
//     );
//   }
// }

class CategoriesListPageView extends StatefulWidget {
  const CategoriesListPageView({
    super.key,
    required this.controller,
  });

  final SelectCategoriesController controller;

  @override
  State<CategoriesListPageView> createState() => _CategoriesListPageViewState();
}

class _CategoriesListPageViewState extends State<CategoriesListPageView> {
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Please select at least 3 categories',
          // LocaleKeys.select_atleast_three_category.tr,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Obx(() {
          if (widget.controller.categories.isEmpty) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return SizedBox(
            width: double.maxFinite,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.controller.categories.map((category) {
                //  final category = controller.categories[index];
                final isSelected =
                    widget.controller.selectedCategories.contains(category);
                return CategoryChip(
                    label: category.getCategoryName,
                    isSelected: isSelected,
                    onTap: (v) {
                      if (isSelected) {
                        widget.controller.selectedCategories.remove(category);
                        // controller.selectedSubCategories.removeWhere(
                        //     (element) =>
                        //         element.parentCategory == category.id);
                      } else {
                        widget.controller.selectedCategories.add(category);
                        // controller.selectedSubCategories
                        //     .addAll(category.subcategories);
                      }
                    });
              }).toList(),
            ),
          );
        }),
      ],
    );
  }
}

class CategoryGridCard extends StatefulWidget {
  const CategoryGridCard({
    super.key,
    required this.isSelected,
    required this.category,
    required this.onTap,
  });
  final VoidCallback onTap;
  final bool isSelected;

  final Category category;

  @override
  State<CategoryGridCard> createState() => _CategoryGridCardState();
}

class _CategoryGridCardState extends State<CategoryGridCard> {
  @override
  Widget build(BuildContext context) {
    // return ChoiceChip(
    //   label: Text(category.getCategoryName),
    //   selected: isSelected,
    //   onSelected: (_) => onTap(),
    // );
    return InkWell(
      // onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        // color: isSelected ? AppColors.primary.withOpacity(0.8) : null,
        color: widget.isSelected? Color(0xff272727):Colors.grey.shade200,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isSelected)
                const Icon(
                  Bootstrap.check,
                  color: Colors.white,
                ),
              const SizedBox(
                width: 4,
              ),
              Text(
                Get.locale!.isEnglish() ? widget.category.name : widget.category.hindiName,
                style: TextStyle(
                  color: widget.isSelected ? Colors.black :Colors.grey ,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final void Function(bool) onTap;
  const CategoryChip(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: Colors.black,
      // selectedColor: Color.fromARGB(255, 123, 189, 255),
      label: Text(widget.label,style: TextStyle(color:widget.isSelected? Colors.white: Get.isDarkMode ? AppColors.white : AppColors.background,),),
      checkmarkColor:Colors.white,
      shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      selected: widget.isSelected,
      onSelected: (value) {
       
         widget.onTap(value);
      },
    );

    // return Material(
    //   shape: RoundedRectangleBorder(
    //       side: isSelected
    //           ? BorderSide.none
    //           : BorderSide(color: Get.theme.dividerColor),
    //       borderRadius: const BorderRadius.all(Radius.circular(10))),
    //   color: isSelected ? AppColors.primary : null,
    //   child: InkWell(
    //     onTap: () {
    //       onTap(isSelected);
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             label,
    //             style: TextStyle(
    //               color: isSelected ? Colors.white : null,
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 5,
    //           ),
    //           Icon(
    //             Icons.check,
    //             color: isSelected ? Colors.white : null,
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
