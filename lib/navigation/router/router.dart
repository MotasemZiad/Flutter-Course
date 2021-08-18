import 'package:flutter/cupertino.dart';

class AppRouter {
  AppRouter._();
  static AppRouter router = AppRouter._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
