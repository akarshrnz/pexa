import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
    );
  }

  Future<dynamic>? navigateToReplace(String routeName) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
    );
  }

  Future<dynamic>? navigateToWithArgs(String routeName, dynamic arguments) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? navigateToPage(String routeName) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  Future<void> popUntil(String routeName) async {
    try {
      navigatorKey.currentState?.popUntil(
        (route) => route.settings.name == routeName,
      );
    } catch (e) {}
  }

  Future<dynamic>? navigateToPageWithArgs(String routeName, dynamic arguments) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<dynamic>? navigateToPageWithArgss(String routeName, dynamic arguments) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
