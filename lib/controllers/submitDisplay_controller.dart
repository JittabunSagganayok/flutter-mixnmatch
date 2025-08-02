import 'dart:convert';
import 'package:get/get.dart';
import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/success_dialog_widget.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SubmitDisplayController extends GetxController {
  RxBool isLoading = false.obs;
  var urlImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/2560px-Test-Logo.svg.png'
          .obs;

  Future<void> postSubmit({required String displaytext}) async {
    if (displaytext == "" || urlImage.value == "") {
      throw Exception('กรอกให้ครบ');
    } else {
      isLoading.value = true;

      try {
        String token = prefs.accessToken;
        final response = await http.post(
          Uri.parse('${baseApi}display'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({
            "displayimage": urlImage.value,
            "displaytext": displaytext,
            "userId": prefs.userId,
            "branchId": prefs.accessbranchId
          }),
        );

        if (response.statusCode == 200) {
          final result = json.decode(response.body);
          if (result['status'] == 'Success: 200') {
          } else {
            throw Exception('Failed to load user list: ${result['message']}');
          }
        } else {
          throw Exception('Failed to load user list: ${response.reasonPhrase}');
        }
      } catch (e) {
        print('Error fetching user list: $e');
        // You might want to show an error message to the user here
      } finally {
        isLoading.value = false;
      }
    }
  }
}
