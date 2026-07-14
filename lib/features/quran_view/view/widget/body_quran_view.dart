import 'package:flutter/material.dart';
import '../../../../core/resources_app.dart';
import 'custom_most_resent_view.dart';
import 'custom_sura_list_view.dart';

class BodyQuranView extends StatefulWidget {
  const BodyQuranView({super.key});

  @override
  State<BodyQuranView> createState() => _BodyQuranViewState();
}

class _BodyQuranViewState extends State<BodyQuranView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p10,
            bottom: AppPadding.p10,
            left: AppPadding.p20,
          ),
          child: Text(
            textAlign: .start,
            AppText.mostResent,
            style: AppTextStyle.textS16Style.copyWith(
              color: AppColor.whiteColor,
            ),
          ),
        ),
        CustomBuildMostResentView(size: size,onTap:rebuildUI,),
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p10,
            bottom: AppPadding.p10,
            left: AppPadding.p20,
          ),
          child: Text(
            textAlign: .start,
            AppText.suraList,
            style: AppTextStyle.textS16Style.copyWith(
              color: AppColor.whiteColor,
            ),
          ),
        ),
         CustomBuildSurasList(onTap: rebuildUI,),
      ],
    );
  }

  void rebuildUI(){
    setState(() {

    });
  }
}


