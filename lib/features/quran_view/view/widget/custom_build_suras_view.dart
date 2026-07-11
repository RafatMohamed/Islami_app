import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/soura_detailes_view/view/sura_details_view.dart';
import 'package:islami_app/generated/assets.dart';

import '../../model/sura_info_model.dart';

class CustomBuildSuraQuranView extends StatelessWidget {
  const CustomBuildSuraQuranView({super.key, required this.sura});

  final SuraInfoModel sura;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsView.routeName,arguments: sura);
      },
      child: Row(
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
      ),
    );
  }
}

class CustomBuildMostResentQuranView extends StatelessWidget {
  const CustomBuildMostResentQuranView({super.key, required this.sura});

  final SuraInfoModel sura;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsView.routeName,arguments: sura);
      },
      child:Container(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p10),
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
                    color: AppColor.blackColor
                  ),
                ),
                Text(
                  sura.nameAr.toString(),
                  style: AppTextStyle.textS24Style.copyWith(
                      color: AppColor.blackColor
                  ),
                ),
                Text(
                  "${sura.numVerse.toString()} Verses",
                  style: AppTextStyle.textS14Style.copyWith(
                      color: AppColor.blackColor
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/png_images/img_most_recent.png",color: Colors.black,)
          ],
        ),
      ),
    );
  }
}
