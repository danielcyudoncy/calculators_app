

import 'dart:math';

import 'package:get/get.dart';

import '../models/emi_model.dart';

class EMIController extends GetxController {
  var emiModel = EMIModel(principal: 0.0, rate: 0.0, term: 0).obs;

  void calculateEMI() {
    double monthlyRate = emiModel.value.rate / 12 / 100;
    double term = emiModel.value.term.toDouble();
    double emi =
        (emiModel.value.principal * monthlyRate * pow(1 + monthlyRate, term)) /
            (pow(1 + monthlyRate, term) - 1);
    emiModel.update((model) {
      model?.emi = emi;
    });
  }
}
