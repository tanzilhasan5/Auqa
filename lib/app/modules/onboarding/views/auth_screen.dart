import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Image(image: AssetImage('assets/icons/img.png')),
              SizedBox(height: 60.h),
              Text(
                "Let's Get Started!",
                textAlign: TextAlign.center,
                style: GoogleFonts.playfair(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                  color: const Color(0xff404040),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Care for every step of your journey",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              Spacer(), // pushes buttons to bottom
              SizedBox(
                height: 41.h,
                width: double.infinity,
                child: Button(
                  text: 'Sign up',
                  onPressed: () => Get.offAllNamed('/signup'),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 41.h,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                  ),
                  onPressed: () => Get.offAllNamed('/login'),
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff369FFF),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
