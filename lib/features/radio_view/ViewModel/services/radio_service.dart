import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/features/radio_view/models/RadioModel.dart';

class RadioService {
  RadioService._intrinal();
  static final RadioService instance =RadioService._intrinal();
  factory RadioService(){
    return instance;
  }
   Future<RadioModel?> getRadioService() async {
    final Uri url = Uri.parse(
      "https://www.mp3quran.net/api/v3/radios?language=ar",
    );
    final http.Response respnse = await http.get(url);
    final Map<String, dynamic> jsonBody = jsonDecode(respnse.body);
    final result = RadioModel.fromJson(jsonBody);
    return result;
  }
}
