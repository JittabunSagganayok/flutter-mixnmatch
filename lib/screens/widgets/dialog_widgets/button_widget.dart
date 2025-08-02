import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color bgColor, fontColor;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;

  // ignore: use_key_in_widget_constructors
  const ButtonWidget(
      {required this.onPressed,
      required this.title,
      this.bgColor = const Color(0xFF325FA4),
      this.fontColor = Colors.white,
      this.height = 50,
      required this.width,
      this.radius = 8,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: bgColor,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.kanit(
                fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
          ),
        ),
      ),
    );
  }
}

class ButtonWidgetcancel extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color bgColor, fontColor;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;

  // ignore: use_key_in_widget_constructors
  const ButtonWidgetcancel(
      {required this.onPressed,
      required this.title,
      this.fontColor = const Color(0xFF325FA4),
      this.bgColor = Colors.white,
      this.height = 50,
      required this.width,
      this.radius = 8,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: bgColor,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.kanit(
                fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget2 extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color bgColor, fontColor;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;

  // ignore: use_key_in_widget_constructors
  const ButtonWidget2(
      {required this.onPressed,
      required this.title,
      this.bgColor = const Color(0xffC42A27),
      this.fontColor = Colors.white,
      this.height = 50,
      required this.width,
      this.radius = 8,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: bgColor,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.kanit(
                fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget3 extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color bgColor, fontColor;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;

  // ignore: use_key_in_widget_constructors
  const ButtonWidget3(
      {required this.onPressed,
      required this.title,
      this.bgColor = Colors.white,
      this.fontColor = const Color(0xFF325FA4),
      this.height = 50,
      required this.width,
      this.radius = 8,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: fontColor, width: 1),
        ),
        color: bgColor,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.kanit(
                fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
          ),
        ),
      ),
    );
  }
}
