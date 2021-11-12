// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = "http://be83-183-89-197-48.ngrok.io";
  var log = Logger();

  Future get(String url) async {
    url = formater(url);

    // /user/register
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    url = formater(url);
    print(body);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    // Map<String, dynamic> output = json.decode(response.body);
    // print(output['msg']);

    return response;
  }

  String formater(String url) {
    return baseUrl + url;
  }
}
