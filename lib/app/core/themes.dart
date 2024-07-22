import 'package:flutter/material.dart';
import 'package:news_shots_app/app/core/colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: "Inter",
      textTheme: appTextTheme,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
      scaffoldBackgroundColor: AppColors.white,
      expansionTileTheme: ExpansionTileThemeData(
        collapsedShape: RoundedRectangleBorder(
            side: const BorderSide(), borderRadius: BorderRadius.circular(14)),
        shape: RoundedRectangleBorder(
            side: const BorderSide(), borderRadius: BorderRadius.circular(14)),
      ),
      useMaterial3: true,
      canvasColor: AppColors.white,
      cardTheme: const CardTheme(color: AppColors.white));

  static ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
            side: const BorderSide(), borderRadius: BorderRadius.circular(14))),
    scaffoldBackgroundColor: AppColors.background,
    canvasColor: AppColors.surface,
    cardColor: AppColors.cardDark,
    cardTheme: const CardTheme(color: AppColors.background),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
    ),
    textTheme: appTextDarkTheme,
  );
}
