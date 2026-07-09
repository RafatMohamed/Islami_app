import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';

class SebhaView extends StatelessWidget {
  static const String routeName = "/${AppText.sebhaViewApp}";
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Sebha",style: AppTextStyle.textLabelNavBarStyle,),
    );
  }
}
