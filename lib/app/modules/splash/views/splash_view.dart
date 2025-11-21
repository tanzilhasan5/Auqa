import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/splash.svg',
              height: 165.82.h,
              width: 139.w,
            ),
        
            SizedBox(height: 30.h),
            Text(
              "Let's start this hydration\njourney together",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: Color(0xff404040),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* Image(image: AssetImage('assets/icons/img.png')),*/