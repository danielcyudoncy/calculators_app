
import 'package:calculators_app/controllers/income_tax_controller.dart';
import 'package:calculators_app/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeTaxScreen extends StatelessWidget {
  final IncomeTaxController incomeTaxController = Get.put(IncomeTaxController());

  IncomeTaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/icon.png', height: 50), 
            const SizedBox(width: 10),
            const Text(
              'Tax Income Calculator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,),
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
              style: ElevatedButton.styleFrom(
                    elevation: 0, 
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    backgroundColor: const Color.fromARGB(170, 56, 197, 192), 
                  ),
              onPressed: incomeTaxController.calculateTax,
              child: const Text('Calculate Tax',
              style: TextStyle(fontSize: AppSizes.fontSizeMd, color: Colors.white),),
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
