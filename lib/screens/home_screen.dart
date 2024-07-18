// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator App')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: const [
            CalculatorCard(title: 'BMI Calculator', route: '/bmi'),
            CalculatorCard(title: 'EMI Calculator', route: '/emi'),
            // Add other calculator cards.
          ],
        ),
      ),
    );
  }
}

class CalculatorCard extends StatelessWidget {
  final String title;
  final String route;

  const CalculatorCard({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(route);
        },
        child: Center(child: Text(title)),
      ),
    );
  }
}
