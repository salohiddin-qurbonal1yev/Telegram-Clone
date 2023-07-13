import 'package:flutter/material.dart';

class ShowTranslateSwitchButtonProvider extends ChangeNotifier {
  // Variables
  bool change = false;
  bool change2 = false;

  // Change swicth function 1
  changeSwitch() {
    if (change) {
      change = !change;
      notifyListeners();
    } else {
      change = !change;
      notifyListeners();
    }
  }

  // Change swicth function 2
  changeSwitch2() {
    if (change2) {
      change2 = !change2;
      notifyListeners();
    } else {
      change2 = !change2;
      notifyListeners();
    }
  }
}
