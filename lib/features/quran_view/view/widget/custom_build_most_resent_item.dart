import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import '../../model/sura_info_model.dart';

class CustomBuildMostResentQuranItem extends StatelessWidget {
  const CustomBuildMostResentQuranItem({super.key, required this.sura});

  final SuraInfoModel sura;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p10,
      ),
      decoration: BoxDecoration(
        color: AppColor.goldColor,
        borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                sura.nameEN.toString(),
                style: AppTextStyle.textS24Style.copyWith(
                  color: AppColor.blackColor,
                ),
              ),
              Text(
                sura.nameAr.toString(),
                style: AppTextStyle.textS24Style.copyWith(
                  color: AppColor.blackColor,
                ),
              ),
              Text(
                "${sura.numVerse.toString()} Verses",
                style: AppTextStyle.textS14Style.copyWith(
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/png_images/img_most_recent.png",
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
