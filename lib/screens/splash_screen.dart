import 'package:flutter/material.dart';
import 'package:iml_task/utils/assets.dart';
import 'package:iml_task/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => RoutePage.navigator(
        context,
        mode: Mode.replace,
        moveTo: RouteName.homeScreen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.appLogo),
      ),
    );
  }
}
