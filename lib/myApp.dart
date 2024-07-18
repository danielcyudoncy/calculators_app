// myApp.dart
import 'package:calculators_app/routes/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculators',
      theme: ThemeData(),
      initialRoute: '/',
      getPages: RouteController.to.getPages(),
    );
  }
}
