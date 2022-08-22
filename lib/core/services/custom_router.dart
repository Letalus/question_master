import 'package:flutter/material.dart';
import 'package:question_master/ui/screens/explanation_screen.dart';
import 'package:question_master/ui/screens/question_screen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case QuestionScreen.routeName:
        return MaterialPageRoute(settings: settings, builder: (context) => const QuestionScreen());
      case ExplanationScreen.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const ExplanationScreen());
      default:
        return MaterialPageRoute(settings: settings, builder: (context) => const QuestionScreen());
    }
  }
}