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
      //allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://mcic-uat-api.gramick.dev/api/systems/upload'),
      );

      request.files.add(await http.MultipartFile.fromPath('file', file.path,
          filename: fileName));
      request.fields['module'] = 'customer/file';

      http.StreamedResponse response = await request.send();
      String responseString = await response.stream.bytesToString();
      dynamic jsonResponse = json.decode(responseString);
      if (response.statusCode == 200) {
        String url = jsonResponse['result']['url'];
        urlImage.value = url;
        print('Upload Image Success');
        print(fileName);
        print(urlImage.value);

        c.urlImage.value = urlImage.value;
        isloadingpicprofile.value = false;
        update();
        return UploadResult(true, false, fileName);
      } else {
        print('Upload Image Fail');
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
