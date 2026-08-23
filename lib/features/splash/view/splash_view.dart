import 'package:flutter/material.dart';
import '../widgets/body_splash_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = "/SplashView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySplashView(),
    );
  }
}
