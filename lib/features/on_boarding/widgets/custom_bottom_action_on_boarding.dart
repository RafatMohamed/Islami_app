import 'package:flutter/material.dart';
import '../../../core/resources_app.dart';
import '../model/on_boarding_model.dart';
import 'custom_text_action_on_boarding.dart';

class CustomBottomActionOnBoarding extends StatelessWidget {
  const CustomBottomActionOnBoarding({
    super.key,
    required this.itemsOnBoarderList,
    required this.currentIndex, required this.onTapNext, required this.onTapBack,
  });

  final List<OnBoardingModel> itemsOnBoarderList;
  final int currentIndex;
  final Function() onTapNext;
  final Function() onTapBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .end,
      children: [
        Visibility(
          visible: currentIndex != 0,
          child: CustomTextActionOnBoarding(
            text: AppText.back,
            onTap: onTapBack,
          ),
        ),
        Row(
          children: List.generate(itemsOnBoarderList.length, (index) {
            final isSelected = currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isSelected ? 28 : 12,
              height: 12,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.goldColor : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
        CustomTextActionOnBoarding(
          text:currentIndex != itemsOnBoarderList.length-1? AppText.next: AppText.finish,
          onTap: onTapNext,
        ),
      ],
    );
  }
}
