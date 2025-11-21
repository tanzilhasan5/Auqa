import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchDrink extends StatefulWidget {
  const SwitchDrink({super.key});

  @override
  State<SwitchDrink> createState() => _SwitchDrinkState();
}

class _SwitchDrinkState extends State<SwitchDrink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Switch Drink',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Color(0xff404040),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: Get.back,
            child: SvgPicture.asset('assets/icons/cross.svg'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff369FFF)),
                      borderRadius: BorderRadius.circular(47),
                      image: DecorationImage(
                        image: AssetImage('assets/icons/water.png'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffB2B2B2)),
                      borderRadius: BorderRadius.circular(47),
                      image: DecorationImage(
                        image: AssetImage('assets/icons/coffee.png'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffB2B2B2)),
                      borderRadius: BorderRadius.circular(47),
                      image: DecorationImage(
                        image: AssetImage('assets/icons/tea.png'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffB2B2B2)),
                      borderRadius: BorderRadius.circular(47),
                      image: DecorationImage(
                        image: AssetImage('assets/icons/juice.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
