import 'package:flutter/material.dart';

import '../../../core/resources_app.dart';
import '../model/on_boarding_model.dart';

class CustomBodyInfoOnBoarding extends StatelessWidget {
  const CustomBodyInfoOnBoarding({
    super.key,
    required this.item,
    required this.size,
  });

  final OnBoardingModel item;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Image.asset(
          "assets/images/png_images/${item.imagePath}.png",
          height: size.height * 0.3,
        ),
        Text(
          item.label,
          style: AppTextStyle.textS24Style,
        ),
        Visibility(
          visible: item.desc!.isNotEmpty,
          child: Text(
            item.desc!,
            textAlign: TextAlign.center,
            style: AppTextStyle.textS20Style,
          ),
        ),
      ],
    );
  }
}
