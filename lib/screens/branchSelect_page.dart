import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixnmatch/controllers/branch_controller.dart';
import 'package:mixnmatch/controllers/point_controller.dart';
import 'package:mixnmatch/utils/config.dart';
import 'package:mixnmatch/utils/prefs.dart';

class BranchSelectScreen extends StatelessWidget {
  final BranchSelectController controller = Get.put(BranchSelectController());
  final PointSelectController c = Get.put(PointSelectController());
  final bool isFromMain;

  BranchSelectScreen({Key? key, required this.isFromMain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เลือกร้าน',
          style: const TextStyle(
              // color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'kanit'),
        ),
        backgroundColor: Config.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.05.sw,
          vertical: 0.02.sh,
        ),
        child: Column(
          children: [
            TextField(
              onChanged: controller.filterBranches,
              decoration: InputDecoration(
                hintText: 'เลือกร้าน...',

                // labelText: 'เลือกร้าน...',d
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Config.primaryColor,
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'kanit'), // Set hint text color
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Set border color to white
                  borderRadius: BorderRadius.circular(
                      20.0), // Set corner radius to 20 pixels
                ),
              ),
            ),
            SizedBox(height: 0.02.sh),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.filteredBranches.isEmpty) {
                  return Center(child: Text('No branches found'));
                } else {
                  return ListView.builder(
                    itemCount: controller.filteredBranches.length,
                    itemBuilder: (context, index) {
                      final branch = controller.filteredBranches[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          color: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.red, width: 2),
                          ),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  branch.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'kanit',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  branch.branchType,
                                  style: TextStyle(
                                      color: const Color(0XFF7E7E7E),
                                      fontFamily: 'kanit',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              branch.address,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'kanit'),
                            ),
                            onTap: () {
                              prefs.accessbranchId = branch.id.toString();

                              controller.fetchBranchDetail(
                                  notnetwork: true, id: branch.id.toString());
                              controller.addNewBranch(branchid: branch.id);
                              c.fetchPoint();
                              if (isFromMain) {
                                // If 'main' route exists, pop to it
                                Navigator.popUntil(
                                    context, ModalRoute.withName('main'));
                              } else {
                                // If 'main' route doesn't exist, push a new one
                                Navigator.of(context)
                                    .pushReplacementNamed('main');
                              }
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
