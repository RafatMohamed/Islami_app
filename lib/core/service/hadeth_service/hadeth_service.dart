import 'package:flutter/services.dart';
import 'package:islami_app/features/hadeth_view/model/hadeth_model.dart';

class HadethService {

  static int getNumbersHadeth() {
    return 50;
  }


  static Future<List<String>> readData(int index)async{
    final data = await rootBundle.loadString("assets/text/Hadeeth/Hadeeth/h${index+1}.txt");
    return data.split('\n');
  }
}
