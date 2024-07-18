

import 'package:get/get.dart';

import '../models/bmi_model.dart';

class BMIController extends GetxController {
  var bmiModel = BMIModel(height: 0.0, weight: 0.0).obs;

  void calculateBMI() {
    double heightInMeters = bmiModel.value.height / 100;
    double bmi = bmiModel.value.weight / (heightInMeters * heightInMeters);
    bmiModel.update((model) {
      model?.bmi = bmi;
    });
  }
}
