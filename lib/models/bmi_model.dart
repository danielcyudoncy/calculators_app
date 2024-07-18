// models/bmi_model.dart
class BMIModel {
  double height;
  double weight;
  double bmi;

  BMIModel({
    required this.height, 
    required this.weight, this.bmi = 0.0});
}
