import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/hadeth_service/hadeth_service.dart';
import 'package:islami_app/features/azkar_view/model/azkar_model.dart';
import 'package:islami_app/features/azkar_view/services/azkar_services.dart';
import 'package:islami_app/features/azkar_view/view/widget/custom_build_hadeth_view.dart';
import 'package:islami_app/features/hadeth_detailes_view/view/sura_details_view.dart';
import 'package:islami_app/features/hadeth_view/model/hadeth_model.dart';

class AzkarView extends StatefulWidget {
  static const String routeName = "/${AppText.azkarViewApp}";

  const AzkarView({super.key});

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:FutureBuilder(
        future: AzkarServices.getZekr("أذكار الصباح"),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            log(snapshot.error.toString());
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: AppTextStyle.textS20Style,
              ),
            );
          }
          final resultData = snapshot.data;



          return CustomBuildAzkarCardView(
            zekr:resultData![6],
          );
        },
      ),
    );
  }
}
