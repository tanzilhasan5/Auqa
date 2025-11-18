import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/App_image/app_image.dart';
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
          duration: const Duration(milliseconds: 200),
          child: controller.currentPage,
        ),
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) => FluidNavBar(


          defaultIndex: controller.selectedIndex,
          animationFactor: 0.5,
          icons:  [
            FluidNavBarIcon(svgPath: svgImage.history),
            FluidNavBarIcon(svgPath: svgImage.analytics),
            FluidNavBarIcon(svgPath: svgImage.home),
            FluidNavBarIcon(svgPath: svgImage.achievements),
            FluidNavBarIcon(svgPath: svgImage.person),
          ],
          onChange: (index) => controller.changePage(index),
          style:  FluidNavBarStyle(

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