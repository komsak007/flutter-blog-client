// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = "https://5d5b-183-89-199-209.ngrok.io";
  var log = Logger();

  Future<dynamic> get(String url) async {
    url = formater(url);

    // /user/register
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formater(url);
    print("1 ${body}");
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
    log.d(response.body);
    log.d(response.statusCode);
  }

  String formater(String url) {
    return baseUrl + url;
  }
}
