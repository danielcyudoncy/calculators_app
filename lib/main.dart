
import 'package:calculators_app/routes/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calculators_app/myApp.dart';

void main() {
  Get.put(RouteController());
  runApp(const MyApp());
}
