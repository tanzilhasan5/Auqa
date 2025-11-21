import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';

class OwnGoal extends StatefulWidget {
  const OwnGoal({super.key});

  @override
  State<OwnGoal> createState() => _OwnGoalState();
}

class _OwnGoalState extends State<OwnGoal> {
  final _formKey = GlobalKey<FormState>();
 final TextEditingController waterIntakeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: GestureDetector(
                  onTap: Get.back,
                  child: SvgPicture.asset('assets/icons/Left.svg'),
                ),
              ),
              SizedBox(height: 180.h),
              Text(
                'Set daily goal',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                  color: Color(0xff404040),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Your recommended goal: 2500 ml/day',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Color(0xff575757),
                ),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                  width: 151.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: waterIntakeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Can't be empty";
                      }
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 30,top: 14.5),
                        child: Text('ml'),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      hintText: '0',
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Color(0xff404040),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(38.r),
                        borderSide: const BorderSide(
                          color: Color(0xff369FFF),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.r),
                        borderSide: const BorderSide(
                          color: Color(0xff369FFF),
                          width: 1.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.r),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.2,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.r),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 1.5,
                        ),
                      ),
                    ),
              ),
              ),
              SizedBox(height: 300.h),
              SizedBox(
                width: double.infinity,
                height: 41.h,
                child: Button(
                  text: 'Send code',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed('/allset',parameters: {
                        'passMlLavel': waterIntakeController.text
                      });
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please correct all fields",
                        colorText: Colors.black,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.transparent,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
