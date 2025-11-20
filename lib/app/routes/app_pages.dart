import 'package:aqua/app/modules/Achievements/views/%20weeklyLegend/weekly_Legend.dart';
import 'package:aqua/app/modules/Achievements/views/Hero/hero.dart';
import 'package:aqua/app/modules/Achievements/views/Immortal/immortal.dart';
import 'package:aqua/app/modules/Achievements/views/PerfectMonth/perfectMonth.dart';
import 'package:aqua/app/modules/Achievements/views/WeekWarrior/weekWarrior.dart';
import 'package:aqua/app/modules/Achievements/views/aquaSovereign/aquaSovereign.dart';
import 'package:aqua/app/modules/Achievements/views/earlyBirdElite/earlyBirdElite.dart';
import 'package:aqua/app/modules/account/views/Reminders/reminders.dart';
import 'package:get/get.dart';

import '../modules/Achievements/bindings/achievements_binding.dart';
import '../modules/Achievements/views/achievements_view.dart';
import '../modules/Achievements/views/coolRefresher/cool_refresher.dart';
import '../modules/Achievements/views/frist_vectory/frist_vectory.dart';
import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/DailyGoal/daily_Goal.dart';
import '../modules/account/views/DailyGoal/edit_gole.dart';
import '../modules/account/views/PersonalInfo/personal_info.dart';
import '../modules/account/views/Privacy_Policy/privacy_Policy.dart';
import '../modules/account/views/Subscription/subscription.dart';
import '../modules/account/views/account_view.dart';
import '../modules/dashbord/bindings/dashbord_binding.dart';
import '../modules/dashbord/views/dashbord_view.dart';
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
    GetPage(
      name: _Paths.DASHBORD,
      page: () =>  DashbordView(),
      binding: DashbordBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.PERSONALINFO,
      page: () => const PersonalInfo(),
    ),
    GetPage(
      name: _Paths.DAILYGOAl,
      page: () => const DailyGoal(),
    ),
    GetPage(
      name: _Paths.EDITGOAl,
      page: () => const EditGoal(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => const PrivacyPolicy(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => const Subscription(),
    ),
    /* GetPage(
      name: _Paths.SELECTIONSHEET,
      page: () => const Selection(),
    ),*/
    GetPage(
      name: _Paths.ACHIEVEMENTS,
      page: () => const AchievementsView(),
      binding: AchievementsBinding(),
    ),
    GetPage(
      name: _Paths.frist_vectory,
      page: () =>  FristVectory(),

    ),
    GetPage(
      name: _Paths.Hero,
      page: () =>  Hero(),

    ),
    GetPage(
      name: _Paths.AquaSovereign,
      page: () =>  AquaSovereign(),

    ),
    GetPage(
      name: _Paths.Immortal,
      page: () =>  Immortal(),

    ),
    GetPage(
      name: _Paths.WeekWarrior,
      page: () =>  WeekWarrior(),

    ),
    GetPage(
      name: _Paths.CoolRefresher,
      page: () =>  CoolRefresher(),

    ),
    GetPage(
      name: _Paths.WeeklyLegend,
      page: () =>  WeeklyLegend(),

    ),
    GetPage(
      name: _Paths.PerfectMonth,
      page: () =>  PerfectMonth(),

    ),
    GetPage(
      name: _Paths.EarlyBirdElite,
      page: () =>  EarlyBirdElite(),

    ),
    GetPage(
      name: _Paths.Reminders,
      page: () =>  Reminders(),

    ),

  ];
}
