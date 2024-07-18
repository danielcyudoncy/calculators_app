// screens/loan_screen.dart
import 'package:calculators_app/controllers/loan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanScreen extends StatelessWidget {
  final LoanController loanController = Get.put(LoanController());

  LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loan Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Loan Amount',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Obx(() => Text(
                  loanController.loanModel.value.principal.toStringAsFixed(2),
                  style:  TextStyle(
                    backgroundColor: Colors.blue[100],
                    fontSize: 24, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 20),
            Obx(() => Slider(activeColor: Colors.blueAccent,
              value: loanController.loanModel.value.principal,
              min: 10000,
              max: 1000000,
              divisions: 100,
              label: loanController.loanModel.value.principal.toStringAsFixed(2),
              onChanged: (value) {
                loanController.loanModel.update((model) {
                  model?.principal = value;
                });
              },
            )),
            const SizedBox(height: 60),
            Row(
              children: [
                const Text(
                  'Rate of Interest (p.a)',
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 100,),
                Obx(() => Text(
                  '${loanController.loanModel.value.rate.toStringAsFixed(2)}%',
                  style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
                )),
              ],
            ),
            const SizedBox(height: 20),
            
            Obx(() => Slider(activeColor: Colors.blueAccent,
              value: loanController.loanModel.value.rate,
              min: 1,
              max: 20,
              divisions: 100,
              label: loanController.loanModel.value.rate.toStringAsFixed(2),
              onChanged: (value) {
                loanController.loanModel.update((model) {
                  model?.rate = value;
                });
              },
            )),
            const SizedBox(height: 60),
             Row(
              children: [
                const Text(
                  'Loan Tenure (yrs)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 130,),
                Obx(() => Text(
                  loanController.loanModel.value.term.toString(),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ))
              ],
            ),
             Obx(() => Slider(activeColor: Colors.blueAccent,
              value: loanController.loanModel.value.term.toDouble(),
              min: 1,
              max: 30,
              divisions: 30,
              label: loanController.loanModel.value.term.toString(),
              onChanged: (value) {
                loanController.loanModel.update((model) {
                  model?.term = value.toInt();
                });
              },
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loanController.calculateEMI,
              child: const Text('Calculate EMI'),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monthly EMI:               ${loanController.loanModel.value.emi.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Total Interest:             ${loanController.loanModel.value.totalInterest.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Total Amount:             ${loanController.loanModel.value.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement share functionality
                  },
                  child: const Text('Share'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement save as PDF functionality
                  },
                  child: const Text('Save as PDF'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
