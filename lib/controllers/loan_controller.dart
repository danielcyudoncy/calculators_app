// controllers/loan_controller.dart
import 'package:calculators_app/models/loan_model.dart';
import 'package:get/get.dart';
import 'dart:math';

class LoanController extends GetxController {
  var loanModel = LoanModel(principal: 50000.0, rate: 5.0, term: 10).obs;

  void calculateEMI() {
    double monthlyRate = loanModel.value.rate / 12 / 100;
    double termInMonths = loanModel.value.term * 12;
    double emi = (loanModel.value.principal * monthlyRate * pow(1 + monthlyRate, termInMonths)) /
        (pow(1 + monthlyRate, termInMonths) - 1);
    double totalAmount = emi * termInMonths;
    double totalInterest = totalAmount - loanModel.value.principal;

    loanModel.update((model) {
      model?.emi = emi;
      model?.totalAmount = totalAmount;
      model?.totalInterest = totalInterest;
    });
  }
}
