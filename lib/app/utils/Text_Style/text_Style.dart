import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle title26_w600({Color? color}) => GoogleFonts.inter(fontSize: 26.sp, fontWeight: FontWeight.w600, color: color,);
  static TextStyle title14_w500({Color? color}) => GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, color: color,);
  static TextStyle title14_w400({Color? color}) => GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: color,);
  static TextStyle title16_w500({Color? color}) => GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 16.sp,color: color);
  static TextStyle title20_w500({Color? color}) => GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 20.sp,color: color);
  static TextStyle title16_w800({Color? color}) => GoogleFonts.inter(fontWeight: FontWeight.w800,fontSize: 16.sp,color: color);
  static TextStyle title16_w600({Color? color}) => GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 16.sp,color: color);
  static TextStyle title16_w400({Color? color}) => GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 16.sp,color: color);
  static TextStyle title10_w500({Color? color}) => GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w500,color: color);
  static TextStyle title12_w400({Color? color}) => GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w400,color: color);
  static TextStyle title12_w600({Color? color}) => GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w600,color: color);
  static TextStyle title20_w600({Color? color}) => GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600,color: color);

}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withOpacity(double opacity) => copyWith(
    color: color?.withOpacity(opacity),
  );
}