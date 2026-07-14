import 'package:flutter/material.dart';

import '../../../../core/resources_app.dart';

class CustomBuildTabRadio extends StatelessWidget {
  const CustomBuildTabRadio({
    super.key,
    required this.size,
    required this.title,
    required this.isSelected,
  });

  final Size size;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5 - AppPadding.p20,
      padding: const EdgeInsetsGeometry.symmetric(vertical: AppPadding.p8),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.goldColor : Colors.transparent,
        borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r12),
        border: Border.all(
          color: AppColor.blackColor.withValues(alpha: 0.4),
          style: .solid,
        ),
      ),
      alignment: .center,
      child: Text(
        title,
        style: AppTextStyle.textS16Style.copyWith(
          color: isSelected ? AppColor.blackColor : AppColor.whiteColor,
        ),
      ),
    );
  }
}
