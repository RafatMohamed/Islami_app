import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import '../widgets/body_on_boarding_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = "/${AppText.routeOnBoardingApp}";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(bottom: false,child: BodyOnBoardingView()),
    );
  }
}
