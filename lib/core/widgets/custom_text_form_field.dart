import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/generated/assets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.onChanged,
  });
  final TextEditingController? controller;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      controller: controller,
      onChanged: onChanged,
      keyboardType: .text,
      textInputAction: .done,
      style: AppTextStyle.textS16Style,
      cursorColor: AppColor.goldColor,
      decoration: InputDecoration(
        fillColor: AppColor.blackColor.withValues(alpha: 0.6),
        filled: true,
        hintText: AppText.suraName,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        prefixIcon: SvgPicture.asset(Assets.icons.quran.path, fit: .scaleDown,colorFilter: const ColorFilter.mode(AppColor.goldColor, .srcIn),),
        hintStyle: AppTextStyle.textS16Style,
        border: buildOutlineInputBorderActive(),
        enabledBorder: buildOutlineInputBorderActive(),
        focusedBorder: buildOutlineInputBorderActive(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorderActive() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.r16),
      borderSide: const BorderSide(
        color: AppColor.goldColor,
        width: 2,
        style: .solid,
      ),
    );
  }
}
