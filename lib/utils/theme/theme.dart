
import 'package:calculators_app/utils/constant/colors.dart';
import 'package:calculators_app/utils/theme/custorm_theme/texttheme.dart';
import 'package:flutter/material.dart';


class QuizzTaleTheme {
  QuizzTaleTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white10,
      textTheme: CalculatorTextTheme.lightTexttheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CalculatorTextTheme.darkTexttheme);
}
