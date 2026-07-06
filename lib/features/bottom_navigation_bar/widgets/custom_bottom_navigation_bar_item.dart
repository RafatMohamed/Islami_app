import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/resources_app.dart';
import '../model/bottom_nav_bar_model.dart';

class CustomBuildIconNavBar extends StatelessWidget {
  const CustomBuildIconNavBar({
    super.key, required this.item,this.isSelected=true,
  });

  final BottomNavigationBarModel item;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p4),
      decoration: BoxDecoration(
        color:isSelected? AppColor.brownColor:Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(
        height: 25,
        "assets/icons/${item.iconPath}.svg",
        fit: BoxFit.contain,
        colorFilter:  ColorFilter.mode(isSelected?AppColor.whiteColor:AppColor.blackColor, BlendMode.srcIn),
      ),
    );
  }
}
