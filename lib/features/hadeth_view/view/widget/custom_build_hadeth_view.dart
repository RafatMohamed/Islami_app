import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/hadeth_service/hadeth_service.dart';
import 'package:islami_app/features/hadeth_view/model/hadeth_model.dart';
import 'package:islami_app/features/soura_detailes_view/view/sura_details_view.dart';
import 'package:islami_app/generated/assets.dart';

class CustomBuildHadethCardView extends StatelessWidget {
  const CustomBuildHadethCardView({super.key,required this.isSelected, required this.hadeth});
  final bool isSelected;
 final HadethModel hadeth;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Align(
      alignment: .bottomCenter,
      child: AnimatedContainer(
        alignment: .topCenter,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        margin: const EdgeInsets.only(right: AppPadding.p16),
        padding: const EdgeInsets.all(AppPadding.p10),
        height: isSelected
            ? size.height * 0.7
            : size.height * 0.6,
        width: size.width*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r24),
          color: AppColor.goldColor,
          image: DecorationImage(
            image: AssetImage(
              Assets.images.pngImages.hadithCardBackGround.path,
            ),
            fit: .fill,
            opacity: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    Assets.images.pngImages.imgLeftCornerHome.path,
                    color: AppColor.blackColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    hadeth.title,
                    style: AppTextStyle.textS20Style.copyWith(
                      color: AppColor.blackColor,
                    ),
                    textDirection: .rtl,
                    textAlign: .center,
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    Assets.images.pngImages.imgRightCornerDetails.path,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  hadeth.content,
                  textAlign: .center,
                  style: AppTextStyle.textS16Style.copyWith(
                    color: AppColor.blackColor,
                  ),
                  softWrap: true,
                  textDirection: .rtl,
                ),
              ),
            ),
            Image.asset(
              Assets.images.pngImages.mosque02.path,
              height: 50,
              width: size.width,
              alignment: .bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
