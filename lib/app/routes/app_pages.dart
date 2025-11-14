import 'package:get/get.dart';

import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_bottom_nav_bar/bindings/main_bottom_nav_bar_binding.dart';
import '../modules/main_bottom_nav_bar/views/main_bottom_nav_bar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_BOTTOM_NAV_BAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),

    GetPage(
      name: _Paths.MAIN_BOTTOM_NAV_BAR,
      page: () => const MainBottomNavBarView(),
      binding: MainBottomNavBarBinding(),
    ),
  ];
}
