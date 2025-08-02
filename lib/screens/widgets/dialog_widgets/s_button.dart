import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixnmatch/utils/config.dart';

abstract class SButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const SButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  factory SButton.primary({
    required VoidCallback? onPressed,
    required String text,
  }) {
    return _Primary(onPressed: onPressed, text: text);
  }

  factory SButton.secondary({
    required VoidCallback onPressed,
    required String text,
  }) {
    return _Secondary(onPressed: onPressed, text: text);
  }

  factory SButton.text({
    required VoidCallback onPressed,
    required String text,
  }) {
    return _Text(onPressed: onPressed, text: text);
  }
}

class _Primary extends SButton {
  const _Primary({required super.onPressed, required super.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: 16.sp,
          horizontal: 16.sp,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Config.primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 32.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        textStyle: GoogleFonts.kanit(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _Secondary extends SButton {
  const _Secondary({required super.onPressed, required super.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: 16.sp,
          horizontal: 16.sp,
        ),
        foregroundColor: const Color(0xFF325FA4),
        backgroundColor: const Color(0xFFE6F0FF),
        minimumSize: Size(MediaQuery.of(context).size.width, 32.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        textStyle: GoogleFonts.kanit(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _Text extends SButton {
  const _Text({required super.onPressed, required super.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: const Color(0xFF325FA4),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        minimumSize: Size(MediaQuery.of(context).size.width, 32.h),
        textStyle: GoogleFonts.kanit(fontWeight: FontWeight.w500),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
