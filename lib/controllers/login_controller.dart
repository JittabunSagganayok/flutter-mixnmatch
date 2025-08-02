import 'dart:convert';

import 'package:get/get.dart';
import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/main.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:http/http.dart' as http;

class LoginException implements Exception {
  final String message;
  LoginException(this.message);
}

class LoginController extends GetxController {
  Future<void> loginEmail(
      {required String email, required String password}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('${baseApi}api/login'));
      request.body = json.encode({"email": email, "password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var result = json.decode(responseBody);
        print(result);

        // await prefs.init();
        prefs.accessToken = result["token"];
        List<dynamic> branchIds = result["branchId"];
        if (branchIds.isNotEmpty) {
          prefs.accessbranchId = branchIds.last.toString();
        } else {
          throw LoginException("No branch ID available");
        }
        prefs.userId = result["userid"].toString();
        prefs.fullName = result["username"].toString();

        if (result["roleshow"] == "customer") {
          //  Navigator.of(context).pushNamed('main'),
        } else {
          throw LoginException("User Type Not Customer");
        }
      } else {
        print(response.reasonPhrase);
        throw LoginException("อีเมลล์หรือรหัสผ่านไม่ถูกต้อง");
      }
    } catch (e) {
      print("Login error: $e");
      if (e is LoginException) {
        rethrow;
      }
      throw LoginException("An unexpected error occurred. Please try again.");
    }
  }
}
