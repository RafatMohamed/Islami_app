import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app/core/shared/shared_pref_hive.dart';
import '../../../../core/resources_app.dart';
import 'custom_build_radio_item.dart';
import 'custom_build_tab_radio.dart';

class RadioBodyView extends StatefulWidget {
  const RadioBodyView({super.key});
  @override
  State<RadioBodyView> createState() => _RadioBodyViewState();
}

class _RadioBodyViewState extends State<RadioBodyView> {
  final bool isSelected = true;
  List<String> tapRadioList = [AppText.radio, AppText.reciters];
  List<String> radio = [
    "Ibrahim Al-Akdar",
    "Al-Qaria Yassen",
    "Ahmed Al-trabulsi",
    "Addokali Mohammad Alalim",
  ];
  List<String> reciters = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
  ];
  int currentIndexTap = 0;
  int currentIndexPLay = -1;
  double volume=0.5;
  void play(index){
    if(currentIndexPLay==index){
      currentIndexPLay =-1;
    }else{
      currentIndexPLay=index;
    }
    setState(() {});
  }
  void increaseVolume(){
    if(volume>=1) return ;
    volume+=0.1;
    log(volume.toString());
  }
  void decreaseVolume(){
    if(volume<=0) return ;
    volume-=0.1;
    log(volume.toString());
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    List<dynamic> currentList = currentIndexTap==0 ? radio : reciters;
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          alignment: .centerStart,
          decoration: BoxDecoration(
            color: AppColor.blackColor.withValues(alpha: 0.7),
            borderRadius: BorderRadiusGeometry.circular(AppBorderRadius.r12),
          ),
          child: ListView.builder(
            itemCount: tapRadioList.length,
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndexTap = index;
                    SharedPrefHiveImp.instance.clearObj();
                  });
                },
                child: CustomBuildTabRadio(
                  size: size,
                  title: tapRadioList[index],
                  isSelected: currentIndexTap == index,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: ListView.builder(
            itemCount: currentList.length,
            itemBuilder: (context, index) {
              return CustomBuildBodyItemRadio(
                size: size,
                title: currentList[index],
                isRadio: currentIndexTap == 0,
                isPlaying: currentIndexPLay==index,
                play: () => play(index),
                increaseVolume: () {
                  increaseVolume();
                },
                decreaseVolume: (){
                  decreaseVolume();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}


