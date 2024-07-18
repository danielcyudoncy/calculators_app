// screens/bmi_screen.dart

import 'package:calculators_app/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIScreen extends StatelessWidget {
  final BMIController bmiController = Get.put(BMIController());

  BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Height (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  bmiController.bmiModel.value.height = double.parse(value),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  bmiController.bmiModel.value.weight = double.parse(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: bmiController.calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'BMI: ${bmiController.bmiModel.value.bmi.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
