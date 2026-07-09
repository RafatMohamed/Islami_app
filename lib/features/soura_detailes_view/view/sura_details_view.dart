import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/quran_view/model/sura_info_model.dart';
import 'package:islami_app/features/soura_detailes_view/view/widget/custom_body_sura_details_view.dart';

class SuraDetailsView extends StatelessWidget {
  static const String routeName = "/${AppText.suraDetailsViewApp}";
  const SuraDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
  final SuraInfoModel sura= ModalRoute.of(context)!.settings.arguments as SuraInfoModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sura.nameEN,
        ),
      ),
      body: CustomBodySuraDetails(
        sura: sura,
      ),
    );
  }
}
