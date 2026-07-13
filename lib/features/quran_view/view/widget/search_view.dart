import 'package:flutter/material.dart';

import '../../../../core/resources_app.dart';
import '../../model/sura_info_model.dart';
import 'custom_build_suras_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.filteredSearch});
  final List<SuraInfoModel> filteredSearch;
  @override
  Widget build(BuildContext context) {
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
            AppText.searchResult,
            style: AppTextStyle.textS16Style.copyWith(
              color: AppColor.whiteColor,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20,),
            itemCount: filteredSearch.length,
            itemBuilder: (_, index) {
              return CustomBuildSuraQuranItem(sura: filteredSearch[index]);
            },
            separatorBuilder: (_, _) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ],
    );
  }
}
