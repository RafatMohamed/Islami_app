import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';

class TimeView extends StatelessWidget {
  static const String routeName = "/${AppText.timeViewApp}";
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Time",style: AppTextStyle.textLabelNavBarStyle,),
    );
  }
}
