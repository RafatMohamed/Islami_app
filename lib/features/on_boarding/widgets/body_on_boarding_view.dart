import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/main_app_view/view/main_app_view.dart';
import 'package:islami_app/features/on_boarding/model/on_boarding_model.dart';
import '../../../core/shared/shared_pref_hive.dart';
import '../../../core/widgets/custom_app_bar_on_boarding.dart';
import 'custom_bottom_action_on_boarding.dart';
import 'custom_info_view_body_on_board.dart';
import 'custom_text_action_on_boarding.dart';

class BodyOnBoardingView extends StatefulWidget {
  const BodyOnBoardingView({super.key});

  @override
  State<BodyOnBoardingView> createState() => _BodyOnBoardingViewState();
}

class _BodyOnBoardingViewState extends State<BodyOnBoardingView> {
  late ScrollController controller;
  int currentIndex = 0;
  @override
  void initState() {
    controller = ScrollController(initialScrollOffset: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    List<OnBoardingModel> itemsOnBoarderList = [
      OnBoardingModel(
        label: AppText.label12ONBoarding,
        desc: "",
        imagePath: "onBoarding1",
      ),
      OnBoardingModel(
        label: AppText.label12ONBoarding,
        desc: AppText.desc2ONBoarding,
        imagePath: "onBoarding2",
      ),
      OnBoardingModel(
        label: AppText.label3ONBoarding,
        desc: AppText.desc3ONBoarding,
        imagePath: "onBoarding3",
      ),
      OnBoardingModel(
        label: AppText.label4ONBoarding,
        desc: AppText.desc4ONBoarding,
        imagePath: "onBoarding4",
      ),
      OnBoardingModel(
        label: AppText.label5ONBoarding,
        desc: AppText.desc5ONBoarding,
        imagePath: "onBoarding5",
      ),
    ];

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            const Expanded(child: CustomAppBarAppText()),

            Expanded(
              flex: 3,
              child: ListView.builder(
                controller: controller,
                itemCount: itemsOnBoarderList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = itemsOnBoarderList[index];
                  return SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16,
                      ),
                      child: Column(
                        mainAxisAlignment: .spaceBetween,
                        children: [

                          Expanded(
                            flex: 3,
                            child: CustomBodyInfoOnBoarding(item: item, size: size),
                          ),

                          Expanded(
                            child: CustomBottomActionOnBoarding(
                              itemsOnBoarderList: itemsOnBoarderList,
                              currentIndex: currentIndex,
                              onTapBack:() {
                                onTapAction(size: size,isNext: false);
                              } ,
                              onTapNext:() {
                                onTapAction(size: size,isFinish: currentIndex==itemsOnBoarderList.length-1);
                              } ,
                              onClickDots: (index) {
                                onTapDots(size: size,index: index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Padding(padding: EdgeInsetsGeometry.only(bottom: AppPadding.p16)),
          ],
        ),
        Positioned(
          right: AppPadding.p16,
          top: AppPadding.p24,
          child: Visibility(
            visible: currentIndex != itemsOnBoarderList.length - 1,
            child: CustomTextActionOnBoarding(
              text: AppText.skip,
              onTap: () {
                SharedPrefHiveImp.instance.saveObj(true);
                Navigator.pushReplacementNamed(context, MainAppView.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }

  void onTapAction({required Size size, final bool isNext = true,bool isFinish=false})async{
    if(isFinish){
      SharedPrefHiveImp.instance.saveObj(true);
      await Navigator.pushReplacementNamed(context, MainAppView.routeName);
    }
    isNext?currentIndex++:currentIndex--;
    setState(() {
      controller.animateTo(currentIndex*size.width, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }
  void onTapDots({required final Size size,required final int index})async{
    setState(() {
      currentIndex=index;
      controller.animateTo(currentIndex*size.width, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }
}
