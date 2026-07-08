import 'package:flutter/material.dart';
import 'package:islami_app/core/models/view_model_tabs.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/bottom_navigation_bar/widgets/bottom_nav_bar_widget.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});
  static const String routeName ="/${AppText.routeMainApp}";

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int currentIndex = 0;
  List<ViewModelTabs> tabsView=[

  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(
          index: currentIndex,
          children: const [
            Scaffold(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
          ],
        ),
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
    );
  }
}
