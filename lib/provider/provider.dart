import 'package:flutter/material.dart';

class UnitChangerProvider extends ChangeNotifier {
  bool isOneBox = true;
  bool focus = false;
  String mainHeightUnit = 'Cm';
  String mainWeightUnit = 'Kg';

  void changeHeightUnit(String newHeightUnit) {
    mainHeightUnit = newHeightUnit;
    if (newHeightUnit == 'Cm') {
      isOneBox = true;
    } else {
      isOneBox = false;
    }

    notifyListeners();
  }

  void changeWeighttUnit(String newWeightUnit) {
    mainWeightUnit = newWeightUnit;

    notifyListeners();
  }
}

class ResultProvider extends ChangeNotifier {
  Color bmiColor = Colors.deepPurple.shade50;
  double height = 0; //height in meter
  double weight = 0; //weight in kg
  String bmi = '';
  String resultBmi = ' ';

  void heightUpdater(double newheight) {
    height = newheight;

    notifyListeners();
  }

  void weightUpdater(double newWeight) {
    weight = newWeight;

    notifyListeners();
  }

//BMI = weight(in kg) / (height(in m))^2
  void formula() {
    if (height != 0 && weight != 0) {
      bmi = (weight / (height * height)).toStringAsFixed(1);
      bmiColorChanger();
    }
    if (height != 0 && weight != 0) {
      resultBmi = 'BMI = $bmi';
    } else {
      resultBmi = '';
      bmiColor = Colors.deepPurple.shade50;
    }

    notifyListeners();

    height = 0;
    weight = 0;
  }

  void bmiColorChanger() {
    if (18.5 <= (double.parse(bmi)) && (double.parse(bmi)) <= 25) {
      bmiColor = Colors.green;
    } else if (0 <= (double.parse(bmi)) && (double.parse(bmi)) <= 16) {
      bmiColor = Colors.red;
    } else if (16 < (double.parse(bmi)) && (double.parse(bmi)) <= 17) {
      bmiColor = Colors.red.shade300;
    } else if (17 < (double.parse(bmi)) && (double.parse(bmi)) < 18.5) {
      bmiColor = Colors.yellow;
    } else if (25 < (double.parse(bmi)) && (double.parse(bmi)) <= 30) {
      bmiColor = Colors.yellow;
    } else if (30 < (double.parse(bmi)) && (double.parse(bmi)) <= 35) {
      bmiColor = Colors.red.shade400;
    } else if (35 < (double.parse(bmi))) {
      bmiColor = Colors.red;
    }
  }
}

class BoxAnimatorProvider extends ChangeNotifier {
  bool isButtonClicked = false;

  void buttonTrueMaker() {
    isButtonClicked = true;

    notifyListeners();
  }

  void buttonFalseMaker() {
    isButtonClicked = false;

    notifyListeners();
  }
}
