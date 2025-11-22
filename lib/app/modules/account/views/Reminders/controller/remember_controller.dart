/*
// features/reminders/controller/reminders_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';
import '../widgets/Add_Reminder_BottomSheet/add_Reminder_BottomSheet.dart';

class RemindersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Tab Controller
  late TabController tabController;

  // Reactive state
  final RxList<ReminderModel> reminders = <ReminderModel>[
    ReminderModel(time: '06:30 AM', days: ['Fri'], isActive: true),
  ].obs;

  final RxInt currentTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      currentTabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // === Controller Methods (Business Logic) ===
  void toggleReminder(int index, bool value) {
    reminders[index].isActive = value;
    reminders.refresh(); // Trigger rebuild
  }

  void deleteReminder(int index) {
    reminders.removeAt(index);
    Get.snackbar("Deleted", "Reminder removed", backgroundColor: Colors.red, colorText: Colors.white);
  }

  void showAddReminderBottomSheet() {
    Get.bottomSheet(AddReminderBottomSheet(), isScrollControlled: true);
  }
}*/
