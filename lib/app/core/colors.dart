import 'package:flutter/material.dart';

import 'gen/fonts.gen.dart';

class AppColors {
  // static const background = Color(0xff1e193b);
  // static const background = Color(0xff181a20);
  static const background = Color(0xff28231d); //0xff0A0B0B

  // static const surface = Color(0xff262a34);
  static const surface = background;
  static const primary = Color(0xff007fff);
  static const cardDark = Color(0xff1f222a);
  static const card = Color(0xfff6f5f8);
  static const action1 = Color(0xff5980f0);
  static const action2 = Color(0xffa069f9);
  static const actionRed = Color(0xfffc7787);
  static const red = Color(0xffe32227);
  static const yellow = Color(0xfffff380);
  static const white = Color(0xfffffafa); //faf9f6

  // static const surface = Color(0xff312b4f);
  // static const primary = Color(0xff6a67f3);
  // static const cardDark = Color(0xff454071);
  // static const card = Color(0xfff6f5f8);
  // static const action1 = Color(0xff5980f0);
  // static const action2 = Color(0xff8967f3);
  // static const actionRed = Color(0xfffc7787);
}

// 181a20
// 1f222a card color
// 246bfe primary color
// 262a34 dialog
// 686c7d text secondary

TextTheme appTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xff212121),
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.w300,
    ),
    displayLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.inter,
      color: Color(0xff212121),
      height: 1.3,
      letterSpacing: 0,

      // wordSpacing: 2,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
    )

    // Set your desired font color here
    );
TextTheme appTextDarkTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xffd3d3d3),
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.w300,
    ),
    displayLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.inter,
      color: Color(0xffd3d3d3),
    ),
    titleMedium: TextStyle(
      fontSize: 18,
    )

    // Set your desired font color here
    );
