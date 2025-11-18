import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/App_image/app_image.dart';

// Controller
class WaterController extends GetxController {
  final dailyGoal = 2200.obs;
  final currentWater = 2200.obs; // Start with full bottle
  final selectedDrinkType = 'Water'.obs;
  final drinkAmount = 200.obs;
  final isDrinking = false.obs;

  int get remainingWater => currentWater.value.clamp(0, dailyGoal.value);
  double get percentage => (currentWater.value / dailyGoal.value).clamp(0.0, 1.0);
  bool get isGoalAchieved => currentWater.value <= 0;

  final drinkTypes = [
    {'name': 'Water', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'name': 'Coffee', 'icon': Icons.coffee, 'color': Colors.brown},
    {'name': 'Tea', 'icon': Icons.local_cafe, 'color': Colors.orange},
    {'name': 'Juice', 'icon': Icons.wine_bar, 'color': Colors.amber},
  ];

  Map<String, dynamic> get currentDrink {
    return drinkTypes.firstWhere(
          (drink) => drink['name'] == selectedDrinkType.value,
      orElse: () => drinkTypes[0],
    );
  }

  void selectDrink(String name) {
    selectedDrinkType.value = name;
  }

  Future<void> drinkWater() async {
    if (isDrinking.value) return;

    isDrinking.value = true;

    // Animate drinking - DECREASE water
    final targetWater = (currentWater.value - drinkAmount.value).clamp(0, dailyGoal.value);
    final steps = 20;
    final decrement = (currentWater.value - targetWater) / steps;

    for (int i = 0; i < steps; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      currentWater.value = (currentWater.value - decrement).clamp(0, dailyGoal.value).toInt();
    }

    currentWater.value = targetWater;
    isDrinking.value = false;

    // Show congratulations if goal achieved (bottle empty)
    if (isGoalAchieved) {
      Get.to(() => const CongratulationsScreen(), transition: Transition.fadeIn);
    }
  }

  void reset() {
    currentWater.value = dailyGoal.value; // Reset to full
  }
}

// Home Screen
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WaterController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Today I still need to drink',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 5),
          Obx(() => Text(
            '${controller.remainingWater} ml',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(height: 40),
          Expanded(
            child: Center(
              child: WaterBottleWidget(controller: controller),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Obx(() => ProgressBarWidget(
                  percentage: controller.percentage,
                  current: controller.currentWater.value,
                )),
                const SizedBox(height: 30),
                Obx(() => DrinkButton(
                  isDrinking: controller.isDrinking.value,
                  drinkName: controller.selectedDrinkType.value,
                  onPressed: controller.drinkWater,
                )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Water Bottle Widget
class WaterBottleWidget extends StatelessWidget {
  final WaterController controller;

  const WaterBottleWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final drinkColor = controller.currentDrink['color'] as Color;

      return Stack(
        alignment: Alignment.centerRight,
        children: [
          // Bottle
          Container(
            width: 150,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue.shade300, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Water fill with selected drink color
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 144,
                  height: 344 * controller.percentage,
                  decoration: BoxDecoration(
                    color: drinkColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ],
            ),
          ),
          // Bottle cap
          Positioned(
            top: -15,
            child: Container(
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),


              ),
            ),
          ),
          // Scale markers
          Positioned(
            right: -60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(6, (i) {
                final ml = 1000 - (i * 200);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    children: [
                      Container(width: 25, height: 1, color: Colors.grey.shade400),
                      const SizedBox(width: 8),
                      Text('$ml ml', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      );
    });
  }
}

// Progress Bar Widget
class ProgressBarWidget extends StatelessWidget {
  final double percentage;
  final int current;

  const ProgressBarWidget({Key? key, required this.percentage, required this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$current ml', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Drink Button
class DrinkButton extends StatelessWidget {
  final bool isDrinking;
  final String drinkName;
  final VoidCallback onPressed;

  const DrinkButton({
    Key? key,
    required this.isDrinking,
    required this.drinkName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Row(

        children: [
          SizedBox(width: 75,),
          ElevatedButton(
          onPressed: isDrinking ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade500,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isDrinking ? 'Drinking...' : 'Drink $drinkName',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ],
          ),
              ),
          SizedBox(width: 20.w,),

          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.grey
              )
            ),
            child: IconButton(
              icon: const ImageIcon(AssetImage(Img.juce),color: Colors.blue,),
              onPressed: () => Get.bottomSheet(
                const SwitchDrinkSheet(),
                isScrollControlled: true,
              ),
            ),
          ),
        ],
      );
  }
}

// Switch Drink Bottom Sheet
class SwitchDrinkSheet extends StatelessWidget {
  const SwitchDrinkSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WaterController>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Switch Drink',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.drinkTypes.map((drink) {
              final isSelected = controller.selectedDrinkType.value == drink['name'];
              return GestureDetector(
                onTap: () {
                  controller.selectDrink(drink['name'] as String);
                  Get.back();
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (drink['color'] as Color).withOpacity(0.2)
                            : Colors.grey.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? (drink['color'] as Color) : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        drink['icon'] as IconData,
                        color: drink['color'] as Color,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      drink['name'] as String,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

// Congratulations Screen
class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ...List.generate(30, (i) {
            return Positioned(
              left: (i * 40.0) % Get.width,
              top: (i * 60.0) % (Get.height * 0.7),
              child: Icon(
                Icons.circle,
                size: 10,
                color: [Colors.yellow, Colors.orange, Colors.red, Colors.blue, Colors.purple][i % 5],
              ),
            );
          }),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Trophy with starburst
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.auto_awesome, size: 200, color: Colors.yellow.shade200),
                    Icon(Icons.emoji_events, size: 130, color: Colors.amber.shade600),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.red.shade600,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Congratulations!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Daily Goal Achieved!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text(
                  'You have completed your hydration goal!\nKeep up the great work!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () => _showShareDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500,
                    padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('Share', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    final shareOptions = [
      {'icon': Icons.link, 'label': 'Copy url', 'color': Colors.grey.shade700},
      {'icon': Icons.send, 'label': 'Direct', 'color': Colors.purple},
      {'icon': Icons.telegram, 'label': 'Telegram', 'color': Colors.blue},
      {'icon': Icons.messenger, 'label': 'Messenger', 'color': Colors.blue.shade700},
      {'icon': Icons.facebook, 'label': 'Twitter', 'color': Colors.blue.shade400},
      {'icon': Icons.message, 'label': 'Messages', 'color': Colors.green.shade700},
      {'icon': Icons.more_horiz, 'label': 'More', 'color': Colors.grey.shade700},
    ];

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Share', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: shareOptions.map((opt) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: opt['color'] as Color,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(opt['icon'] as IconData, color: Colors.white, size: 26),
                      ),
                      const SizedBox(height: 6),
                      Text(opt['label'] as String, style: const TextStyle(fontSize: 11)),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}