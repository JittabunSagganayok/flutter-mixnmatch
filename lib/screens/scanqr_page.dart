import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixnmatch/controllers/branch_controller.dart';
import 'package:mixnmatch/controllers/scan_controller.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/success_dialog_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

// import 'widgets/barcode_scanner_frame.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrcodes extends StatefulWidget {
  const ScanQrcodes({Key? key}) : super(key: key);

  @override
  State<ScanQrcodes> createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanQrcodes> {
  final ScanController c = Get.put(ScanController());
  final _debouncer = Debouncer(const Duration(milliseconds: 300));
  MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    facing: CameraFacing.back,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  String? barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.7),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 32.w,
            leading: Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, barcode);
                  },
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'กรุณาวางคิวอาร์โค้ดให้อยู่ใน\nพื้นที่ที่กำหนด',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            fit: BoxFit.fitHeight,
            onDetect: (capture) {
              final BranchSelectController controller =
                  Get.put(BranchSelectController());
              var barcode = capture.barcodes.last.rawValue;
              if (barcode != null && barcode.isNotEmpty) {
                _debouncer.run(() {
                  Navigator.pop(context, barcode);
                  try {
                    int parsedBarcode = int.parse(barcode);

                    controller.addNewBranch(branchid: parsedBarcode);
                    c.onDetectQr(branchidFromScan: parsedBarcode);
                    _showSuccessDialog(
                        context, "เช็คอินสำเร็จ", "ได้รับแต้มสะสม +10 คะแนน");
                  } catch (e) {
                    _showErrorDialog(context, "Try Again Invalid Qrcode");
                  }
                });
              }
            },
          ),

          /// frame
          Align(
            alignment: Alignment.center,
            child: BarcodeScannerFrame(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width * .85,
            ),
          ),

          /// bottom button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              height: 85.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: ValueListenableBuilder(
                      valueListenable: controller.torchState,
                      builder: (context, state, child) {
                        return Image.asset(
                          'assets/flash1.png',
                          width: 0.1.sw,
                        );
                      },
                    ),
                    onTap: () => controller.toggleTorch(),
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'assets/image.png',
                      width: 0.1.sw,
                    ),
                    onTap: () async {
                      final picker = ImagePicker();
                      // Pick an image
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        if (!(await controller.analyzeImage(image.path))) {
                          if (!mounted) return;
                          _showErrorDialog(context, "Invalid QrCode");
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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

class Debouncer {
  Debouncer(this.duration);

  final Duration duration;
  VoidCallback? action;
  Timer? _timer;

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration, action);
  }
}

class BarcodeScannerFrame extends StatelessWidget {
  const BarcodeScannerFrame({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/barcodeborder1.png',
              width: 0.1.sw,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/barcodeborder2.png',
              width: 0.1.sw,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/barcodeborder3.png',
              width: 0.1.sw,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/barcodeborder4.png',
              width: 0.1.sw,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 1.5,
              height: height,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
