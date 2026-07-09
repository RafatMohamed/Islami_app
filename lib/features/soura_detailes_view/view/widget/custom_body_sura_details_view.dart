import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/quran_service/quran_service.dart';
import 'package:islami_app/features/quran_view/model/sura_info_model.dart';

import '../../../../generated/assets.dart';

class CustomBodySuraDetails extends StatefulWidget {
  const CustomBodySuraDetails({super.key, required this.sura});
  final SuraInfoModel sura;

  @override
  State<CustomBodySuraDetails> createState() => _CustomBodySuraDetailsState();
}

class _CustomBodySuraDetailsState extends State<CustomBodySuraDetails> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Image.asset(Assets.images.pngImages.imgLeftCornerHome.path,height:100,width: 100,),
              Text(widget.sura.nameAr,style: AppTextStyle.textS24Style,),
              Image.asset(Assets.images.pngImages.imgRightCornerDetails.path,height:100,width: 100,),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future:QuranService.readData(widget.sura.numberSura),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.hasError){
                  return   Center(
                    child: Text(snapshot.error.toString(),style: AppTextStyle.textS20Style,),
                  );
                }
               final resultData = snapshot.data;
                return Text(
                  resultData!.asMap().entries.map((e) {
                    return "( ${e.key + 1} ) ${e.value}";
                  },).join(""),
                  style: AppTextStyle.textS20Style,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                );
              }
            ),
          )
        ],
      )
    );
  }
}
