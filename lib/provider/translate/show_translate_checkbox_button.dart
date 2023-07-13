import 'package:flutter/material.dart';

class ShowTranslateCheckBoxButtonProvider extends ChangeNotifier {
  // Variable
  bool changeCheckbox = false;

  // Change checkbox function
  changeCheckboxFunction() {
    if (changeCheckbox) {
      changeCheckbox = !changeCheckbox;
      notifyListeners();
    } else {
      changeCheckbox = !changeCheckbox;
      notifyListeners();
    }
  }
}
