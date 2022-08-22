import 'package:flutter/material.dart';
import 'package:question_master/const/colors.dart';

class AppConstants {
  AppConstants._();

  static final AppLocales locale = AppLocales();
  static final AppTheme theme = AppTheme();
}

class AppLocales {
  final List<Locale> supportedLocales = const [Locale('en'), Locale('de')];
  final String localesPath = 'assets/translations';
  final Locale fallbackLocale = const Locale('en');
}

class AppTheme {
  final ThemeData light = ThemeData.light().copyWith(
      primaryColor: ThemeColors.base.primary,
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(primary: ThemeColors.base.primary), buttonColor: ThemeColors.base.primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.base.primary))));
  final ThemeData dark = ThemeData.dark().copyWith(
      primaryColor: ThemeColors.base.primaryDark,
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(primary: ThemeColors.base.primaryDark),
          buttonColor: ThemeColors.base.primaryDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.base.primaryDark))));
}
