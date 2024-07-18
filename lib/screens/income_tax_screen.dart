// screens/income_tax_screen.dart
import 'package:calculators_app/controllers/income_tax_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeTaxScreen extends StatelessWidget {
  final IncomeTaxController incomeTaxController = Get.put(IncomeTaxController());

  IncomeTaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Income Tax Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Annual Income'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  incomeTaxController.incomeTaxModel.value.annualIncome = double.parse(value),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Tax Rate (%)'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  incomeTaxController.incomeTaxModel.value.taxRate = double.parse(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: incomeTaxController.calculateTax,
              child: const Text('Calculate Tax'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Tax: ${incomeTaxController.incomeTaxModel.value.tax.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
