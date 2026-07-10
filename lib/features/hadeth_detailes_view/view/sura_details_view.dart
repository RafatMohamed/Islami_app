import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/hadeth_detailes_view/view/widget/custom_body_sura_details_view.dart';
import 'package:islami_app/features/hadeth_view/model/hadeth_model.dart';

class HadethDetailsView extends StatelessWidget {
  static const String routeName = "/${AppText.hadethDetailsViewApp}";
  const HadethDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
  final HadethModel hadeth= ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hadeth ${hadeth.numHadeth!+1}",
        ),
      ),
      body: CustomBodyHadethDetails(
        hadeth: hadeth,
      ),
    );
  }
}
