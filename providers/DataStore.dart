import 'package:flutter/cupertino.dart';
import 'dart:math';

import '../constants.dart';

enum Gender { male, female }
enum ChangeParameter { weight, age }

class DataStore extends ChangeNotifier {
  int weight = 75;
  int age = 20;
  double height = 150;
  double bmi = 0.0;
  Color activeCardColor = Color(0xFF1E1D33);
  Color inActiveCardColor = Color(0xFF111328);

  Color maleCardColor = Color(0xFF111328);
  Color femaleCardColor = Color(0xFF111328);

  void toggleColor(tapped_gender) {
    if (tapped_gender == Gender.male) {
      femaleCardColor = inActiveCardColor;

      maleCardColor = maleCardColor == inActiveCardColor
          ? activeCardColor
          : inActiveCardColor;
    }

    if (tapped_gender == Gender.female) {
      maleCardColor = inActiveCardColor;

      femaleCardColor = femaleCardColor == inActiveCardColor
          ? activeCardColor
          : inActiveCardColor;
    }

    notifyListeners();
  }

  void increseValue(ChangeParameter parameter) {
    parameter == ChangeParameter.weight ? weight += 1 : age += 1;
    notifyListeners();
  }

  void decreseValue(ChangeParameter parameter) {
    parameter == ChangeParameter.weight ? weight -= 1 : age -= 1;
    notifyListeners();
  }

  void changeSlider(double value) {
    height = value;
    notifyListeners();
  }

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  Widget getResult() {
    if (bmi >= 25) {
      return Text(
        "Overweighted!",
        style: kResultRedText,
      );
    } else if (bmi >= 18.5) {
      return Text(
        "Normal",
        style: kResultGreenText,
      );
    } else {
      return Text(
        "Underweight!",
        style: kResultRedText,
      );
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "You have a higher than normal body weight!";
    } else if (bmi >= 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have a lower than normal body weight!";
    }
  }
}
