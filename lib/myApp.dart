import 'package:calculators_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculators',
      theme: ThemeData(),
      home: const Homepage(),
    );
  }
}