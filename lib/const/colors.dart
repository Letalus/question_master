import 'package:flutter/material.dart';

class ThemeColors{
  ThemeColors._();

  static final QMTextColor text = QMTextColor();
  static final QMBaseColor base = QMBaseColor();
  static final QMButtonColor button = QMButtonColor();
}

class QMTextColor{
  final Color fontColor = const Color(0xFF101010);
  final Color fontWhite = const Color(0xFFFFFFFF);
}

class QMBaseColor {
  final Color primary = const Color(0xFF00AD86);
  final Color primaryDark = const Color(0xFF00C69E);
}

class QMButtonColor {
  final Color grey = Colors.grey;
}