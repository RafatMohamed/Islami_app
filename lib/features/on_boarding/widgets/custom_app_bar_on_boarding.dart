import 'package:flutter/material.dart';

import '../../../core/resources_app.dart';
import '../../../generated/assets.dart';

class CustomAppBarOnBoarding extends StatelessWidget {
  const CustomAppBarOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Image.asset(Assets.images.pngImages.mosque01.path),
        const Text(AppText.appName, style: AppTextStyle.textSplashStyle),
      ],
    );
  }
}
