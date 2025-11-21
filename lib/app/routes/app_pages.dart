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
import '../modules/forgot/bindings/forgot_binding.dart';
import '../modules/forgot/views/backto_login.dart';
import '../modules/forgot/views/forgot_view.dart';
import '../modules/forgot/views/otpverification_screen.dart';
import '../modules/forgot/views/resetpass_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/switchdrink.dart';
import '../modules/main_bottom_nav_bar/bindings/main_bottom_nav_bar_binding.dart';
import '../modules/main_bottom_nav_bar/views/main_bottom_nav_bar_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/auth_screen.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signupsteps/bindings/signupsteps_binding.dart';
import '../modules/signupsteps/views/allset.dart';
import '../modules/signupsteps/views/owngoal.dart';
import '../modules/signupsteps/views/signupsteps_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: _Paths.AUTHSCREEN, page: () => const AuthScreen()),
    GetPage(
      name: _Paths.FORGOT,
      page: () => const ForgotView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => const OtpverificationScreen(),
      binding: ForgotBinding(),
    ),
    GetPage(name: _Paths.RESETPASS, page: () => const ResetpassView()),
    GetPage(name: _Paths.BACKLOGIN, page: () => const BacktoLogin()),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPSTEPS,
      page: () => const SignupstepsView(),
      binding: SignupstepsBinding(),
    ),
    GetPage(name: _Paths.OWNGOAL, page: () => const OwnGoal()),
    GetPage(name: _Paths.ALLSET, page: () => const AllSet()),
    GetPage(name: _Paths.SWITCHDRINK, page: () => const SwitchDrink()),

  ];
}
