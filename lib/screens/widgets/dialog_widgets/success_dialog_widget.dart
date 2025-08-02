import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/button_widget.dart';

class SuccessDialogWidget extends StatelessWidget {
  const SuccessDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.submitButton,
    required this.submitText,
    this.onSubmit,
  }) : super(key: key);

  final String title;
  final String content;
  final bool submitButton;
  final String submitText;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                child: Image.asset(
                  'assets/success_dialog_icon.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(title,
                  style: GoogleFonts.kanit(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content.isNotEmpty
              ? Text(content,
                  style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: const Color(0XFF7E7E7E)))
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          submitButton == true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ButtonWidget(
                    onPressed: onSubmit,
                    height: 48,
                    width: 197,
                    radius: 20,
                    title: submitText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}

class CancelDialogWidget extends StatelessWidget {
  const CancelDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.submitButton,
    required this.submitText,
    required this.cancelText,
    this.onSubmit,
    this.onCancel,
  }) : super(key: key);

  final String title;
  final String content;
  final bool submitButton;
  final String submitText;
  final String cancelText;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Center(
          child: Column(
            children: [
              // Container(
              //   width: 64,
              //   height: 64,
              //   child: Image.asset(
              //     'assets/images/success_dialog_icon.png',
              //   ),
              // ),
              const SizedBox(height: 10),
              Center(
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content.isNotEmpty
              ? Center(
                  child: Text(content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: const Color(0XFF7E7E7E))),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          submitButton == true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget3(
                        onPressed: onCancel,
                        height: 48,
                        width: 90,
                        radius: 20,
                        title: cancelText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      ButtonWidget2(
                        onPressed: onSubmit,
                        height: 48,
                        width: 90,
                        radius: 20,
                        title: submitText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}

class CancelDialogWidgetforlogin extends StatelessWidget {
  const CancelDialogWidgetforlogin({
    Key? key,
    required this.title,
    required this.content,
    required this.submitButton,
    required this.submitText,
    required this.cancelText,
    this.onSubmit,
    this.onCancel,
  }) : super(key: key);

  final String title;
  final String content;
  final bool submitButton;
  final String submitText;
  final String cancelText;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Center(
          child: Column(
            children: [
              // Container(
              //   width: 64,
              //   height: 64,
              //   child: Image.asset(
              //     'assets/images/success_dialog_icon.png',
              //   ),
              // ),
              const SizedBox(height: 10),
              Text(title,
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content.isNotEmpty
              ? Text(content,
                  style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: const Color(0XFF7E7E7E)))
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          submitButton == true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidgetcancel(
                        onPressed: onCancel,
                        height: 48,
                        width: 90,
                        radius: 20,
                        title: cancelText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      ButtonWidget(
                        onPressed: onSubmit,
                        height: 48,
                        width: 90,
                        radius: 20,
                        title: submitText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
