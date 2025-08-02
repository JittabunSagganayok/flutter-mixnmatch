import 'dart:developer';
import 'dart:ffi';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mixnmatch/ext/file_ext.dart';

import 'package:mixnmatch/gen/assets.gen.dart';
import 'package:mixnmatch/providers/image_picker_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class ImageForm extends HookConsumerWidget {
  final ValueChanged<List<String>>? onValueChanged;
  final int maximumImages;
  final ImageSource imageSource;
  final bool hasMultiSource;
  final List<String>? value;
  final ValueChanged<String>? onRemoved;

  const ImageForm({
    super.key,
    this.onValueChanged,
    this.maximumImages = 3,
    this.imageSource = ImageSource.gallery,
    this.hasMultiSource = true,
    this.value,
    this.onRemoved,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final CreditController creditcon = Get.put(CreditController());
    final images = useState<List<String>>([]);
    final imagesName = useState<List<String>>([]);
    final canAddMore = useMemoized(() => images.value.length < maximumImages,
        [maximumImages, images.value]);

    useEffect(() {
      if (value != null) {
        images.value = value!;
      }
      return null;
    }, [value]);

    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1,
      children: List.generate(
          canAddMore ? images.value.length + 1 : images.value.length, (i) {
        if (i == images.value.length) {
          return GestureDetector(
            onTap: () async {
              try {
                ImageSource? source;
                if (hasMultiSource) {
                  source = await showImageSourcePicker(context);
                } else {
                  source = imageSource;
                }

                if (source == null) return;
                if (!context.mounted) return;

                // context.loaderOverlay.show();
                final result =
                    await ref.read(imagePickerProvider.notifier).pickAndUpload(
                          source: source,
                        );
                if (!context.mounted) return;
                print("result filee");
                print(result.file);
                print(result.file.fileName);
                imagesName.value = [...imagesName.value, result.file.fileName];
                images.value = [...images.value, result.url];
                print("image value");
                //array ลิ้งรูปภาพ
                print("${images.value}");

                // creditcon.imagelistupload = images.value;
                // creditcon.imagelistuploadName = imagesName.value;
                // print(creditcon.imagelistupload);
                // creditcon.imagelistupload.length >= 1
                //     ? creditcon.isUpdateRequest.value = true
                //     : null;

                // creditcon.update();
                onValueChanged?.call(images.value);
                // context.loaderOverlay.hide();
              } catch (e, stacktrace) {
                // context.loaderOverlay.hide();
                if (e == "cancel") return;

                if (e is PlatformException &&
                    e.code == "camera_access_denied") {
                  final result = await showOkCancelAlertDialog(
                    context: context,
                    title: "การเข้าถึงสิทธิ์ถูกปฏิเสธ",
                    message: "กรุณาให้สิทธิ์การเข้าถึงการใช้กล้อง",
                    okLabel: "ตั้งค่า",
                  );
                  if (result == OkCancelResult.ok) {
                    // await openAppSettings();
                  }
                  return;
                }

                showOkAlertDialog(context: context, title: e.toString());
                log(e.toString(), stackTrace: stacktrace);
              }
            },
            child: DottedBorder(
                color: const Color(0xFF325FA4),
                dashPattern: const [6, 3],
                strokeWidth: 1,
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.02.sw),
                        child: Image.asset(
                          'assets/images/add-circle.png',
                          fit: BoxFit.fill,
                          width: 0.06.sw,
                        ),
                      ),
                      Text(
                        'เพิ่มรูปภาพ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(11),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )),
          );
        }
        final data = images.value[i];
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.network(
                data,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  // creditcon.isUpdateRequest.value = false;
                  // creditcon.update();
                  final url = images.value[i];
                  images.value = [...images.value..removeAt(i)];
                  onRemoved?.call(url);

                  if (images.value.length == 0) {
                    // creditcon.isUpdateRequest.value = false;
                  }
                  // creditcon.imagelistupload = images.value;
                  // creditcon.imagelistuploadName = imagesName.value;
                  // print(creditcon.imagelistupload);
                  // creditcon.update();
                },
                child: Assets.icons.icImageUploadCancel
                    .image(width: 20, height: 20),
              ),
            ),
          ],
        );
      }),
    );
  }
}

Future<ImageSource?> showImageSourcePicker(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Choose"),
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context, ImageSource.camera);
            },
            leading: const Icon(Icons.camera_alt),
            title: const Text("Camera"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context, ImageSource.gallery);
            },
            leading: const Icon(Icons.photo),
            title: const Text("Gallery"),
          ),
        ],
      ),
    ),
  );
}
