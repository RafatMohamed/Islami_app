import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/shared/shared_pref_hive.dart';
import 'package:islami_app/features/quran_view/model/sura_info_model.dart';
import 'package:islami_app/features/soura_detailes_view/view/widget/custom_body_sura_details_view.dart';

class SuraDetailsView extends StatefulWidget {
  static const String routeName = "/${AppText.suraDetailsViewApp}";
  const SuraDetailsView({super.key, required this.sura});
  final SuraInfoModel sura;
  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}


class _SuraDetailsViewState extends State<SuraDetailsView> {
  @override
  void initState() {
    SharedPrefHiveImp.saveSuraMostResent(widget.sura.numberSura);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sura.nameEN)),
      body: CustomBodySuraDetails(sura:widget.sura),
    );
  }
}
