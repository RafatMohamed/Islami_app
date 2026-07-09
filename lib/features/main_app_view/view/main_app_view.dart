import 'package:flutter/material.dart';
import 'package:islami_app/core/models/view_model_tabs.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/bottom_navigation_bar/widgets/bottom_nav_bar_widget.dart';
import 'package:islami_app/features/hadeth_view/view/hadeth_view.dart';
import 'package:islami_app/features/quran_view/view/quran_view.dart';
import 'package:islami_app/features/radio_view/view/radio_view.dart';
import 'package:islami_app/features/sebha_view/view/sebha_view.dart';
import 'package:islami_app/features/time_view/view/time_view.dart';

import '../widgets/custom_body_main_app.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});
  static const String routeName = "/${AppText.routeMainApp}";

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int currentIndex = 0;
  List<ViewModelTabs> tabsView = [
    ViewModelTabs(tabs: const QuranView(), backGroundImagePath: "quran"),
    ViewModelTabs(tabs: const HadethView(), backGroundImagePath: "hadeth"),
    ViewModelTabs(tabs: const SebhaView(), backGroundImagePath: "sebha"),
    ViewModelTabs(tabs: const RadioView(), backGroundImagePath: "radio"),
    ViewModelTabs(tabs: const TimeView(), backGroundImagePath: "time"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: .topStart,
        fit: .expand,
        children: [
          CustomBodyMainApp(tabsView: tabsView, currentIndex: currentIndex),
          Positioned(
            bottom: AppPadding.p20,
            right: AppPadding.p16,
            left: AppPadding.p16,
            child: BottomNavBarWidget(
              currentIndex: currentIndex,
              selectItemNav: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

