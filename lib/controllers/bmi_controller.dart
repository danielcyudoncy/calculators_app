// controllers/bmi_controller.dart

import 'package:calculators_app/models/bmi_model.dart';
import 'package:get/get.dart';

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
