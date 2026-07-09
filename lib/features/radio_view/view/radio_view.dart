import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';

class RadioView extends StatelessWidget {
  static const String routeName = "/${AppText.radioViewApp}";
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Radio",style: AppTextStyle.textLabelNavBarStyle,),
    );
  }
}
