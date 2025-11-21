import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset('assets/icons/Left.svg'),
                ),
                SizedBox(height: 80.h),
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/logo1.svg',
                        height: 68.h,
                        width: 57.w,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Request Password Reset',
                        style: GoogleFonts.playfair(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                          color: const Color(0xff2C2C2C),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Don’t worry! It happens. Please enter the email associated with your account.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Email',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xff2C2C2C),
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  hintText: 'Enter Email Address',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: SvgPicture.asset(
                      'assets/icons/email.svg',
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    // Universal email regex (Gmail, Yahoo, Outlook, Company domains, etc.)
                    bool isValid = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value);

                    if (!isValid) {
                      return "Enter a valid email address";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  height: 41.h,
                  child: Button(
                    text: 'Send code',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed('/otp_screen');
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
                SizedBox(height: 25.h),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2C2C2C),
                      ),
                      children: [
                        const TextSpan(text: "Remember your password? "),
                        TextSpan(
                          text: 'Sign In',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff369FFF),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed('/login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
