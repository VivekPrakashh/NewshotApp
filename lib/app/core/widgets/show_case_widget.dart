import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class MyShowCaseWidget extends StatelessWidget {
  const MyShowCaseWidget(
      {super.key,
      required this.globalKey,
      this.title,
      required this.description,
      required this.child,
      this.shapeBorder = const CircleBorder()});

  final GlobalKey? globalKey;
  final String? title;
  final String description;
  final Widget child;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    if (globalKey == null) {
      return child;
    }

    return Showcase(
      key: globalKey!,
      description: description,
      targetShapeBorder: shapeBorder,
      title: title,
      child: child,
    );
  }
}
