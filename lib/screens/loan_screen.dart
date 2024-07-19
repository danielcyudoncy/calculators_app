import 'package:calculators_app/controllers/loan_controller.dart';
import 'package:calculators_app/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanScreen extends StatelessWidget {
  final LoanController loanController = Get.put(LoanController());

  LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/icon.png', height: 50), 
            const SizedBox(width: 10),
            const Text(
              'Calculator App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(alignment: Alignment.topLeft,
              child: Text('Loan Calculator', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)),
              const SizedBox(height: 30,),
             Row(
              children: [
                const Text(
                  'Loan Amount',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMd, 
                    fontWeight: FontWeight.w700,
                    
                  ),
                ),
                const SizedBox(width: 135,),
                 Obx(() => Text(
                  loanController.loanModel.value.principal.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: AppSizes.fontSizeMd,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
              
            ),
           
            const SizedBox(height: 20),
            Obx(() => Slider(
              thumbColor: Colors.white,
              activeColor: const Color.fromARGB(170, 56, 197, 192),
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
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 100),
                Obx(() => Text(
                  '${loanController.loanModel.value.rate.toStringAsFixed(2)}%',
                  style: const TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.bold),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => Slider(
              thumbColor: Colors.white,
              activeColor: const Color.fromARGB(170, 56, 197, 192),
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
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 160),
                Obx(() => Text(
                  loanController.loanModel.value.term.toString(),
                  style: const TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.bold),
                )),
              ],
            ),
            Obx(() => Slider(
              thumbColor: Colors.white,
              activeColor: const Color.fromARGB(170, 56, 197, 192),
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
              onPressed: () {
                loanController.calculateEMI();
                Get.snackbar(
                  'EMI Calculation',
                  'Monthly EMI: ${loanController.loanModel.value.emi.toStringAsFixed(2)}\n'
                  'Total Interest: ${loanController.loanModel.value.totalInterest.toStringAsFixed(2)}\n'
                  'Total Amount: ${loanController.loanModel.value.totalAmount.toStringAsFixed(2)}',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.black87,
                  colorText: Colors.white,
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0, 
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                backgroundColor: const Color.fromARGB(170, 56, 197, 192), 
              ),
              child: const Text(
                'Calculate EMI',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly EMI: ${loanController.loanModel.value.emi.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  'Total Interest: ${loanController.loanModel.value.totalInterest.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  'Total Amount: ${loanController.loanModel.value.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                                     
                  style: ElevatedButton.styleFrom(
                    elevation: 0, 
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    backgroundColor: const Color.fromARGB(170, 56, 197, 192), 
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.share, color: Colors.white,),
                      SizedBox(width: 8,),
                      Text(
                        'Share',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0, 
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    backgroundColor: const Color.fromARGB(170, 56, 197, 192), 
                  ),
                  child: const Text(
                    'Save as PDF',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
