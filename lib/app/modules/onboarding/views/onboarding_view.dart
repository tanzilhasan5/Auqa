import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            _buildSkipButton(),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: controller.pages[index]);
                },
              ),
            ),

            // Page Indicator
            _buildPageIndicator(),

            SizedBox(height: 80.h),

            // Next/Get Started Button
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: SizedBox(
                  height: 41.h,
                  width: double.infinity,
                  child: Button(
                    text:
                        controller.currentPage.value == controller.pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: controller.nextPage
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 10.h),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: controller.skipOnboarding,
          child: Text(
            'Skip',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: const Color(0xff404040),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.pages.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            height: 8.h,
            width: controller.currentPage.value == index ? 24.w : 8.w,
            decoration: BoxDecoration(
              color: controller.currentPage.value == index
                  ? const Color(0xff369FFF)
                  : const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== ONBOARDING PAGE WIDGET ====================
class _OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(data.imagePath, height: 250.h, width: 250.w),
          SizedBox(height: 40.h),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff404040),
              height: 1.3,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff625D5D),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
