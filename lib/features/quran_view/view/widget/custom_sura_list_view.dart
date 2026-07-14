import 'package:flutter/material.dart';
import '../../../../core/resources_app.dart';
import '../../../../core/service/quran_service/quran_service.dart';
import '../../../soura_detailes_view/view/sura_details_view.dart';
import '../../model/sura_info_model.dart';
import 'custom_build_suras_item.dart';

class CustomBuildSurasList extends StatelessWidget {
  const CustomBuildSurasList({
    super.key, required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: .vertical,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        itemCount: QuranService.getNumbersSura(),
        itemBuilder: (_, index) {
          final SuraInfoModel sura=QuranService.getData(index);
          return GestureDetector(
            onTap: () async{
              await Navigator.pushNamed(
                  context,
                  SuraDetailsView.routeName,
                  arguments: sura
              );
              onTap();
            },
            child: CustomBuildSuraQuranItem(
              sura: sura,
            ),
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
    );
  }
}
