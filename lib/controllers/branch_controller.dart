import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/utils/prefs.dart';

class Branch {
  final int id;
  final String name;
  final int totalTable;
  final String address;
  final String branchType;

  Branch(
      {required this.id,
      required this.name,
      required this.totalTable,
      required this.address,
      required this.branchType});

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id_branch'] ?? 0,
      name: json['name_branch'] ?? "",
      totalTable: json['totaltable'] ?? 0,
      address: json['address'] ?? "",
      branchType: json['branchtype'] ?? "",
    );
  }
}

class BranchSelectController extends GetxController {
  Rx<Branch?> selectedBranch = Rx<Branch?>(null);
  var branches = <Branch>[].obs;
  var filteredBranches = <Branch>[].obs;
  var isLoading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // fetchBranches();
  // }

  Future<void> fetchBranches() async {
    isLoading(true);
    try {
      String token = prefs.accessToken;
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var request = http.Request('GET', Uri.parse('${baseApi}branch/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        final List<dynamic> branchesJson = json.decode(responseBody);
        branches.value =
            branchesJson.map((json) => Branch.fromJson(json)).toList();
        filteredBranches.value = branches;
      } else {
        throw Exception('Failed to load branches');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch branches: $e');
    } finally {
      isLoading(false);
    }
  }

  void filterBranches(String query) {
    if (query.isEmpty) {
      filteredBranches.value = branches;
    } else {
      filteredBranches.value = branches
          .where((branch) =>
              branch.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<void> fetchBranchDetail(
      {required bool notnetwork, required String id}) async {
    if (notnetwork) {
      selectedBranch.value = branches.firstWhere(
        (branch) => branch.id.toString() == id,
        orElse: () => branches[0],
      );
    } else {
      isLoading(true);
      try {
        String token = prefs.accessToken;
        var headers = {
          'Authorization': 'Bearer $token',
        };
        var request = http.Request('GET', Uri.parse('${baseApi}branch/$id'));
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        final responseBody = await response.stream.bytesToString();
        if (response.statusCode == 200) {
          final branchJson = json.decode(responseBody);
          selectedBranch.value = Branch.fromJson(branchJson[0]);
          print('Selected Branch: ${selectedBranch.value?.name}');
        } else {
          throw Exception('Failed to load branch detail');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to fetch branch detail: $e');
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> addNewBranch({required int branchid}) async {
    isLoading(true);
    try {
      String token = prefs.accessToken;
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request(
          'PUT', Uri.parse('${baseApi}users/branchid/${prefs.userId}'));
      request.headers.addAll(headers);
      request.body = json.encode({"branchid": branchid});
      http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        final branchJson = json.decode(responseBody);
        selectedBranch.value = Branch.fromJson(branchJson[0]);
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed: $e');
    } finally {
      isLoading(false);
    }
  }
}
