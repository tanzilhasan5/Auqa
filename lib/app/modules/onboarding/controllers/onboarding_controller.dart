import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingData> pages = [
    OnboardingData(
      imagePath: 'assets/images/image1.svg',
      title: 'Balance Your Day with\nThe Right Hydration.',
      description: 'Achieve your hydration goals with a simple\ntap!',
    ),
    OnboardingData(
      imagePath: 'assets/images/image2.svg',
      title: 'Smart Reminders\nTailored to You',
      description: 'Smart, simple hydration tracking for every\nday.',
    ),
    OnboardingData(
      imagePath: 'assets/images/image3.svg',
      title: 'Achieve Your Hydration\nGoals with AquaPal Now',
      description:
          'Unlock premium features, and make\nhydration a lifelong habit.',
    ),
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to home or login
      Get.offAllNamed('/authscreen');
    }
  }

  void skipOnboarding() {
    Get.offAllNamed('/authscreen');
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

// Onboarding Data Model
class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
