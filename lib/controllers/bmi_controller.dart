import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  var bmiModel = Rx<BMIModel>(BMIModel());

  void calculateBMI() {
    double height = bmiModel.value.height;
    double weight = bmiModel.value.weight;

    if (height > 0 && weight > 0) {
      double bmi = weight / (height * height);
      bmiModel.update((model) {
        model?.bmi = bmi;
      });
      // Show Snackbar with result
      Get.snackbar(
        'BMI Calculation',
        'Your BMI is ${bmi.toStringAsFixed(2)}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Input Error',
        'Please enter valid height and weight',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class BMIModel {
  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0;
}
