import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mixnmatch/constant/styles_constants.dart';
import 'package:mixnmatch/controllers/point_controller.dart';
import 'package:mixnmatch/screens/request_gift.dart';
// import 'package:mcic_app/constant/styles_constants.dart';
// import 'package:mcic_app/user/view/credit/credit_controller.dart';
// import 'package:mcic_app/user/view/credit/credit_request_info.dart';
// import 'package:mcic_app/user/view/credit/provider/check_credit_provider.dart';
// import 'package:mcic_app/user/view/credit/request_credit.dart';

class MyCredit extends ConsumerStatefulWidget {
  const MyCredit({Key? key}) : super(key: key);

  @override
  ConsumerState<MyCredit> createState() => _MyCreditState();
}

class _MyCreditState extends ConsumerState<MyCredit> {
  // final CreditController creditcon = Get.put(CreditController());
  final numberFormat = NumberFormat('#,##0.00');
  final PointSelectController c = Get.put(PointSelectController());
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
    c.fetchHistoryPointList();
    c.fetchPromotion();
    // ref.refresh(checkCreditProvider.notifier).refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var creditapi = ref.watch(checkCreditProvider);

    // final creditmax = creditapi.maxRequestCredit;
    // creditcon.creditapi = creditmax;
    // print(creditcon.creditapi);
    // creditcon.update();

    return LoaderOverlay(
      useDefaultLoading: false,
      overlayOpacity: 0.5,
      overlayColor: Colors.black.withOpacity(0.5),
      overlayWidget: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      child: Scaffold(
          backgroundColor: Color(0xFF1D1D1D),
          appBar: AppBar(
            // backgroundColor: const Color(0xFFF7F8FF),
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,

            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(LineAwesomeIcons.angle_left_solid)),

            title: Text(
              'แต้มสะสมของฉัน',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(19),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'Kanit'),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              // creditcon.getcredittotal();
              // creditcon.getcreditlist();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: const Color(0xFFF7F8FF),
                    padding: EdgeInsets.only(
                        left: 0.04.sw, right: 0.04.sw, top: 0.06.sw),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0.05.sw),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/bg-credit.png"),
                            fit: BoxFit.fill,
                          )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'แต้มสะสมใช้ได้',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(13),
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily: 'Kanit'),
                              ),
                              SizedBox(
                                height: 0.02.sh,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 0.03.sw),
                                    child: Image.asset(
                                      'assets/dollar-circle.png',
                                      fit: BoxFit.fill,
                                      width: 0.07.sw,
                                    ),
                                  ),
                                  Obx(() => Text(
                                        // numberFormat.format(
                                        //   int.parse("5000"),
                                        ' ${c.mypoint.value} แต้ม',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(25),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Kanit'),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 0.03.sw,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RequestCredit()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.055.sw),
                                      height: 0.12.sw,
                                      decoration: buttonWhite,
                                      child: Center(
                                        child: Text(
                                          'แลกของรางวัล',
                                          style: TextStyle(
                                              color: const Color(0xFF325FA4),
                                              fontSize: ScreenUtil().setSp(14),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Kanit'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.04.sw),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 0.03.sw),
                                child: Image.asset(
                                  'assets/copyright1.png',
                                  fit: BoxFit.fill,
                                  width: 0.05.sw,
                                ),
                              ),
                              Text(
                                'โปรดใช้แต้มสะสมก่อน 31/12/2569',
                                // 'Due date ${creditcon.duedate.value} วัน',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFC42A27),
                                    fontFamily: 'Kanit'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.05.sw, vertical: 0.02.sw),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 0.03.sw),
                              child: Container(
                                width: 0.06.sw, // adjust to control circle size
                                height: 0.06.sw,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/his.png',
                                    fit: BoxFit.contain,
                                    width: 0.04.sw,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'ประวัติการแลกแต้ม',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'kanit'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.03.sw,
                        ),
                        Obx(() {
                          if (c.historypointlist.isEmpty) {
                            return Center(
                              child: Text(
                                'ไม่มีประวัติการแลกแต้ม',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(14),
                                    fontFamily: 'Kanit'),
                              ),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: c.historypointlist.length,
                            itemBuilder: (context, index) {
                              final item = c.historypointlist[index];
                              // final date = DateTime.parse(item['date']);
                              // final formattedDate =
                              //     DateFormat('dd MMM yyyy', 'th').format(date);

                              return Container(
                                margin: EdgeInsets.only(bottom: 0.03.sh),
                                padding: EdgeInsets.all(0.04.sw),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2B2B2B),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['redeemtype_name'] ?? '',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(16),
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontFamily: 'Kanit'),
                                    ),
                                    SizedBox(height: 0.01.sh),
                                    Text(
                                      item['redeemtype_desc'] ?? '',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(13),
                                          color: Colors.white70,
                                          fontFamily: 'Kanit'),
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ของรางวัล: ${item['redeemgift']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(14),
                                              fontFamily: 'Kanit'),
                                        ),
                                        Text(
                                          '-${item['pointredeem']} แต้ม',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: ScreenUtil().setSp(14),
                                              fontFamily: 'Kanit'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 0.01.sh),
                                    Text(
                                      formatDate(item['date']) +
                                          ' ' +
                                          item['time'],
                                      // 'วันที่แลก: $formattedDate เวลา ${item['time']}',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(13),
                                          color: Colors.white60,
                                          fontFamily: 'Kanit'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
