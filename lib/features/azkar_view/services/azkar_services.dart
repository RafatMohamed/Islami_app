import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:islami_app/features/azkar_view/model/azkar_model.dart';

class AzkarServices {
  static Future<List<AzkarModel>> getZekr(String zekr) async {
    final fileString = await rootBundle.loadString("assets/json/azkar.json");

    Map<String, dynamic> jsonFile = jsonDecode(fileString);

    List<dynamic> zekerCategoriesList = jsonFile[zekr];

    final List<AzkarModel> zekrList = [];

    for (var item in zekerCategoriesList) {
      if (item is List) {
        zekrList.addAll(
          item.map((e) {
            return AzkarModel.fromJson(e);
          }).toList(),
        );
      } else {
        zekrList.add(AzkarModel.fromJson(item));
      }
    }
    return zekrList;
  }
}
