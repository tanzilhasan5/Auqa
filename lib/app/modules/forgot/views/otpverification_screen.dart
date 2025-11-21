import 'package:aqua/app/modules/forgot/controllers/pinput_controller.dart';
import 'package:aqua/app/modules/forgot/views/otp_resend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/custom_button.dart';

class OtpverificationScreen extends StatefulWidget {
  const OtpverificationScreen({super.key});

  @override
  State<OtpverificationScreen> createState() => _OtpverificationScreenState();
}

class _OtpverificationScreenState extends State<OtpverificationScreen> {
  final _formKey = GlobalKey<FormState>();
  late final PinController pinController;
  final RxBool showError = false.obs;
  final TextEditingController pinputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controller in initState
    pinController = Get.put(PinController(), tag: 'otp_pin');
  }

  @override
  void dispose() {
    pinputController.dispose();
    Get.delete<PinController>(tag: 'otp_pin'); // Clean up controller
    super.dispose();
  }

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

                /// Back Icon
                GestureDetector(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset('assets/icons/Left.svg'),
                ),

                SizedBox(height: 80.h),

                /// Logo + Email Text
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
                        'Please check your email',
                        style: GoogleFonts.playfair(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                          color: const Color(0xff2C2C2C),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "We've sent a code to sohan@gmail.com",
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

                /// ---------------- Pinput ----------------
                Center(
                  child: Pinput(
                    controller: pinputController,
                    length: 4,
                    showCursor: true,
                    separatorBuilder: (_) => SizedBox(width: 16.w),

                    onChanged: (value) {
                      pinController.updatePin(value);
                      if (value.length == 4) {
                        showError.value = false;
                      }
                    },

                    onCompleted: (value) {
                      pinController.updatePin(value);
                      showError.value = false;
                    },

                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 60.h,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        color: const Color(0xff2D8CFF),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff2D8CFF),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    focusedPinTheme: PinTheme(
                      width: 50.w,
                      height: 60.h,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        color: const Color(0xff2D8CFF),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff2D8CFF),
                            width: 3,
                          ),
                        ),
                      ),
                    ),

                    submittedPinTheme: PinTheme(
                      width: 50.w,
                      height: 60.h,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        color: const Color(0xff2D8CFF),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff2D8CFF),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    errorPinTheme: PinTheme(
                      width: 50.w,
                      height: 60.h,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Error message
                Obx(
                  () => Visibility(
                    visible: showError.value,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Center(
                        child: Text(
                          "Please enter a valid OTP",
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 41.h,
                  child: Button(
                    text: 'Submit code',
                    onPressed: () {
                      if (!pinController.isPinLengthValid()) {
                        showError.value = true;
                        return;
                      }

                      // Clear error if shown
                      showError.value = false;

                      Get.snackbar(
                        "Success",
                        "OTP Verified!",
                        colorText: Colors.black,
                        backgroundColor: Colors.white,
                        snackPosition: SnackPosition.TOP,
                      );

                      // Optional: Navigate to next screen
                      Get.toNamed('/resetpass');
                    },
                  ),
                ),

                SizedBox(height: 25.h),

                /// Resend OTP Text
                OtpResendText(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
