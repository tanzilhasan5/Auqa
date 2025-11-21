import 'package:aqua/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/on_Divider.dart';
import '../controllers/checkbox_controller_controller.dart';
import '../controllers/hiddenpass_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckboxController checkboxCtrl = Get.find<CheckboxController>();
    final PassController passCtrl = Get.find<PassController>();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 95.h),

              /// LOGO + TITLE
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/logo1.svg',
                      height: 68.h,
                      width: 57.w,
                    ),
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.playfair(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp,
                        color: Color(0xff404040),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Login to your account',
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

              /// EMAIL
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

              SizedBox(height: 20.h),

              /// PASSWORD
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return "Password must contain at least 1 uppercase letter";
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return "Password must contain at least 1 lowercase letter";
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return "Password must contain at least 1 number";
                    }
                    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return "Password must contain at least 1 special character";
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 10.h),

              /// REMEMBER ME + FORGOT
              Row(
                children: [
                  GestureDetector(
                    onTap: () => checkboxCtrl.isChecked.toggle(),
                    child: Obx(
                      () => Container(
                        height: 18.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                          color: checkboxCtrl.isChecked.value
                              ? Color(0xff369FFF).withOpacity(0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xff369FFF),
                            width: 1.4,
                          ),
                        ),
                        child: checkboxCtrl.isChecked.value
                            ? Icon(
                                Icons.check,
                                size: 14,
                                color: Color(0xff369FFF),
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Remember me",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xff2C2C2C),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => Get.toNamed('/forgot'),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Color(0xff2C2C2C),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              /// SIGN IN BUTTON
              SizedBox(
                width: double.infinity,
                height: 41.h,
                child: Button(
                  text: 'Sign in',
                  onPressed: () {
                   /* if (_formKey.currentState!.validate()) {
                      Get.snackbar(
                        "Success",
                        "Login successfully!",
                        snackPosition: SnackPosition.TOP,
                        colorText: Colors.black,
                        backgroundColor: Colors.transparent,
                      );
                      Get.offAllNamed(Routes.MAIN_BOTTOM_NAV_BAR);
                    }
                    else {
                      Get.snackbar(
                        "Error",
                        "Please correct all fields",
                        colorText: Colors.black,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.transparent,
                      );
                    }*/
                    Get.offAllNamed(Routes.MAIN_BOTTOM_NAV_BAR);
                  },
                ),
              ),

              SizedBox(height: 30.h),

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

              SizedBox(height: 25.h),

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

              SizedBox(height: 25.h),

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
                      const TextSpan(text: "Don’t have an account? "),
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff369FFF),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.offAllNamed('/signup'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
