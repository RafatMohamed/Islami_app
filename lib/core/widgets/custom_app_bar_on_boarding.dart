import 'package:flutter/material.dart';

import '../resources_app.dart';
import '../../generated/assets.dart';

class CustomAppBarAppText extends StatelessWidget {
  const CustomAppBarAppText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.sizeOf(context);
    return Stack(
      alignment: .bottomCenter,
      children: [
        Image.asset(Assets.images.pngImages.mosque01.path,height:size.height*0.15,width:size.width*0.75,fit: .fill,),
        const Text(AppText.appName, style: AppTextStyle.textSplashStyle),
      ],
    );
  }
}
