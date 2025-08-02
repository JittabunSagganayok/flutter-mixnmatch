import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mixnmatch/providers/dio_provider.dart';
import 'package:mixnmatch/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

//enum for appointment status
enum FilterStatus { All, Upcoming, Complete }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.All; //initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [];

  //get appointments details
  Future<void> getAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final appointment = await DioProvider().getAppointments(token);
    if (appointment != 'Error') {
      setState(() {
        schedules = json.decode(appointment);
      });
    }
  }

  final List<Map<String, dynamic>> filteredSchedules = [
    {
      'doctor_name': 'Dr. Smith',
      'category': 'Cardiologist',
      'doctor_profile': '/images/doctor1.png',
      'date': '2025-04-20',
      'day': 'Monday',
      'time': '10:00 AM - 12:00 PM',
    },
    {
      'doctor_name': 'Dr. Jane Doe',
      'category': 'Dentist',
      'doctor_profile': '/images/doctor2.png',
      'date': '2025-04-22',
      'day': 'Wednesday',
      'time': '2:00 PM - 4:00 PM',
    },
  ];

  @override
  void initState() {
    getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      switch (schedule['status']) {
        case 'All':
          schedule['status'] = FilterStatus.All;
          break;
        case 'Upcoming':
          schedule['status'] = FilterStatus.Upcoming;
          break;
        case 'Complete':
          schedule['status'] = FilterStatus.Complete;
          break;
      }
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(LineAwesomeIcons.angle_left_solid),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'ประวัติการจองโต๊ะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          48), // ให้ขนาดเท่ากับ IconButton เพื่อ balance layout
                ],
              ),
              Config.spaceSmall,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //this is the filter tabs
                        for (FilterStatus filterStatus in FilterStatus.values)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (filterStatus == FilterStatus.All) {
                                    status = FilterStatus.All;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.Upcoming) {
                                    status = FilterStatus.Upcoming;
                                    _alignment = Alignment.center;
                                  } else if (filterStatus ==
                                      FilterStatus.Complete) {
                                    status = FilterStatus.Complete;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Center(
                                child: Text(filterStatus.name),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedAlign(
                    alignment: _alignment,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Config.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          status.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Config.spaceSmall,
              // Container(
              //   width: 50,
              //   height: 50,
              //   color: Colors.red,
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSchedules.length,
                  itemBuilder: (context, index) {
                    final schedule = filteredSchedules[index];
                    final isLastElement = index == filteredSchedules.length - 1;

                    return Card(
                      color:
                          Colors.red, // optional: dark background for contrast
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: isLastElement
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "http://127.0.0.1:8000${schedule['doctor_profile']}"),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      schedule['doctor_name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      schedule['category'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '${schedule['day']} - ${schedule['date']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              schedule['time'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      'Reschedule',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard(
      {Key? key, required this.date, required this.day, required this.time})
      : super(key: key);
  final String date;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$day, $date',
            style: const TextStyle(
              color: Config.primaryColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            time,
            style: const TextStyle(
              color: Config.primaryColor,
            ),
          ))
        ],
      ),
    );
  }
}
