import 'package:get/get.dart';

class PinController extends GetxController {
  /// Stores the OTP input from the user
  final RxString pin = ''.obs;

  /// Update PIN value
  void updatePin(String value) {
    pin.value = value;
  }

  /// Check if OTP length is valid (4 digits)
  bool isPinLengthValid() {
    return pin.value.length == 4;
  }

  /// Optional: Clear OTP
  void clearPin() {
    pin.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize with empty pin
    clearPin();
  }

  @override
  void onClose() {
    // Clean up when controller is disposed
    clearPin();
    super.onClose();
  }
}