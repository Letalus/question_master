import 'package:flutter/material.dart';
import 'package:question_master/ui/screens/explain_screen.dart';
import 'package:question_master/ui/screens/question_screen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case QuestionScreen.routeName:
        return MaterialPageRoute(settings: settings, builder: (context) => const QuestionScreen());
      case ExplainScreen.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const ExplainScreen());
      default:
        return MaterialPageRoute(settings: settings, builder: (context) => const QuestionScreen());
    }
  }
}