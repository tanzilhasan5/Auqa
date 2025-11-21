import 'package:get/get.dart';

class SignupstepsController extends GetxController {
  // Current step
  final currentStep = 0.obs;
  final totalSteps = 8;

  // User data
  final selectedGender = ''.obs;
  final age = 32.obs;
  final weight = 62.obs;
  final weightUnit = 'Kg'.obs; // Kg or Lb
  final activityLevel = ''.obs;
  final climate = ''.obs;
  final sleepHours = ''.obs;

  // Calculated hydration goal
  final hydrationGoal = 0.obs;
  final calculationProgress = 0.0.obs;
  final isCalculating = false.obs;

  // Progress for current step
  double get progress => (currentStep.value + 1) / totalSteps;

  @override
  void onInit() {
    super.onInit();
  }

  // Navigation methods
  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  // Gender selection
  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  // Age selection
  void updateAge(int value) {
    age.value = value;
  }

  // Weight selection
  void updateWeight(int value) {
    weight.value = value;
  }

  // Weight unit selection
  void updateWeightUnit(String unit) {
    if (weightUnit.value != unit) {
      // Convert weight when unit changes
      if (unit == 'Lb') {
        // Convert kg to lb (1 kg = 2.20462 lb)
        weight.value = (weight.value * 2.20462).round();
      } else {
        // Convert lb to kg
        weight.value = (weight.value / 2.20462).round();
      }
      weightUnit.value = unit;
    }
  }

  // Activity level selection
  void selectActivityLevel(String level) {
    activityLevel.value = level;
  }

  // Climate selection
  void selectClimate(String climateType) {
    climate.value = climateType;
  }

  // Sleep hours selection
  void selectSleepHours(String hours) {
    sleepHours.value = hours;
  }

  // Calculate hydration goal with animation
  Future<void> calculateHydration() async {
    isCalculating.value = true;
    calculationProgress.value = 0.0;

    // Animate progress from 0 to 100
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      calculationProgress.value = i / 100;
    }

    // Convert weight to kg if in pounds
    int weightInKg = weight.value;
    if (weightUnit.value == 'Lb') {
      weightInKg = (weight.value / 2.20462).round();
    }

    // Basic calculation: weight * 30-35 ml
    // Add factors for activity, climate, sleep
    int baseHydration = weightInKg * 33;

    // Activity level multiplier
    double activityMultiplier = 1.0;
    if (activityLevel.value == 'Moderate') activityMultiplier = 1.15;
    if (activityLevel.value == 'High') activityMultiplier = 1.3;

    // Climate multiplier
    double climateMultiplier = 1.0;
    if (climate.value == 'Mild') climateMultiplier = 1.05;
    if (climate.value == 'Hot') climateMultiplier = 1.2;

    // Sleep multiplier (less sleep = more hydration needed)
    double sleepMultiplier = 1.0;
    if (sleepHours.value == 'Less than 6 hours') sleepMultiplier = 1.1;
    if (sleepHours.value == 'More than 8 hours') sleepMultiplier = 0.95;

    hydrationGoal.value = (baseHydration *
        activityMultiplier *
        climateMultiplier *
        sleepMultiplier)
        .round();

    isCalculating.value = false;
  }

  // Finish onboarding
  void finishOnboarding() {
    // Navigate to main app or save preferences
   Get.offAllNamed('/home',parameters: {'passMlLavel': '2500'});
  }
}