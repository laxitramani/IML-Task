import 'package:flutter/material.dart';
import 'package:iml_task/screens/detail_screen.dart';
import 'package:iml_task/screens/home_screen.dart';
import 'package:iml_task/screens/splash_screen.dart';

enum Mode { push, replace, remove }

class RouteName {
  static const String splashScreen = "/splashScreen";
  static const String homeScreen = "/homeScreen";
  static const String detailScreen = "/detailScreen";
}

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteName.splashScreen: (context) => const SplashScreen(),
    RouteName.homeScreen: (context) => const HomeScreen(),
    RouteName.detailScreen: (context) => const DetailScreen(),
  };
}

class RoutePage {
  static navigator(
    BuildContext context, {
    required Mode mode,
    required String moveTo,
    var bundle,
  }) {
    switch (mode) {
      case Mode.push:
        Navigator.of(context).pushNamed(moveTo, arguments: bundle);
        break;
      case Mode.replace:
        Navigator.of(context).pushReplacementNamed(moveTo, arguments: bundle);
        break;
      case Mode.remove:
        Navigator.of(context).pushNamedAndRemoveUntil(
            moveTo, (Route<dynamic> route) => false,
            arguments: bundle);
        break;
    }
  }

  static backNavigator(BuildContext context, {var argument}) async {
    Navigator.of(context).pop(argument);
  }
}
