import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixnmatch/providers/disposable_state_notifier.dart';
import 'package:mixnmatch/providers/uploader/upload_service.dart';
import 'package:mixnmatch/providers/uploader/uploader_state.dart';

final imagePickerProvider =
    StateNotifierProvider<ImagePickerNotifier, dynamic>((ref) {
  return ImagePickerNotifier(ref.read(uploadServiceProvider));
});

class ImagePickerNotifier extends DisposableStateNotifier<dynamic> {
  UploadService service;
  ImagePickerNotifier(this.service) : super(null);

  Future<ImageUploadResult> pickAndUpload({required ImageSource source}) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: source);

    if (result == null) throw "cancel";
    final file = File(result.path);
    print("ชื่อไฟล์");

    print(result.name);

    final url = await service.uploadFile(file).single;
    return ImageUploadResult(file: file, url: url);
  }
}
