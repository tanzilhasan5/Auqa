import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';
import '../controllers/signupsteps_controller.dart';

class SignupstepsView extends GetView<SignupstepsController> {
  const SignupstepsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            Obx(
              () => LinearProgressIndicator(
                value: controller.progress,
                backgroundColor: const Color(0xffE8E8E8),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xff369FFF),
                ),
                minHeight: 3,
              ),
            ),

            // Content
            Expanded(
              child: Obx(() {
                switch (controller.currentStep.value) {
                  case 0:
                    return _buildGenderStep();
                  case 1:
                    return _buildAgeStep();
                  case 2:
                    return _buildWeightStep();
                  case 3:
                    return _buildActivityStep();
                  case 4:
                    return _buildClimateStep();
                  case 5:
                    return _buildSleepStep();
                  case 6:
                    return _buildCalculatingStep();
                  case 7:
                    return _buildResultStep();
                  default:
                    return const SizedBox();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Step 1: Gender with CupertinoPicker
  Widget _buildGenderStep() {
    final genderOptions = ['Male', 'Female', 'Prefer not to say'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "What's your gender?",
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 90.h),
          Center(
            child: SizedBox(
              height: 200.h,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: controller.selectedGender.value.isEmpty
                      ? 0
                      : genderOptions.indexOf(controller.selectedGender.value),
                ),
                itemExtent: 50.h,
                diameterRatio: 1.5,
                squeeze: 1.2,
                onSelectedItemChanged: (index) {
                  controller.selectGender(genderOptions[index]);
                },
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                      bottom: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w ,
                      ),
                    ),
                  ),
                ),
                children: List.generate(
                  genderOptions.length,
                  (index) => Center(
                    child: Obx(
                      () => Text(
                        genderOptions[index],
                        style: GoogleFonts.inter(
                          fontSize:
                              controller.selectedGender.value ==
                                  genderOptions[index]
                              ? 20.sp
                              : 16.sp,
                          fontWeight:
                              controller.selectedGender.value ==
                                  genderOptions[index]
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color:
                              controller.selectedGender.value ==
                                  genderOptions[index]
                              ? const Color(0xff369FFF)
                              : const Color(0xffC7C7CC),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Obx(
            () => _buildNextButton(controller.selectedGender.value.isNotEmpty),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 2: Age with Cupertino Picker
  Widget _buildAgeStep() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "What's your age?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 90.h),
          Center(
            child: SizedBox(
              height: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Age Picker
                  SizedBox(
                    width: 80.w,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: controller.age.value - 10,
                      ),
                      itemExtent: 50.h,
                      diameterRatio: 1.5,
                      squeeze: 1.2,
                      onSelectedItemChanged: (index) {
                        controller.updateAge(index + 10);
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: const Color(0xff369FFF),
                              width: 0.5.w,
                            ),
                            bottom: BorderSide(
                              color: const Color(0xff369FFF),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                      ),
                      children: List.generate(91, (index) {
                        final value = index + 10;
                        return Center(
                          child: Obx(
                            () => Text(
                              '$value',
                              style: GoogleFonts.inter(
                                fontSize: controller.age.value == value
                                    ? 28.sp
                                    : 18.sp,
                                fontWeight: controller.age.value == value
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: controller.age.value == value
                                    ? const Color(0xff369FFF)
                                    : const Color(0xffC7C7CC),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      'years',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffC7C7CC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          _buildNextButton(true),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 3: Weight with Cupertino Picker and Unit Selector
  Widget _buildWeightStep() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "What's your weight?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 90.h,),
          Center(
            child: SizedBox(
              height: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Weight Picker
                  SizedBox(
                    width: 80.w,
                    child: Obx(
                      () => CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: controller.weightUnit.value == 'Kg'
                              ? (controller.weight.value - 30).clamp(0, 120)
                              : (controller.weight.value - 66).clamp(0, 264),
                        ),
                        itemExtent: 50.h,
                        diameterRatio: 1.5,
                        squeeze: 1.2,
                        onSelectedItemChanged: (index) {
                          if (controller.weightUnit.value == 'Kg') {
                            controller.updateWeight(index + 30);
                          } else {
                            controller.updateWeight(index + 66);
                          }
                        },
                        selectionOverlay: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: const Color(0xff369FFF),
                                width: 0.5.w,
                              ),
                              bottom: BorderSide(
                                color: const Color(0xff369FFF),
                                width: 0.5.w,
                              ),
                            ),
                          ),
                        ),
                        children: List.generate(
                          controller.weightUnit.value == 'Kg' ? 121 : 265,
                          (index) {
                            final value = controller.weightUnit.value == 'Kg'
                                ? index + 30
                                : index + 66;
                            return Center(
                              child: Obx(
                                () => Text(
                                  '$value',
                                  style: GoogleFonts.inter(
                                    fontSize: controller.weight.value == value
                                        ? 28.sp
                                        : 18.sp,
                                    fontWeight: controller.weight.value == value
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: controller.weight.value == value
                                        ? const Color(0xff369FFF)
                                        : const Color(0xffC7C7CC),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Unit Picker (Kg/Lb)
                  SizedBox(
                    width: 60.w,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: controller.weightUnit.value == 'Kg'
                            ? 0
                            : 1,
                      ),
                      itemExtent: 50.h,
                      diameterRatio: 1.5,
                      squeeze: 1.2,
                      onSelectedItemChanged: (index) {
                        final newUnit = index == 0 ? 'Kg' : 'Lb';
                        if (controller.weightUnit.value != newUnit) {
                          // Convert weight when switching units
                          if (newUnit == 'Lb') {
                            controller.weight.value =
                                (controller.weight.value * 2.20462).round();
                          } else {
                            controller.weight.value =
                                (controller.weight.value / 2.20462).round();
                          }
                          controller.weightUnit.value = newUnit;
                        }
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: const Color(0xff369FFF),
                              width: 0.5.w,
                            ),
                            bottom: BorderSide(
                              color: const Color(0xff369FFF),
                              width: 0.5.w,
                            ),
                          ),
                        ),
                      ),
                      children: [
                        Center(
                          child: Obx(
                            () => Text(
                              'Kg',
                              style: GoogleFonts.inter(
                                fontSize: controller.weightUnit.value == 'Kg'
                                    ? 20.sp
                                    : 16.sp,
                                fontWeight: controller.weightUnit.value == 'Kg'
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: controller.weightUnit.value == 'Kg'
                                    ? const Color(0xff369FFF)
                                    : const Color(0xffC7C7CC),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Obx(
                            () => Text(
                              'Lb',
                              style: GoogleFonts.inter(
                                fontSize: controller.weightUnit.value == 'Lb'
                                    ? 20.sp
                                    : 16.sp,
                                fontWeight: controller.weightUnit.value == 'Lb'
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: controller.weightUnit.value == 'Lb'
                                    ? const Color(0xff369FFF)
                                    : const Color(0xffC7C7CC),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          _buildNextButton(true),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 4: Activity Level with CupertinoPicker
  Widget _buildActivityStep() {
    final activityOptions = ['Low', 'Moderate', 'High'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "How active are you\nduring day?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 90.h,),
          Center(
            child: SizedBox(
              height: 200.h,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: controller.activityLevel.value.isEmpty
                      ? 1
                      : activityOptions.indexOf(controller.activityLevel.value),
                ),
                itemExtent: 50.h,
                diameterRatio: 1.5,
                squeeze: 1.2,
                onSelectedItemChanged: (index) {
                  controller.selectActivityLevel(activityOptions[index]);
                },
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                      bottom: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                    ),
                  ),
                ),
                children: List.generate(
                  activityOptions.length,
                  (index) => Center(
                    child: Obx(
                      () => Text(
                        activityOptions[index],
                        style: GoogleFonts.inter(
                          fontSize:
                              controller.activityLevel.value ==
                                  activityOptions[index]
                              ? 20.sp
                              : 16.sp,
                          fontWeight:
                              controller.activityLevel.value ==
                                  activityOptions[index]
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color:
                              controller.activityLevel.value ==
                                  activityOptions[index]
                              ? const Color(0xff369FFF)
                              : const Color(0xffC7C7CC),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Obx(
            () => _buildNextButton(controller.activityLevel.value.isNotEmpty),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 5: Climate with CupertinoPicker
  Widget _buildClimateStep() {
    final climateOptions = ['Cold', 'Mild', 'Hot'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "What's the climate/\nweather like in your area?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 90.h,),
          Center(
            child: SizedBox(
              height: 200.h,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: controller.climate.value.isEmpty
                      ? 1
                      : climateOptions.indexOf(controller.climate.value),
                ),
                itemExtent: 50.h,
                diameterRatio: 1.5,
                squeeze: 1.2,
                onSelectedItemChanged: (index) {
                  controller.selectClimate(climateOptions[index]);
                },
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                      bottom: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                    ),
                  ),
                ),
                children: List.generate(
                  climateOptions.length,
                  (index) => Center(
                    child: Obx(
                      () => Text(
                        climateOptions[index],
                        style: GoogleFonts.inter(
                          fontSize:
                              controller.climate.value == climateOptions[index]
                              ? 20.sp
                              : 16.sp,
                          fontWeight:
                              controller.climate.value == climateOptions[index]
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color:
                              controller.climate.value == climateOptions[index]
                              ? const Color(0xff369FFF)
                              : const Color(0xffC7C7CC),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Obx(() => _buildNextButton(controller.climate.value.isNotEmpty)),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 6: Sleep Hours with CupertinoPicker
  Widget _buildSleepStep() {
    final sleepOptions = [
      'Less than 6 hours',
      '6-8 hours',
      'More than 8 hours',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "How much do you\nusually sleep",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 90.h,),
          Center(
            child: SizedBox(
              height: 200.h,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: controller.sleepHours.value.isEmpty
                      ? 1
                      : sleepOptions.indexOf(controller.sleepHours.value),
                ),
                itemExtent: 50.h,
                diameterRatio: 1.5,
                squeeze: 1.2,
                onSelectedItemChanged: (index) {
                  controller.selectSleepHours(sleepOptions[index]);
                },
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                      bottom: BorderSide(
                        color: const Color(0xff369FFF),
                        width: 0.5.w,
                      ),
                    ),
                  ),
                ),
                children: List.generate(
                  sleepOptions.length,
                  (index) => Center(
                    child: Obx(
                      () => Text(
                        sleepOptions[index],
                        style: GoogleFonts.inter(
                          fontSize:
                              controller.sleepHours.value == sleepOptions[index]
                              ? 20.sp
                              : 16.sp,
                          fontWeight:
                              controller.sleepHours.value == sleepOptions[index]
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color:
                              controller.sleepHours.value == sleepOptions[index]
                              ? const Color(0xff369FFF)
                              : const Color(0xffC7C7CC),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Obx(() => _buildNextButton(controller.sleepHours.value.isNotEmpty)),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  // Step 7: Calculating
  Widget _buildCalculatingStep() {
    // Start calculation when entering this step
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.isCalculating.value) {
        controller.calculateHydration().then((_) {
          // Auto-navigate after calculation completes
          Future.delayed(const Duration(milliseconds: 500), () {
            controller.nextStep();
          });
        });
      }
    });

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Generating personalized\nhydration plan for you...',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Please wait...',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffC7C7CC),
            ),
          ),
          SizedBox(height: 60.h),
          Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180.w,
                  height: 180.w,
                  child: CircularProgressIndicator(
                    value: controller.calculationProgress.value,
                    strokeWidth: 17,
                    backgroundColor: const Color(0xffE8E8E8),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xff369FFF),
                    ),
                  ),
                ),
                Text(
                  '${(controller.calculationProgress.value * 100).toInt()}%',
                  style: GoogleFonts.inter(
                    fontSize: 44.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1C1C1E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Step 8: Result
  Widget _buildResultStep() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Based on your\nanswers, we suggest',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1C1C1E),
            ),
          ),
          SizedBox(height: 50.h),
          Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180.w,
                  height: 180.w,
                  child: CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 17,
                    backgroundColor: const Color(0xff369FFF),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xff369FFF),
                    ),
                  ),
                ),
                Text(
                  '${controller.hydrationGoal.value} ml',
                  style: GoogleFonts.inter(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff369FFF),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          SizedBox(
            height: 41.h,
            width: double.infinity,
            child: Button(
              text: 'Set Recommended goal',
              onPressed: () => controller.finishOnboarding(),
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 41.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffE7F3FF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.r),
                ),
              ),
              onPressed: () => Get.toNamed('/owngoal'),
              child: Text(
                'Set own goal',
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff369FFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Next button
  Widget _buildNextButton(bool enabled) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: Button(
        text: 'Next',
        onPressed: enabled ? () => controller.nextStep() : null,
      ),
    );
  }
}
