import 'package:flutter/material.dart';
import 'package:islami_app/features/quran_view/model/sura_info_model.dart';
import '../../../../core/resources_app.dart';
import '../../../../core/service/quran_service/quran_service.dart';
import '../../../soura_detailes_view/view/sura_details_view.dart';
import 'custom_build_most_resent_item.dart';

class CustomBuildMostResentView extends StatelessWidget {
  const CustomBuildMostResentView({super.key, required this.size, required this.onTap});
  final Function() onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
   final List<int> data = QuranService.loadSuraMostResent();
    return SizedBox(
      height: size.height * 0.17,
      child: data.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p32),
                child: Text(
                  "Welcome To My App Islami",
                  style: AppTextStyle.textS24Style.copyWith(
                    color: AppColor.goldColor,
                  ),
                  textAlign: .center,
                ),
              ),
            )
          : ListView.separated(
              scrollDirection: .horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              itemCount: data.length,
              itemBuilder: (_, index) {
                final SuraInfoModel sura=QuranService.getData(
                  data[index] - 1,
                );
                return GestureDetector(
                  onTap: () async{
                   await Navigator.pushNamed(
                      context,
                      SuraDetailsView.routeName,
                      arguments: sura
                    );
                   onTap();
                   },
                  child: CustomBuildMostResentQuranItem(
                    sura:sura,
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(width: AppPadding.p16);
              },
            ),
    );
  }
}
