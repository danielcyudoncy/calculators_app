// controllers/route_controller.dart
import 'package:calculators_app/screens/splash_screen.dart';
import 'package:calculators_app/screens/home_screen.dart';
import 'package:calculators_app/screens/bmi_screen.dart';
import 'package:calculators_app/screens/emi_screen.dart';
import 'package:calculators_app/screens/loan_screen.dart';
import 'package:calculators_app/screens/income_tax_screen.dart';
import 'package:get/get.dart';

class RouteController extends GetxController {
  static RouteController get to => Get.find();

  List<GetPage> getPages() {
    return [
      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/home', page: () => const HomeScreen()),
      GetPage(name: '/bmi', page: () => BMIScreen()),
      GetPage(name: '/emi', page: () => EMIScreen()),
      GetPage(name: '/loan', page: () => LoanScreen()),
      GetPage(name: '/income_tax', page: () => IncomeTaxScreen()),
      // Add other calculator screens.
    ];
  }
}
