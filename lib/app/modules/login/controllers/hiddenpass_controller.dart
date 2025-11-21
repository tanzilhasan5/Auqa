import 'package:get/get.dart';

class PassController extends GetxController {
  /// For password field
  RxBool isPasswordHidden = true.obs;

  /// For confirm password field
  RxBool isConfirmPasswordHidden = true.obs;

  /// Store password & confirm password reactive values
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}
