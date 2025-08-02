import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:line_awesome_flutter/line_awesome_flutter.dart";
import "package:mixnmatch/controllers/test_controller.dart";
import "package:mixnmatch/main.dart";
import "package:mixnmatch/screens/UpdateProfileScreen.dart";
import "package:mixnmatch/screens/scanqr_page.dart";
import "package:mixnmatch/screens/widgets/ProfileMenuWidget.dart";
import "package:mixnmatch/utils/config.dart";
import "package:flutter/material.dart";
import "package:mixnmatch/utils/prefs.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../providers/dio_provider.dart";

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(
        //     onPressed: () => Get.back(),
        //     icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // final TestController c = Get.put(TestController());
                // c.fetchfirst();
              },
              child: Text(
                ' MIX N MATCH',
                //(ใส่ icon แจ้งเตือน)
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffFF4B26)),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanQrcodes()));
              },
              icon: Icon(LineAwesomeIcons.camera_retro_solid))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// -- IMAGE
              SizedBox(
                height: 0.03.sh,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                            'https://i.pinimg.com/564x/d8/ad/0f/d8ad0f0c34db3c886eddfdf794f889bd.jpg')),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Config.primaryColor),
                      child: const Icon(
                        LineAwesomeIcons.pencil_alt_solid,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(prefs.fullName,
                  style: Theme.of(context).textTheme.headline4),
              Text("Customer", style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.to(UpdateProfileScreen());
                    Navigator.of(context).pushNamed(
                      'updateProfileScreen',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Config.primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Edit Profile",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog_solid,
                  onPress: () {}),
              // ProfileMenuWidget(
              //     title: "Billing Details",
              //     icon: LineAwesomeIcons.wallet_solid,
              //     onPress: () {}),
              // ProfileMenuWidget(
              //     title: "User Management",
              //     icon: LineAwesomeIcons.user_check_solid,
              //     onPress: () {}),
              // const Divider(),
              // const SizedBox(height: 10),
              // ProfileMenuWidget(
              //     title: "Information",
              //     icon: LineAwesomeIcons.info_solid,
              //     onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.sign_out_alt_solid,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () async {
                    // Get.defaultDialog(
                    //   title: "LOGOUT",
                    //   titleStyle: const TextStyle(fontSize: 20),
                    //   content: const Padding(
                    //     padding: EdgeInsets.symmetric(vertical: 15.0),
                    //     child: Text("Are you sure, you want to Logout?"),
                    //   ),
                    //   confirm: Expanded(
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.redAccent,
                    //           side: BorderSide.none),
                    //       child: const Text("Yes"),
                    //     ),
                    //   ),
                    //   cancel: OutlinedButton(
                    //       onPressed: () => Get.back(), child: const Text("No")),
                    // );
                    await prefs.clear();

                    // Navigate to AuthPage and remove all previous routes
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/',
                      (Route<dynamic> route) => false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
