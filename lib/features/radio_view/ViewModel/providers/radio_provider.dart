import 'package:flutter/cupertino.dart';
import 'package:islami_app/features/radio_view/ViewModel/services/radio_service.dart';
import 'package:islami_app/features/radio_view/ViewModel/services/reciters_service.dart';
import 'package:islami_app/features/radio_view/models/RadioModel.dart';
import '../../models/RecitersModel.dart';

class RadioProvider extends ChangeNotifier {

  Future<RadioModel?> getRadio() async {
    final RadioModel? result;
    try{
      result = await RadioService.instance.getRadioService();
     if(result!=null){
       notifyListeners();
       return result;
     }
   }catch(error){
     rethrow;
   }
   notifyListeners();
    return null;
  }


  Future<RecitersModel?> getReciters() async {
    final RecitersModel? result;
    try{
      result = await RecitersService.instance.getRecitersService();
     if(result!=null){
       notifyListeners();
       return result;
     }
   }catch(error){
     rethrow;
   }
   notifyListeners();
    return null;
  }

}
