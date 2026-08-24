import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami_app/features/radio_view/models/RecitersModel.dart';

class RecitersService {
  RecitersService._internal();
  static final RecitersService instance = RecitersService._internal();
  factory RecitersService(){
    return instance;
  }
   Future<RecitersModel?> getRecitersService() async {
    final Uri url = Uri.parse(
      "https://www.mp3quran.net/api/v3/reciters?language=ar",
    );
    final http.Response respnse = await http.get(url);
    final Map<String, dynamic> jsonBody = jsonDecode(respnse.body);
    final result = RecitersModel.fromJson(jsonBody);
    return result;
  }
}
