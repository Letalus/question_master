import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static final AppLocales locale =  AppLocales();
}

class AppLocales {
  final List<Locale> supportedLocales = const [Locale('en'), Locale('de')];
  final String localesPath = 'assets/translations';
  final Locale fallbackLocale = const Locale('en');
}