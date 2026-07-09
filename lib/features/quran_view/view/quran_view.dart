import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/quran_service/quran_service.dart';
import 'package:islami_app/features/quran_view/view/widget/custom_build_suras_view.dart';

class QuranView extends StatelessWidget {
  static const String routeName = "/${AppText.quranViewApp}";
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding:  const EdgeInsets.only(
            top: AppPadding.p10,
            bottom: AppPadding.p10,
            left: AppPadding.p20
          ),
          child: Text(
            textAlign: .start,
            AppText.suraList,
            style: AppTextStyle.textS16Style.copyWith(color: AppColor.whiteColor),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding:const EdgeInsets.symmetric(horizontal: AppPadding.p20) ,
            itemCount: QuranService.getNumbersSura(),
              itemBuilder: (_, index) {
                return  CustomBuildSuraQuranView(
                  sura: QuranService.getData(index),
                );
              },
            separatorBuilder: (_, index) {
              return const Divider(
                height: 16,
                color: AppColor.whiteColor,
                indent: 44,
                endIndent: 44,
              );
            },
          ),
        ),
      ],
    );
  }
}

