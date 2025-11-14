import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_bottom_nav_bar_controller.dart';

class MainBottomNavBarView extends GetView<MainBottomNavBarController> {
  const MainBottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) => AnimatedSwitcher(
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          child: controller.currentPage,
        ),
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) => FluidNavBar(

          defaultIndex: controller.selectedIndex,
          animationFactor: 0.5,
          icons:  [
            FluidNavBarIcon(icon: Icons.history),
            FluidNavBarIcon(icon: Icons.analytics_outlined),
            FluidNavBarIcon(icon: Icons.home_outlined),
            FluidNavBarIcon(icon: Icons.currency_franc),
            FluidNavBarIcon(icon: Icons.person_outline),
          ],
          onChange: (index) => controller.changePage(index),
          style: const FluidNavBarStyle(
            barBackgroundColor: Color(0xFF369FFF),
            iconBackgroundColor: Color(0xFF369FFF),
            iconSelectedForegroundColor: Colors.white,
            iconUnselectedForegroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}