// models/emi_model.dart
class EMIModel {
  double principal;
  double rate;
  int term;
  double emi;

  EMIModel(
      {required this.principal,
      required this.rate,
      required this.term,
      this.emi = 0.0});
}
