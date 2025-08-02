import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mixnmatch/components/button.dart';
import 'package:mixnmatch/components/custom_appbar.dart';
import 'package:mixnmatch/controllers/booking_controller.dart';
import 'package:mixnmatch/main.dart';
import 'package:mixnmatch/models/booking_datetime_converted.dart';
import 'package:mixnmatch/providers/dio_provider.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/success_dialog_widget.dart';
import 'package:mixnmatch/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? token; //get token for insert booking date and time into database

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  String formatDate(String originalDate) {
    // Parse the original date string
    DateTime parsedDate = DateTime.parse(originalDate);

    // Format the date to the desired format (YYYY-MM-DD)
    String formattedDate =
        "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}";

    return formattedDate;
  }

  @override
  void initState() {
    getToken();
    bookingController.fetchTableReservations(_currentDay);
    super.initState();
  }

  final BookingController bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    // final doctor = null;
    // ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        appBar:
            // CustomAppBar(
            //   appTitle: 'สร้างการจองโต๊ะ',
            //   icon: const FaIcon(Icons.arrow_back_ios),
            // ),
            AppBar(
          backgroundColor: Config.primaryColor,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: () => Navigator.pop(context),
          //   icon: const FaIcon(Icons.arrow_back_ios),
          // ),
          title: Text(
            'การจองโต๊ะ',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(19),
                fontWeight: FontWeight.w600,
                fontFamily: 'Kanit'),
          ),
          actions: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).pushNamed(
            //       'appointmenthistory',
            //     );
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.all(16.0),
            //     child: FaIcon(FontAwesomeIcons.history),
            //   ),
            // )
          ],
        ),
        body: Obx(
          () => Stack(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        _tableCalendar(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: Center(
                            child: Text(
                              bookingController.tableCount.value > 0
                                  ? 'เลือกโต๊ะที่ต้องการจอง'
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // _isWeekend
                  bookingController.tableCount.value == 0
                      ? SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            alignment: Alignment.center,
                            child: const Center(
                              child: Text(
                                'ไม่เปิดให้จองวันนี้',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                          ),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return
                                  // Obx(() => );
                                  InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  // if (bookingController
                                  //     .isTableAvailable(index)) {
                                  //   setState(() {
                                  //     _currentIndex = index;
                                  //     _timeSelected = true;
                                  //   });
                                  // }
                                  setState(() {
                                    _currentIndex = index;
                                    _timeSelected = true;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          // bookingController
                                          //         .isTableAvailable(index)
                                          false ? Colors.black : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    color: _currentIndex == index
                                        ? Config.primaryColor
                                        : null,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    bookingController.getTableInfo(index),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit',
                                      color: _currentIndex == index
                                          ? Colors.white
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: bookingController.tableCount.value,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.5,
                          ),
                        )
                  // SliverGrid(
                  //     delegate: SliverChildBuilderDelegate(
                  //       (context, index) {
                  //         return InkWell(
                  //           splashColor: Colors.transparent,
                  //           onTap: () {
                  //             setState(() {
                  //               _currentIndex = index;
                  //               _timeSelected = true;
                  //             });
                  //           },
                  //           child: Container(
                  //             margin: const EdgeInsets.all(5),
                  //             decoration: BoxDecoration(
                  //               border: Border.all(
                  //                 color:
                  //                     // _currentIndex == index
                  //                     true ? Colors.white : Colors.black,
                  //               ),
                  //               borderRadius: BorderRadius.circular(15),
                  //               color: _currentIndex == index
                  //                   ? Config.primaryColor
                  //                   : null,
                  //             ),
                  //             alignment: Alignment.center,
                  //             child: Text(
                  //               'โต๊ะที่${index} \n ${index}ที่นั่ง',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontFamily: 'Kanit',
                  //                 color: _currentIndex == index
                  //                     ? Colors.white
                  //                     : null,
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       childCount: 8,
                  //     ),
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 3, childAspectRatio: 1.5),
                  //   ),
                  // SliverToBoxAdapter(
                  //   child: ,
                  // ),
                ],
              ),
              Container(
                height: 1.sh,
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Button(
                        width: double.infinity,
                        title: 'จองโต๊ะ',
                        onPressed: () async {
                          await bookingController.confirmTableReservations(
                              bookingController
                                  .tableReservations[_currentIndex ?? 0]
                                  .reserveId,
                              bookingController
                                  .tableReservations[_currentIndex ?? 0]
                                  .availableSeats,
                              formatDate(_currentDay.toString()),
                              prefs.userId);
                          _showSuccessDialog(context, "จองโต๊ะสำเร็จ",
                              "โปรดรอการติดต่อจากทางร้าน");

                          await bookingController
                              .fetchTableReservations(_currentDay);
                        },
                        disable: bookingController.tableCount.value == 0,
                        //_timeSelected && _dateSelected ? false : true,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  //table calendar
  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2030, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 45,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Config.primaryColor, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
          bookingController.fetchTableReservations(_currentDay);
        });
      }),
    );
  }

  void _showSuccessDialog(
      BuildContext context, String message, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Start a timer to auto-dismiss the dialog
        Timer(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return SuccessDialogWidget(
          submitText: "",
          submitButton: false,
          title: message,
          content: content,
        );
      },
    );
  }
}
