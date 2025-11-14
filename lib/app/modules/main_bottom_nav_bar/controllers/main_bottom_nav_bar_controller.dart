import 'package:aqua/app/modules/history/views/history_view.dart';
import 'package:aqua/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainBottomNavBarController extends GetxController {
  int selectedIndex = 2;

  @override
  void onInit() {
    super.onInit();
    // Initialize with home page
    selectedIndex = 2;
  }

  Widget get currentPage {
    switch (selectedIndex) {
      case 0:
        return const HistoryView();
      case 1:
        return const HistoryView();
      case 2:
        return const HistoryView();
      case 3:
        return const HistoryView();
      default:
        return const HistoryView();
    }
  }

  void changePage(int index) {
    selectedIndex = index;
    update(); // This triggers GetBuilder to rebuild
  }
}
