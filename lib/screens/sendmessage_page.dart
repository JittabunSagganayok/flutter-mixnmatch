import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mixnmatch/components/button.dart';
import 'package:mixnmatch/constant/styles_constants.dart';
import 'package:mixnmatch/controllers/submitDisplay_controller.dart';
import 'package:mixnmatch/controllers/upload_controller.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/success_dialog_widget.dart';
import 'package:mixnmatch/screens/widgets/image_form.dart';
import 'package:mixnmatch/utils/config.dart';

class SendMessage extends StatefulHookConsumerWidget {
  const SendMessage({super.key});

  @override
  ConsumerState<SendMessage> createState() => _SendMessageState();
}

final UploadController uploadC = Get.put(UploadController());

class _SendMessageState extends ConsumerState<SendMessage> {
  @override
  Widget build(BuildContext context) {
    final imagesSlip = useState<List<String>>([]);
    final _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.primaryColor,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon: const FaIcon(Icons.arrow_back_ios),
        // ),
        title: Text(
          'ส่งข้อความขึ้นจอ',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(19),
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Kanit'),
        ),
        //actions: [
        // GestureDetector(
        //   onTap: () {
        //     // Navigator.of(context).pushNamed(
        //     //   'appointmenthistory',
        //     // );
        //   },
        //   child: const Padding(
        //     padding: EdgeInsets.all(16.0),
        //     child: FaIcon(FontAwesomeIcons.history),
        //   ),
        // )
        // ],
      ),
      body: SafeArea(
        child: Obx(() => uploadC.isloadingpicprofile.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      uploadC.urlImage.value != ''
                          ? GestureDetector(
                              onTap: () {
                                uploadC.urlImage.value = '';
                              },
                              child: Container(
                                width: double.infinity,
                                height: 0.2.sh,
                                decoration: BoxDecoration(
                                  color: Color(0xff4E4E4E),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.network(
                                  uploadC.urlImage.value ??
                                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                                          .toString(),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => uploadC.profileImage(),
                              child: DottedBorder(
                                color: Colors.white,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20),
                                strokeWidth: 1,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.2.sh,
                                    decoration: BoxDecoration(
                                      color: Color(0xff4E4E4E),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 0.02.sh,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: FaIcon(
                                                FontAwesomeIcons.upload)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 0.3.sw,
                                              right: 0.3.sw,
                                              // top: 0.1.sw,
                                              bottom: 0.0.sw),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 0.0.sw, bottom: 0.06.sw),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0.04.sw,
                                                vertical: 0.02.sw),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: Color(0xff707070),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'อัปโหลดรูป',
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(14),
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontFamily: 'Kanit'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      Container(
                        padding: EdgeInsets.all(0.04.sw),
                        width: double.infinity,
                        // height: 0.2.sh,
                        decoration: BoxDecoration(
                          color: Color(0xff6F6F6F).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ทำไมเรายังไม่วาป ",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(13),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Kanit')),
                            Text(
                                "แจกวาร์ปได้เลยที่นี่ใส่ชื่อ พร้อมไอคอน social ",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Color(0xff9A9A9A),
                                    fontSize: ScreenUtil().setSp(12),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Kanit')),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            TextField(
                              // controller: ,
                              cursorColor: const Color(0xFF505050),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFF6F7FA),
                                filled: true,
                                hintText: 'ใส่ชื่อ ',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFA8A8A8),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Kanit'),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0.05.sw, vertical: 0.01.sw),
                                enabledBorder: txtFieldF,
                                focusedBorder: txtFieldF,
                              ),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            Container(
                              width: double.infinity,
                              height: 0.07.sh,
                              // color: Color(0sxff4E4E4E),
                              decoration: BoxDecoration(
                                color: Color(0xff6F6F6F).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.sw, vertical: 0.01.sh),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ProfileImage(
                                      imageUrl: "assets/ig.png",
                                      imageSize: 7,
                                    ),
                                    // Image.asset(
                                    //   'assets/ig.png',
                                    // ),
                                    Image.asset(
                                      'assets/fb.png',
                                    ),
                                    Image.asset(
                                      'assets/line.png',
                                    ),
                                    Image.asset(
                                      'assets/xicon.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.02.sh,
                              ),
                              child: Divider(
                                color: Color(0xff4E4E4E),
                                thickness: 1,
                              ),
                            ),
                            Text("ใส่ข้อความ ",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(13),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Kanit')),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            TextField(
                              controller: _textController,
                              cursorColor: const Color(0xFF505050),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFF6F7FA),
                                filled: true,
                                hintText: 'ข้อความ ',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFA8A8A8),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Kanit'),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0.05.sw, vertical: 0.01.sw),
                                enabledBorder: txtFieldF,
                                focusedBorder: txtFieldF,
                              ),
                            ),
                            SizedBox(
                              height: 0.01.sh,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Container(
                        // color: Colors.black,
                        child: Button(
                          width: double.infinity,
                          title: 'ส่งข้อความเลย !',
                          onPressed: () async {
                            final SubmitDisplayController c =
                                Get.put(SubmitDisplayController());
                            try {
                              await c.postSubmit(
                                  displaytext: _textController.text);
                              _showSuccessDialog(
                                  context, "สำเร็จ", "ส่งขึ้นจอสำเร็จ");
                              uploadC.urlImage.value = '';
                              _textController.clear();
                            } catch (e) {
                              _showErrorDialog(context, "โปรดกรอกข้อมูลให้ครบ");
                            }
                          },
                          disable: false,
                        ),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ErrorDialogWidget(
        title: "Error",
        content: message,
        onSubmit: () => Navigator.of(context).pop(),
      );
    },
  );
}

void _showSuccessDialog(BuildContext context, String message, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Start a timer to auto-dismiss the dialog
      Timer(Duration(seconds: 2), () {
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

class ProfileImage extends StatelessWidget {
  final String imageUrl; // URL of the profile image
  final double imageSize; // Desired size of the image

  const ProfileImage({
    Key? key,
    required this.imageUrl,
    this.imageSize = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set a white background with some padding
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Add a subtle shadow
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(imageSize / 2), // Adjust padding as needed
      child: ClipOval(
        // Clip the child widget to a circle
        child: FadeInImage(
          // Use FadeInImage for smooth loading animation
          placeholder:
              const AssetImage('assets/mixnmatch.png'), // Placeholder image
          image: AssetImage(imageUrl),
          fit: BoxFit.cover, // Ensure image fills the circle
        ),
      ),
    );
  }
}
