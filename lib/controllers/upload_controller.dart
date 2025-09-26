// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/controllers/submitDisplay_controller.dart';
// import 'package:mcic_app/constant/configs.dart';
// import 'package:mcic_app/user/components/sign_up/location/location_controller.dart';
// import 'package:mcic_app/utils/prefs.dart';
// import 'package:mcic_app/widgets/dialog.dart';

class UploadController extends GetxController {
  final SubmitDisplayController c = Get.put(SubmitDisplayController());
  var urlImage = ''.obs;
  RxBool isloadingpicprofile = false.obs;

  Future<UploadResult> profileImage() async {
    isloadingpicprofile.value = true;
    update();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;

      // ✅ 1) อ่านไฟล์เป็น bytes
      List<int> imageBytes = await file.readAsBytes();
      // ✅ 2) แปลงเป็น base64
      String base64Image = base64Encode(imageBytes);

      // ✅ 3) เตรียมฟอร์มสำหรับส่งไป ImgBB
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.imgbb.com/1/upload'),
      );

      request.fields['key'] =
          "2bf0c42dda87f36be6bed9fc7e6bd198"; // ใส่ API Key ของคุณ
      request.fields['image'] = base64Image;

      http.StreamedResponse response = await request.send();
      String responseString = await response.stream.bytesToString();
      dynamic jsonResponse = json.decode(responseString);

      if (response.statusCode == 200 && jsonResponse["success"] == true) {
        String url = jsonResponse['data']['url'];
        urlImage.value = url;

        print('✅ Upload Image Success');
        print('FileName: $fileName');
        print('Image URL: $url');

        c.urlImage.value = urlImage.value;
        isloadingpicprofile.value = false;
        update();

        return UploadResult(true, false, fileName);
      } else {
        print('❌ Upload Image Fail');
        isloadingpicprofile.value = false;
        c.urlImage.value = "";
        update();
        return UploadResult(false, true, '');
      }
    } else {
      isloadingpicprofile.value = false;
      c.urlImage.value = "";
      update();
      return UploadResult(false, false, '');
    }
  }
}

class UploadResult {
  final bool isUploaded;
  final bool uploadFailed;
  final String fileName;

  UploadResult(this.isUploaded, this.uploadFailed, this.fileName);

  // Getter for isUploaded
  bool get getIsUploaded => isUploaded;

  // Getter for uploadFailed
  bool get getUploadFailed => uploadFailed;

  // Getter for fileName
  String get getFileName => fileName;
}
