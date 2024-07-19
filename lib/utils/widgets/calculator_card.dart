// widgets/calculator_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorCard extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;

  const CalculatorCard({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 0,
      color: const Color.fromARGB(255, 234, 255, 255), 
      child: InkWell(
        onTap: () {
          Get.toNamed(route);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black, size: 40), 
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 16), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
