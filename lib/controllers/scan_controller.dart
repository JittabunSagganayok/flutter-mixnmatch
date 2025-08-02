import 'dart:convert';
import 'package:get/get.dart';
import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/success_dialog_widget.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ScanController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> onDetectQr({required int branchidFromScan}) async {
    if (branchidFromScan == 0) {
      
      return;
    } else {
      isLoading.value = true;
      final now = DateTime.now();
      final dateFormat = DateFormat('yyyy-MM-dd');
      final timeFormat = DateFormat('HH:mm');

      final formattedDate = dateFormat.format(now);
      final formattedTime = timeFormat.format(now);
      try {
        String token = prefs.accessToken;
        final response = await http.post(
          Uri.parse('${baseApi}checkin'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({
            "userId": int.tryParse(prefs.userId) ?? 0,
            "branchId": branchidFromScan,
            "date": formattedDate,
            "time": formattedTime
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
