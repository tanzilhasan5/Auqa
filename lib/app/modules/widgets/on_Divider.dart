import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrDivider extends StatelessWidget {
  // final String text;
  final Widget? child;
  final Color? lineColor;
  final Color? textColor;
  final double thickness;
  final double spacing;

  const OrDivider({
    Key? key,
    // this.text = 'OR',
    this.child,
    this.lineColor,
    this.textColor,
    this.thickness = 1.0,
    this.spacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor ?? Colors.grey[300],
            thickness: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: child,
        ),
        Expanded(
          child: Divider(
            color: lineColor ?? Colors.grey[300],
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}