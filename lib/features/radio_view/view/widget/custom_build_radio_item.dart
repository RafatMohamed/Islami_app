import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources_app.dart';
import '../../../../generated/assets.dart';

class CustomBuildBodyItemRadio extends StatelessWidget {
  const CustomBuildBodyItemRadio({
    super.key,
    required this.size,
    required this.title,
    required this.isRadio,
  });

  final Size size;
  final String title;
  final bool isRadio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppPadding.p16),
      padding: const EdgeInsetsGeometry.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p20,
      ),
      decoration: BoxDecoration(
        color: AppColor.goldColor,
        borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r20),
        image: DecorationImage(
          alignment: .bottomCenter,
          image: AssetImage(
            isRadio
                ? Assets.images.pngImages.backgroundItemRadio.path
                : Assets.images.pngImages.backgroundItemRecirtes.path,
          ),
          colorFilter: const ColorFilter.mode(AppColor.blackColor, .srcIn),
        ),
      ),
      alignment: .center,
      child: Column(
        children: [
          Text(
            isRadio ?"Radio $title":title,
            style: AppTextStyle.textS20Style.copyWith(
              color: AppColor.blackColor,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              SvgPicture.asset(Assets.icons.volumeCross.path),
              SvgPicture.asset(Assets.icons.playingIcon.path),
              SvgPicture.asset(Assets.icons.volumeIcon.path),
            ],
          ),
        ],
      ),
    );
  }
}
