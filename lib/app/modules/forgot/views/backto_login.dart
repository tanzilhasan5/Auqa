import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';

class BacktoLogin extends StatefulWidget {
  const BacktoLogin({super.key});

  @override
  State<BacktoLogin> createState() => _BacktoLoginState();
}

class _BacktoLoginState extends State<BacktoLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/logo1.svg',
                height: 68.h,
                width: 57.w,
              ),
              SizedBox(height: 30.h),
              Text(
                'Password changed',
                style: GoogleFonts.playfair(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: Color(0xff2C2C2C),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Your password has been changed successfully',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 41.h,
                child: Button(
                  text: 'Back to login',
                  onPressed: () => Get.toNamed('/login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
