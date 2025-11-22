import 'package:aqua/app/modules/login/controllers/checkbox_controller_controller.dart';
import 'package:aqua/app/modules/login/controllers/hiddenpass_controller.dart';
import 'package:aqua/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/birthdaypickerfield.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/on_Divider.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final CheckboxController checkboxCtrl = Get.find<CheckboxController>();
    final TextEditingController passwordCtrl = TextEditingController();
    final TextEditingController confirmPasswordCtrl = TextEditingController();
    final PassController passCtrl = Get.find<PassController>();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create an account',
                      style: GoogleFonts.playfair(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: Color(0xff2C2C2C),
                      ),
                    ),
                    Text(
                      'Please sign up your account',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              Text(
                'Name',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xff2C2C2C),
                ),
              ),
              SizedBox(height: 5.h),

              CustomTextFormField(
                hintText: 'Enter Full Name',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SvgPicture.asset('assets/icons/email.svg'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your Name";
                  }
                },
              ),
              SizedBox(height: 10.h),
              Text(
                'Email',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xff2C2C2C),
                ),
              ),
              SizedBox(height: 5.h),

              CustomTextFormField(
                hintText: 'Enter Email Address',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SvgPicture.asset('assets/icons/email.svg'),
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
              SizedBox(height: 10.h),
              Text(
                'Date of Birth',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xff2C2C2C),
                ),
              ),
              SizedBox(height: 5.h),
              BirthdayPickerField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Birthday is required';
                  }
                },
              ),
              SizedBox(height: 10.h),
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
              SizedBox(height: 8.h),
              Row(
                children: [
                  CustomCheckbox(
                    value: checkboxCtrl.isChecked,
                    showError: checkboxCtrl.showError,
                    onChanged: () {
                      checkboxCtrl.isChecked.toggle();
                    },
                  ),
                  SizedBox(width: 10.w),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2C2C2C),
                      ),
                      children: [
                        const TextSpan(text: "I agree with "),
                        TextSpan(
                          text: 'terms & conditions',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff369FFF),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2C2C2C),
                      ),
                      children: [
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: 'privacy policy',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff369FFF),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              SizedBox(
                width: double.infinity,
                height: 41.h,
                child: Button(
                  text: 'Sign up',
                  onPressed: () {
                    // Form validation first
                    /*if (_formKey.currentState!.validate()) {
                      // Hide error if user checked
                      checkboxCtrl.showError.value = false;
                      // 🔥 Checkbox validation
                      if (!checkboxCtrl.isChecked.value) {
                        checkboxCtrl.showError.value =
                            true; // Show error under checkbox
                        return; // Stop signup
                      }
                      Get.snackbar(
                        "Success",
                        "Signup successfully!",
                        snackPosition: SnackPosition.TOP,
                        colorText: Colors.black,
                        backgroundColor: Colors.transparent,
                      );
                      Get.toNamed('/signupsteps');
                    }
                    else {
                      // Form field errors
                      Get.snackbar(
                        "Error",
                        "Please correct all fields",
                        colorText: Colors.black,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.transparent,
                      );
                    }*/

                    Get.toNamed(Routes.SIGNUPSTEPS);
                  },
                ),
              ),
              SizedBox(height: 25.h),

              /// OR DIVIDER
              OrDivider(
                child: Text(
                  'OR',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: Color(0xff369FFF),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// SOCIAL LOGINS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icons/google.svg'),
                  ),
                  SizedBox(width: 20.w),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icons/apple.svg'),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // SIGNUP TEXT
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
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff369FFF),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.offAllNamed(Routes.LOGIN),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }
}
