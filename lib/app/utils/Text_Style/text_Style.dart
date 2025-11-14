import 'package:flutter/material.dart';

class AppTextStyles {
  // ====================
  // HEADINGS
  // ====================

  // H1 - Extra Large Heading
  static TextStyle h1({Color? color}) => TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle titleFont({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle water({Color? color}) => TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: color);
  static TextStyle timer({Color? color}) => TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: color);

}

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get italic => copyWith(fontStyle: FontStyle.normal);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withOpacity(double opacity) => copyWith(
    color: color?.withOpacity(opacity),
  );
}