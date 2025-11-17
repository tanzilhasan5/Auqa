import 'package:get/get.dart';

import '../../Achievements/controllers/achievements_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../controllers/main_bottom_nav_bar_controller.dart';

class MainBottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavBarController>(
      () => MainBottomNavBarController(),
    );
    Get.lazyPut<HistoryController>(
          () => HistoryController(),
    );
    Get.lazyPut<AchievementsController>(
          () => AchievementsController(),
    );
  }
}
