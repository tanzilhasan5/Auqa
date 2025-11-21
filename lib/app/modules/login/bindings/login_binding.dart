import 'package:get/get.dart';

import 'package:aqua/app/modules/login/controllers/checkbox_controller_controller.dart';

import '../controllers/hiddenpass_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckboxController>(
      () => CheckboxController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<PassController>(
      () => PassController(),
    );
  }
}
