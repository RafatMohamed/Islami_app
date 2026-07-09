import 'package:flutter/material.dart';

import '../../../core/models/view_model_tabs.dart';
import '../../../core/widgets/custom_app_bar_on_boarding.dart';

class CustomBodyMainApp extends StatelessWidget {
  const CustomBodyMainApp({
    super.key,
    required this.tabsView,
    required this.currentIndex,
  });

  final List<ViewModelTabs> tabsView;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: .fill,
          image: AssetImage(
            "assets/images/png_images/background_${tabsView[currentIndex].backGroundImagePath}.png",
          ),
        ),
      ),
      child: Column(
        children: [
          const CustomAppBarAppText(),
          Expanded(child: tabsView[currentIndex].tabs),
        ],
      ),
    );
  }
}
