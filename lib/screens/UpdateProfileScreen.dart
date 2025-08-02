import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mixnmatch/utils/config.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text(
          'Edit Profile',
          //(ใส่ icon แจ้งเตือน)
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // -- IMAGE with ICON
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
                      child: const Icon(LineAwesomeIcons.camera_solid,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(
                            "tFullName",
                            style: TextStyle(color: Colors.white),
                          ),
                          prefixIcon: Icon(LineAwesomeIcons.user)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(
                            "tEmail",
                            style: TextStyle(color: Colors.white),
                          ),
                          prefixIcon: Icon(LineAwesomeIcons.envelope)),
                    ),
                    // const SizedBox(height: tFormHeight - 20),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(
                            "tPhoneNo",
                            style: TextStyle(color: Colors.white),
                          ),
                          prefixIcon: Icon(LineAwesomeIcons.phone_solid)),
                    ),
                    // const SizedBox(height: tFormHeight - 20),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text(
                          "tPassword",
                          style: TextStyle(color: Colors.white),
                        ),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                            icon: const Icon(
                              LineAwesomeIcons.eye_slash,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const UpdateProfileScreen()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Config.primaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("tEditProfile",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // const SizedBox(height: tFormHeight),

                    // -- Created Date and Delete Button
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text.rich(
                    //       TextSpan(
                    //         text: "tJoined",
                    //         style: TextStyle(fontSize: 12),
                    //         children: [
                    //           TextSpan(
                    //               text: "tJoinedAt",
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 12))
                    //         ],
                    //       ),
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor:
                    //               Colors.redAccent.withOpacity(0.1),
                    //           elevation: 0,
                    //           foregroundColor: Colors.red,
                    //           shape: const StadiumBorder(),
                    //           side: BorderSide.none),
                    //       child: const Text("tDelete"),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
