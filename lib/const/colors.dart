import 'package:flutter/material.dart';

class ThemeColors{
  ThemeColors._();

  static final QMTextColor text = QMTextColor();
  static final QMBaseColor base = QMBaseColor();
}

class QMTextColor{
  final Color fontColor = const Color(0xFF101010);
}

class QMBaseColor {
  final Color primary = const Color(0xFF00AD86);
  final Color primaryDark = const Color(0xFF00C69E);
}