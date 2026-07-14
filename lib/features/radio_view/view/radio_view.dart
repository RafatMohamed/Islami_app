import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/radio_view/view/widget/radio_view_body.dart';

class RadioView extends StatelessWidget {
  static const String routeName = "/${AppText.radioViewApp}";
  const RadioView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: RadioBodyView(),
    );
  }
}
