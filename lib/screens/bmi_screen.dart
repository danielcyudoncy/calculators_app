import 'package:calculators_app/controllers/bmi_controller.dart';
import 'package:calculators_app/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIScreen extends StatelessWidget {
  final BMIController bmiController = Get.put(BMIController());

  BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/icon.png', height: 50), 
            const SizedBox(width: 10),
            const Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Height (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) => bmiController.bmiModel.value.height = double.parse(value),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) => bmiController.bmiModel.value.weight = double.parse(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                backgroundColor: const Color.fromARGB(170, 56, 197, 192), // Button color
              ),
              onPressed: bmiController.calculateBMI,
              child: const Text(
                'Calculate BMI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontSizeMd, color: Colors.white),
              ),
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
