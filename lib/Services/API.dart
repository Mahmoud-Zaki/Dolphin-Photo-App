import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dolphin_photo_app/Utilities/Constants.dart';

class API{

  static Future<String> fetchRandomDolphinPhoto() async {
    try {
      Uri uri = Uri.parse('${Constants.baseURL}query=${Constants.photoName}&client_id=${Constants.clientID}');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['urls']['regular'];
      }
      else {
        return "Failed";
      }
    } catch (_) {
      return "Failed";
    }
  }

}