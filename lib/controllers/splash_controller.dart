// controllers/splash_controller.dart
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offNamed('/home');
  }
}
