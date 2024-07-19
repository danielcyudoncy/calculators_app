
import 'package:calculators_app/controllers/emi_controller.dart';
import 'package:calculators_app/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EMIScreen extends StatelessWidget {
  final EMIController emiController = Get.put(EMIController());

  EMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/icon.png', height: 50), 
            const SizedBox(width: 10),
            const Text(
              'EMI Calculator',
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
              style: ElevatedButton.styleFrom(
                    elevation: 0, 
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    backgroundColor: const Color.fromARGB(170, 56, 197, 192), 
                  ),
              onPressed: emiController.calculateEMI,
              child: const Text('Calculate EMI',
              style: TextStyle(fontSize: AppSizes.fontSizeMd, color: Colors.white),),
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
