import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxBool isChecked = false.obs;
  RxBool showError = false.obs;
  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }
}
