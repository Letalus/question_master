import 'package:flutter/material.dart';
import 'package:question_master/const/colors.dart';

class AppConstants {
  AppConstants._();

  static final AppLocales locale = AppLocales();
  static final AppTheme theme = AppTheme();
  static const bool isTest = true;
}

class AppLocales {
  final List<Locale> supportedLocales = const [Locale('en'), Locale('de')];
  final String localesPath = 'assets/translations';
  final Locale fallbackLocale = const Locale('en');
}

class AppTheme {
  final ThemeData light = ThemeData.light().copyWith(
      primaryColor: ThemeColors.base.primary,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 20, color: ThemeColors.text.fontColor)),
      appBarTheme: AppBarTheme(color: ThemeColors.base.primary),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(primary: ThemeColors.base.primary), buttonColor: ThemeColors.base.primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.base.primary))));
  final ThemeData dark = ThemeData.dark().copyWith(
      primaryColor: ThemeColors.base.primaryDark,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 20, color: ThemeColors.text.fontWhite)),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(primary: ThemeColors.base.primaryDark),
          buttonColor: ThemeColors.base.primaryDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.base.primaryDark))));
}
