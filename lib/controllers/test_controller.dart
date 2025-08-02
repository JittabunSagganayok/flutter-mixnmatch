import 'dart:convert';

import 'package:get/get.dart';
import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:http/http.dart' as http;

class TestController extends GetxController {
  Future fetchfirst() async {
    String token = '';
    token = prefs.accessToken;

    final response = await http.get(
        //https://e340-171-7-103-56.ngrok-free.app/blog
        Uri.parse('${baseApi}blog'),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(result);
      print(token);
      //  final result = json.decode(response.body)["result"]["id"];
    } else {}
  }
}
