import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final double borderRadius;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xff369FFF),
    this.borderRadius = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color:  Color(0xffFFFFFF),
        ),
      ),
    );
  }
}