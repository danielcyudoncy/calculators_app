// screens/emi_screen.dart
import 'package:calculator_application/controllers/emi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EMIScreen extends StatelessWidget {
  final EMIController emiController = Get.put(EMIController());

  EMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Principal'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  emiController.emiModel.value.principal = double.parse(value),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Rate of Interest'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  emiController.emiModel.value.rate = double.parse(value),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Term (months)'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  emiController.emiModel.value.term = int.parse(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: emiController.calculateEMI,
              child: const Text('Calculate EMI'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'EMI: ${emiController.emiModel.value.emi.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
