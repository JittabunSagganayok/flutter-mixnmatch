import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/button_widget.dart';
// import 'package:we_link/components/profile/profileComponent/SwitchToStaff/widgets/button_widget.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String content;
  final VoidCallback? onSubmit;
  final String? title;
  final String? buttontext;
  // ignore: use_key_in_widget_constructors
  const ErrorDialogWidget(
      {required this.content,
      required this.onSubmit,
      this.title,
      this.buttontext});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      // contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/error.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title ?? 'Error',
                style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                // textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          content.isNotEmpty
              ? Text(content,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: const Color(0XFF7E7E7E)))
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonWidget(
              onPressed: onSubmit,
              height: 48,
              width: 197,
              radius: 20,
              title: buttontext ?? 'OK',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}

class ErrorDialogWidgetForlimit extends StatelessWidget {
  final String content;
  final VoidCallback? onSubmit;
  final String? title;
  final String? buttontext;
  // ignore: use_key_in_widget_constructors
  const ErrorDialogWidgetForlimit(
      {required this.content,
      required this.onSubmit,
      this.title,
      this.buttontext});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      // contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/error.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title ?? 'Error',
                style: GoogleFonts.kanit(
                    fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          content.isNotEmpty
              ? Text(content,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: const Color(0XFF7E7E7E)))
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonWidget(
              onPressed: onSubmit,
              height: 48,
              width: 197,
              radius: 20,
              title: buttontext ?? 'OK',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}

class ErrorDialogWidgetforbill extends StatelessWidget {
  final String content;
  final VoidCallback? onSubmit;
  final String? title;
  // ignore: use_key_in_widget_constructors
  const ErrorDialogWidgetforbill(
      {required this.content, required this.onSubmit, this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      // contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/error.png',
                ),
              ),
              // const SizedBox(height: 10),
              // Text(title ?? 'Error',
              //     style: GoogleFonts.kanit(
              //         fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          content.isNotEmpty
              ? Text(content,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF7E7E7E)))
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonWidget(
              onPressed: onSubmit,
              height: 48,
              width: 197,
              radius: 20,
              title: 'OK',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
