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

  void focusTeller() {
    focus = false;
  }
}
