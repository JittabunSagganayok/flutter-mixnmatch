import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/utils/prefs.dart';

class TableReservation {
  final int reserveId;
  final int idBranch;
  final int tableNumberName;
  final int availableSeats;
  final int maxSeats;
  final DateTime dateReserve;
  final String timeSection;
  final int isAdmin;
  final int lastUserId;

  TableReservation({
    required this.reserveId,
    required this.idBranch,
    required this.tableNumberName,
    required this.availableSeats,
    required this.maxSeats,
    required this.dateReserve,
    required this.timeSection,
    required this.isAdmin,
    required this.lastUserId,
  });

  factory TableReservation.fromJson(Map<String, dynamic> json) {
    return TableReservation(
      reserveId: json['reserveId'],
      idBranch: json['id_branch'],
      tableNumberName: json['tablenumbername'],
      availableSeats: json['avaliableseat'],
      maxSeats: json['maxseat'],
      dateReserve: DateTime.parse(json['datereserve']),
      timeSection: json['timesection'],
      isAdmin: json['isAdmin'],
      lastUserId: json['lastuserId'],
    );
  }
}

class BookingController extends GetxController {
  var tableReservations = <TableReservation>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var tableCount = 0.obs;

  Future<void> fetchTableReservations(DateTime dateReserve) async {
    try {
      String idBranch = prefs.accessbranchId;
      String token = '';
      token = prefs.accessToken;
      isLoading(true);
      errorMessage('');

      final formattedDate =
          "${dateReserve.year}-${dateReserve.month.toString().padLeft(2, '0')}-${dateReserve.day.toString().padLeft(2, '0')}";
      final response = await http.get(Uri.parse(
              // 'http://localhost:8000/booking?idBranch=1&dateReserve=2024-05-11'),
              '${baseApi}booking?idBranch=$idBranch&dateReserve=$formattedDate'),
          headers: {
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == 'Success: 200') {
          final List<TableReservation> reservations =
              (jsonData['result'] as List)
                  .map((item) => TableReservation.fromJson(item))
                  .toList();
          tableReservations.assignAll(reservations);
          //admin สร้างมาเลยถึงเห็น  r.isAdmin == 1
          tableCount.value = reservations.isNotEmpty
              ? reservations
                  .where((r) => r.isAdmin == 1 && r.availableSeats > 0)
                  .map((r) => r.tableNumberName)
                  .length
              : 0;
        } else {
          errorMessage('Unexpected response format');
        }
      } else {
        errorMessage('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  String getTableInfo(int index) {
    if (index < tableReservations.length) {
      final reservation = tableReservations[index];
      if (reservation.isAdmin == 1 && reservation.availableSeats > 0) {
        return 'โต๊ะที่${reservation.tableNumberName}\n${reservation.availableSeats} ที่นั่ง';
      }
    }
    return ''; // Return empty string if conditions are not met or index is out of range
  }

  Future<void> confirmTableReservations(
      var idReserve, var seat, var dateReserve, var lastuserId) async {
    try {
      String token = '';
      token = prefs.accessToken;
      isLoading(true);
      errorMessage('');

      final response = await http.post(
        Uri.parse('${baseApi}booking/confirm?idReserve=${idReserve}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "seat": seat,
          "dateReserve": dateReserve,
          "timeSection": "",
          "lastuserId": lastuserId
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == 'Success: 200') {
          print("success");
        } else {
          errorMessage('Unexpected response format');
        }
      } else {
        errorMessage('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  // bool isTableAvailable(int index) {
  //   return tableReservations.any((r) =>
  //       // r.tableNumberName == index + 1 &&
  //       r.isAdmin == 1 && r.availableSeats > 0);
  // }
}
