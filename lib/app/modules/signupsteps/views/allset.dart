import 'package:aqua/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';

class AllSet extends StatefulWidget {
  const AllSet({super.key});

  @override
  State<AllSet> createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {
  var passMl = Get.parameters['passMlLavel'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 46.h),
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: GestureDetector(
                onTap: Get.back,
                child: SvgPicture.asset('assets/icons/Left.svg'),
              ),
            ),
            SizedBox(height: 127.h),
            Text(
              'You are all set',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 26.sp,
                color: Color(0xff404040),
              ),
            ),
            SizedBox(height: 35.h),
            SvgPicture.asset('assets/icons/logo5.svg'),
            SizedBox(height: 260.h),
            SizedBox(
              width: double.infinity,
              height: 41.h,
              child: Button(
                text: "Let's hydrated",
                onPressed: () => Get.offAllNamed(Routes.MAIN_BOTTOM_NAV_BAR,parameters: {'passMlLavel':passMl.toString()}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
