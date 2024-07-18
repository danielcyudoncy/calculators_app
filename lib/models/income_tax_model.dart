// models/income_tax_model.dart
class IncomeTaxModel {
  double annualIncome;
  double taxRate;
  double tax;

  IncomeTaxModel({
    required this.annualIncome,
    required this.taxRate,
    this.tax = 0.0,
  });
}
