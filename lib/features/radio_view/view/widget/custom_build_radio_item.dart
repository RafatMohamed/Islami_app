import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources_app.dart';
import '../../../../generated/assets.dart';

class CustomBuildBodyItemRadio extends StatelessWidget {
  const CustomBuildBodyItemRadio({
    super.key,
    required this.size,
    required this.title,
    required this.isRadio,
    required this.play,
    required this.increaseVolume,
    required this.decreaseVolume,
    required this.isPlaying,
  });

  final Size size;
  final String title;
  final bool isRadio;
  final bool isPlaying;
  final Function() play;
  final Function() increaseVolume;
  final Function() decreaseVolume;

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
            isRadio ? "Radio $title" : title,
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
              GestureDetector(
                onTap: decreaseVolume,
                child:CustomButtonRadioPlay(icon:Assets.icons.volumeDownIcon.path,isDecreaseVolume: true,),
              ),
              GestureDetector(
                onTap: play,
                child: isPlaying? CustomButtonRadioPlay(icon: Assets.icons.pauseCircleIcon.path,):CustomButtonRadioPlay(icon: Assets.icons.playCircleIcon.path,),
              ),
              GestureDetector(
                onTap: increaseVolume,
                child: CustomButtonRadioPlay(icon: Assets.icons.volumeUpIcon.path,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButtonRadioPlay extends StatelessWidget {
  const CustomButtonRadioPlay({
    super.key, required this.icon, this.isDecreaseVolume=false
  });
  final String icon;
  final bool isDecreaseVolume;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle:isDecreaseVolume?3.15:0,child: SvgPicture.asset(icon,colorFilter: ColorFilter.mode(AppColor.blackColor, .srcIn),fit: .cover,width: 35));
  }
}
