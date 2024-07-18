// controllers/route_controller.dart
import 'package:get/get.dart';
import 'package:calculators_app/screens/home_screen.dart';
import 'package:calculators_app/screens/bmi_screen.dart';
import 'package:calculators_app/screens/emi_screen.dart';
// Import other calculator screens.

class RouteController extends GetxController {
  static RouteController get to => Get.find();

  List<GetPage> getPages() {
    return [
      GetPage(name: '/', page: () => const HomeScreen()),
      GetPage(name: '/bmi', page: () => BMIScreen()),
      GetPage(name: '/emi', page: () => EMIScreen()),
      // Add other calculator screens.
    ];
  }
}
