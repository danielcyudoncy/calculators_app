// models/loan_model.dart
class LoanModel {
  double principal;
  double rate;
  int term;
  double emi;
  double totalInterest;
  double totalAmount;

  LoanModel({
    required this.principal,
    required this.rate,
    required this.term,
    this.emi = 0.0,
    this.totalInterest = 0.0,
    this.totalAmount = 0.0,
  });
}
