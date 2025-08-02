import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/utils/prefs.dart';

// class Branch {
//   final int id;
//   final String name;
//   final int totalTable;
//   final String address;
//   final String branchType;

//   Branch(
//       {required this.id,
//       required this.name,
//       required this.totalTable,
//       required this.address,
//       required this.branchType});

//   factory Branch.fromJson(Map<String, dynamic> json) {
//     return Branch(
//       id: json['id_branch'] ?? 0,
//       name: json['name_branch'] ?? "",
//       totalTable: json['totaltable'] ?? 0,
//       address: json['address'] ?? "",
//       branchType: json['branchtype'] ?? "",
//     );
//   }
// }

class PointSelectController extends GetxController {
  RxInt mypoint = 0.obs;
  var isLoading = false.obs;
  RxList historypointlist = [].obs;
  RxList promolist = [].obs;
  var isEnableSubmit = false.obs;
  RxInt pointredeem = 0.obs;
  RxInt redeemtypeId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    //fetchPoint();
  }

  Future<void> fetchPoint() async {
    isLoading(true);
    try {
      String token = prefs.accessToken;
      final response = await http.post(
        Uri.parse('${baseApi}redeem/mypoints'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "userId": int.tryParse(prefs.userId) ?? 0,
          "branchId": int.tryParse(prefs.accessbranchId) ?? 0,
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'Success: 200') {
          mypoint.value = result?['result']?['points'] ?? 0;
          // prefs.mypoint = result?['result']?['points']?.toString() ?? "0";
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

  Future<void> fetchPromotion() async {
    isLoading(true);
    try {
      String token = prefs.accessToken;
      final response = await http.get(
        Uri.parse('${baseApi}redeempromo?idBranch=${prefs.accessbranchId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'Success: 200') {
          promolist.value = result['result'];
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

  Future<void> fetchHistoryPointList() async {
    isLoading(true);
    try {
      String token = prefs.accessToken;
      final response = await http.get(
        Uri.parse(
            '${baseApi}booking/redeem/${prefs.accessbranchId}?userId=${prefs.userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        historypointlist.value = result;
      } else {
        throw Exception('Failed to load list: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching user list: $e');
      // You might want to show an error message to the user here
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> confirmRedeem() async {
    isLoading(true);
    try {
      final now = DateTime.now();
      final formattedDate = DateFormat('yyyy-MM-dd').format(now);
      final formattedTime = DateFormat('HH:mm').format(now);

      String token = prefs.accessToken;
      final response = await http.post(
        Uri.parse('${baseApi}redeem'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "redeemtypeId": redeemtypeId.value,
          "userId": prefs.userId,
          "pointredeem": pointredeem.value,
          "date": formattedDate,
          "time": formattedTime,
          "status": 0,
          "branchId": prefs.accessbranchId
        }),
      );

      if (response.statusCode == 200) {
        fetchPoint();
        fetchHistoryPointList();
      } else {
        throw Exception('Failed to load list: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error Submit : $e');
      throw Exception(e);

      // You might want to show an error message to the user here
    } finally {
      isLoading.value = false;
    }
  }
}
