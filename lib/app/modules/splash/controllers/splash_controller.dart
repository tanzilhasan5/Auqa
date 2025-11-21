import 'package:aqua/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    jumpToNextPage();
    super.onInit();
  }
  jumpToNextPage() {
    Future.delayed(
      Duration(seconds: 3),() => Get.offAllNamed(Routes.ONBOARDING),
    );
  }
}
