// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40), // Example logo
            const SizedBox(width: 10),
            const Text(
              'Calculator App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Space between the title and the grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: const [
                  CalculatorCard(title: 'BMI Calculator', route: '/bmi'),
                  CalculatorCard(title: 'EMI Calculator', route: '/emi'),
                  CalculatorCard(title: 'Loan Calculator', route: '/loan'),
                  CalculatorCard(title: 'Income Tax Calculator', route: '/income_tax'),
                  // Add other calculator cards here.
                ],
              ),
            ),
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
