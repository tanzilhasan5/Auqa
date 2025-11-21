import 'package:aqua/app/modules/login/controllers/hiddenpass_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';

class ResetpassView extends StatefulWidget {
  const ResetpassView({super.key});

  @override
  State<ResetpassView> createState() => _ResetpassViewState();
}

class _ResetpassViewState extends State<ResetpassView> {
  final PassController passCtrl = Get.find<PassController>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          color: Color(0xff2C2C2C),
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

                /// ---------------- Password ----------------
                Text(
                  'Password',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Color(0xff2C2C2C),
                  ),
                ),
                SizedBox(height: 5.h),

                Obx(
                  () => CustomTextFormField(
                    controller: passwordCtrl,
                    obscureText: passCtrl.isPasswordHidden.value,
                    hintText: 'Enter Your Password',

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset('assets/icons/fingure.svg'),
                    ),

                    suffixIcon: GestureDetector(
                      onTap: passCtrl.togglePassword,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: SvgPicture.asset(
                          passCtrl.isPasswordHidden.value
                              ? 'assets/icons/eye.svg'
                              : 'assets/icons/oneye.svg',
                        ),
                      ),
                    ),

                    onChanged: (value) {
                      passCtrl.password.value = value;
                    },

                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Password is required";
                      if (value.length < 6)
                        return "Minimum 6 characters required";
                      if (!RegExp(r'[A-Z]').hasMatch(value))
                        return "Must contain uppercase letter";
                      if (!RegExp(r'[a-z]').hasMatch(value))
                        return "Must contain lowercase letter";
                      if (!RegExp(r'[0-9]').hasMatch(value))
                        return "Must contain a number";
                      if (!RegExp(r'[!@#\$%^&*(),.?\":{}|<>]').hasMatch(value))
                        return "Must contain a special character";
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 10.h),

                /// ---------------- Confirm Password ----------------
                Text(
                  'Confirm Password',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Color(0xff2C2C2C),
                  ),
                ),
                SizedBox(height: 5.h),

                Obx(
                  () => CustomTextFormField(
                    controller: confirmPasswordCtrl,
                    obscureText: passCtrl.isConfirmPasswordHidden.value,
                    hintText: 'Re-enter Your Password',

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset('assets/icons/fingure.svg'),
                    ),

                    suffixIcon: GestureDetector(
                      onTap: passCtrl.toggleConfirmPassword,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: SvgPicture.asset(
                          passCtrl.isConfirmPasswordHidden.value
                              ? 'assets/icons/eye.svg'
                              : 'assets/icons/oneye.svg',
                        ),
                      ),
                    ),

                    onChanged: (value) {
                      passCtrl.confirmPassword.value = value;
                    },

                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Confirm password is required";

                      if (value != passCtrl.password.value)
                        return "Passwords do not match";

                      return null;
                    },
                  ),
                ),

                SizedBox(height: 30.h),

                SizedBox(
                  width: double.infinity,
                  height: 41.h,
                  child: Button(
                    text: 'Submit Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Success",
                          "Signup successfully!",
                          snackPosition: SnackPosition.TOP,
                          colorText: Colors.black,
                          backgroundColor: Colors.transparent,
                        );
                        Get.toNamed('/backlogin');
                      } else {
                        Get.snackbar(
                          "Error",
                          "Fix all errors before continuing",
                          snackPosition: SnackPosition.TOP,
                          colorText: Colors.black,
                          backgroundColor: Colors.transparent,
                        );
                      }
                    },
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
