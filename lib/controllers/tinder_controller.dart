import 'dart:convert';
import 'package:get/get.dart';
import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:http/http.dart' as http;

class TinderController extends GetxController {
  RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    isLoading.value = true;
    try {
      String token = prefs.accessToken;
      final response = await http.post(
        Uri.parse('${baseApi}swipe/list'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "userId": prefs.userId,
          "branchId": prefs.accessbranchId,
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'Success: 200') {
          userList.assignAll(List<Map<String, dynamic>>.from(result['result']));
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

  Future submitSwipe({required int targetUserId}) async {
    isLoading.value = true;
    try {
      String token = prefs.accessToken;
      final response = await http.post(
        Uri.parse('${baseApi}swipe/submit'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "userId": int.parse(prefs.userId),
          "targetUserId": targetUserId,
          "branchId": int.parse(prefs.accessbranchId),
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'Success: 200') {
          print(result['isMatch']);
          return result['isMatch'];
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
