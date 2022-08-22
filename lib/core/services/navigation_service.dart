import 'package:flutter/material.dart';

BuildContext get navigationContext => NavigationService.instance.navigatorKey.currentContext!;

class NavigationService {
  static final NavigationService instance = NavigationService._();

  NavigationService._();

  factory NavigationService() {
    return instance;
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState == null) return;
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceAndNavigateTo(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState == null) return;
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndReplaceEntireStack(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState == null) return;
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  void pop({String? routeName, Object? arguments}) async {
    if (navigatorKey.currentState == null) return;
    return navigatorKey.currentState!.pop(arguments);
  }
}