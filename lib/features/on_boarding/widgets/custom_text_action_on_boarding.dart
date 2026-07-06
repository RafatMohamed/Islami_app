import 'package:flutter/material.dart';

import '../../../core/resources_app.dart';

class CustomTextActionOnBoarding extends StatelessWidget {
  const CustomTextActionOnBoarding({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p4),
        decoration: BoxDecoration(
            color: AppColor.grayColor,
            borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r16)
        ),
        child:  Text(
          text,
          style: AppTextStyle.textS16Style,
        ),
      ),
    );
  }
}
