import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/hadeth_service/hadeth_service.dart';
import 'package:islami_app/features/hadeth_view/model/hadeth_model.dart';
import 'package:islami_app/features/hadeth_view/view/widget/custom_build_hadeth_view.dart';

class HadethView extends StatefulWidget {
  static const String routeName = "/${AppText.hadethViewApp}";

  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  int currentIndex = 1;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.7, initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: .topCenter,
        color: Colors.transparent,
        height: size.height * 0.72,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: HadethService.getNumbersHadeth(),
          itemBuilder: (context, index) {
          final bool  isSelected = currentIndex == index;
            return FutureBuilder(
              future: HadethService.readData(index),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: AppTextStyle.textS20Style,
                    ),
                  );
                }
                final resultData = snapshot.data;
                return CustomBuildHadethCardView(
                  isSelected: isSelected,
                  hadeth: HadethModel(
                    title: resultData![0].toString(),
                    content: resultData[1].toString(),
                    lastHadeth: resultData[2].toString(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
