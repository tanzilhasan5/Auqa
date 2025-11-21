import 'package:get/get.dart';

import '../controllers/signupsteps_controller.dart';

class SignupstepsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupstepsController>(() => SignupstepsController());
  }
}