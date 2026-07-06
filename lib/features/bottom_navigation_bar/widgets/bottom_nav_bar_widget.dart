import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import '../model/bottom_nav_bar_model.dart';
import 'custom_bottom_navigation_bar_item.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.currentIndex, required this.selectItemNav});

  final int currentIndex ;
  final Function(int) selectItemNav;
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarModel> itemsNavList = [
      BottomNavigationBarModel(
        iconPath: "quran",
        label: AppText.quran,
      ),
      BottomNavigationBarModel(
        iconPath: "hadeth",
        label: AppText.hadeth,
      ),
      BottomNavigationBarModel(
        iconPath: "sebha",
        label: AppText.sebha,
      ),
      BottomNavigationBarModel(
        iconPath: "radio",
        label: AppText.radio,
      ),
      BottomNavigationBarModel(
        iconPath: "time",
        label: AppText.time,
      ),
    ];

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r16),
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(AppPadding.p8),
        color: AppColor.goldColor,
        child: Row(
          mainAxisAlignment: .spaceAround,
          children: itemsNavList.map((item) {
           final int index = itemsNavList.indexOf(item);
           bool isSelected= currentIndex==index;
            return GestureDetector(
              onTap: () {
                selectItemNav(index);
              },
              child:
              isSelected? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBuildIconNavBar(
                    item: item,
                    isSelected: isSelected,
                  ),
                  Text(
                    item.label,
                    style: AppTextStyle.textLabelNavBarStyle,
                  ),
                ],
              )
                  : CustomBuildIconNavBar(
                item: item,
                isSelected: false,
              ),
            );
          },).toList(),
        ),
      ),
    );
  }
}

