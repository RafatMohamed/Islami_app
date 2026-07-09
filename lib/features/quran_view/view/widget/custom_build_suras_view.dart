import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/generated/assets.dart';

import '../../model/sura_info_model.dart';

class CustomBuildSuraQuranView extends StatelessWidget {
  const CustomBuildSuraQuranView({super.key, required this.sura});

  final SuraInfoModel sura;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: .center,
          children: [
            SvgPicture.asset(Assets.icons.iconNumSura.path, fit:.cover ,),
            Text(
              sura.numberSura.toString(),
              style: AppTextStyle.textS16Style.copyWith(
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              sura.nameEN.toString(),
              style: AppTextStyle.textS20Style.copyWith(color: AppColor.whiteColor),
            ),
            Text(
              sura.numVerse.toString(),
              style: AppTextStyle.textS14Style.copyWith(color: AppColor.whiteColor),
            ),
          ],
        ),
        const Spacer(),
        Text(sura.nameAr.toString(),style: AppTextStyle.textS20Style.copyWith(
            color: AppColor.whiteColor
        ),)
      ],
    );
  }
}
