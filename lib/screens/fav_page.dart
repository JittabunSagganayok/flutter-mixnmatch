import "package:get/get.dart";
import "package:mixnmatch/components/doctor_card.dart";
import "package:mixnmatch/controllers/branch_controller.dart";
import "package:mixnmatch/controllers/point_controller.dart";
import "package:mixnmatch/controllers/tinder_controller.dart";
import "package:mixnmatch/main_layout.dart";
import "package:mixnmatch/screens/redeem_points.dart";
import "package:mixnmatch/screens/request_gift.dart";

import "package:mixnmatch/screens/scanqr_page.dart";
import 'package:mixnmatch/screens/tinder_page.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/route_manager.dart";
import "package:mixnmatch/utils/prefs.dart";
import "package:permission_handler/permission_handler.dart";
import "package:provider/provider.dart";

import "../models/auth_model.dart";

class FavPage extends StatefulWidget {
  final void Function(int)? goToPage; // <-- new param
  String? title;

  FavPage({Key? key, this.title, this.goToPage}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  final BranchSelectController controller = Get.put(BranchSelectController());
  final PointSelectController c = Get.put(PointSelectController());
  @override
  void initState() {
    super.initState();
    controller.fetchBranchDetail(notnetwork: false, id: prefs.accessbranchId);
    c.fetchPoint();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                // var status = await Permission.camera.status;
                // if (!status.isGranted) {
                //   await Permission.camera.request().then((value) =>
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => ScanQrcodes())));
                // } else {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => ScanQrcodes()));
                // }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCredit()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MIX N MATCH',
                    //(ใส่ icon แจ้งเตือน)
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        color: Color(0xffFF4B26)),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/point.png',
                          width: 0.05.sw,
                          // height: 40,
                        ),
                        Obx(
                          () => Text(
                            ' ${c.mypoint.value} แต้ม',
                            //(ใส่ icon แจ้งเตือน)
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.015.sh,
            ),

            GestureDetector(
              onTap: () {
                final TinderController c = Get.find<TinderController>();
                controller.fetchBranches();
                Navigator.of(context).pushNamed('branchSelectScreen',
                    arguments: {
                      'isFromMain': true
                    }).then((value) => c.fetchUserList());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ร้านปัจจุบัน : ',
                      //(ใส่ icon แจ้งเตือน)
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Obx(
                      () => Text(
                        // controller.branchdetail.value.name != "" ? ' 5,000 แต้ม' : "xxx",
                        " ${controller.selectedBranch.value?.name ?? ""} (${controller.selectedBranch.value?.branchType ?? ""})",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.red,
                      size: 0.05.sw,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanQrcodes())),
              child: Container(
                width: double.infinity,
                height: 0.2.sh,
                decoration: BoxDecoration(
                  color: const Color(0xff704ECE),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "เช็คอินที่ร้าน",
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "สแกน QR CODE ที่ร้านเพื่อสะสมแต้มรับของรางวัล",
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/mainicon1.png',
                        width: double.infinity,

                        // height: 0.1.sh,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => widget.goToPage?.call(2),
                    child: Container(
                      // width: double.infinity / 2,
                      height: 0.2.sh,
                      decoration: BoxDecoration(
                        color: const Color(0xffff4b26),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(""),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "มองหาคนรู้ใจ",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "อย่าปล่อยให้คืนนี้ต้องเหงา",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/mainicon2.png',
                              height: 0.08.sh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => widget.goToPage?.call(1),
                    child: Container(
                      // width: double.infinity / 2,
                      height: 0.2.sh,
                      decoration: BoxDecoration(
                        color: const Color(0xff44bdce),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "จองโต๊ะ",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "ไม่ต้องกังวลเรื่องหาที่นั่ง",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/mainiconcalendar.png',
                              height: 0.08.sh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => widget.goToPage?.call(3),
                    child: Container(
                      // width: double.infinity / 2,
                      height: 0.2.sh,
                      decoration: BoxDecoration(
                        color: const Color(0xff344995),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "ส่งข้อความขึ้นจอ",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "จะเศร้าจะสุขก็ขอได้ที่นี่",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/mainicon5.png',
                              height: 0.08.sh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyCredit()));
                    },
                    child: Container(
                      // width: double.infinity / 2,
                      height: 0.2.sh,
                      decoration: BoxDecoration(
                        color: const Color(0xfff9aa33),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "แลกรับของรางวัล",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "ใช้แต้มเพื่อแลกรับของรางวัล",
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/mainicon4.png',
                              height: 0.08.sh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            // Expanded(
            //   child: Consumer<AuthModel>(
            //     builder: (context, auth, child) {
            //       return ListView.builder(
            //         itemCount: auth.getFavDoc.length,
            //         itemBuilder: (context, index) {
            //           return DoctorCard(
            //             doctor: auth.getFavDoc[index],
            //             //show fav icon
            //             isFav: true,
            //           );
            //         },
            //       );
            //     },
            //     //child:
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
