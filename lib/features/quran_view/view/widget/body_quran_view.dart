import 'package:flutter/material.dart';
import 'package:islami_app/core/shared/shared_pref_hive.dart';
import '../../../../core/resources_app.dart';
import '../../../../core/service/quran_service/quran_service.dart';
import 'custom_build_suras_view.dart';

class BodyQuranView extends StatelessWidget {
  const BodyQuranView({super.key});
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
        CustomBuildMostResentView(size: size),
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
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: .vertical,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            itemCount: QuranService.getNumbersSura(),
            itemBuilder: (_, index) {
              return CustomBuildSuraQuranView(
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

class CustomBuildMostResentView extends StatefulWidget {
  const CustomBuildMostResentView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CustomBuildMostResentView> createState() => _CustomBuildMostResentViewState();
}

class _CustomBuildMostResentViewState extends State<CustomBuildMostResentView> {
  @override
  void setState(VoidCallback fn) {
    SharedPrefHiveImp.loadSuraMostResent();
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.17,
      child: SharedPrefHiveImp.loadSuraMostResent().isEmpty
          ? Center(
              child: Text(
                "Welcome ",
                style: AppTextStyle.textS24Style.copyWith(
                  color: AppColor.whiteColor,
                ),
                textAlign: .center,
              ),
            )
          : ListView.separated(
              scrollDirection: .horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
              ),
              itemCount: SharedPrefHiveImp.loadSuraMostResent().length,
              itemBuilder: (_, index) {
                return CustomBuildMostResentQuranView(
                  sura: QuranService.getData(
                    SharedPrefHiveImp.loadSuraMostResent()[index] - 1,
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
