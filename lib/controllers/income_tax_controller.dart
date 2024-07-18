// controllers/income_tax_controller.dart
import 'package:calculators_app/models/income_tax_model.dart';
import 'package:get/get.dart';

class IncomeTaxController extends GetxController {
  var incomeTaxModel = IncomeTaxModel(annualIncome: 0.0, taxRate: 0.0).obs;

  void calculateTax() {
    double tax = incomeTaxModel.value.annualIncome * incomeTaxModel.value.taxRate / 100;
    incomeTaxModel.update((model) {
      model?.tax = tax;
    });
  }
}
