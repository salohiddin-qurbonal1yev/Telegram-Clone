import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // Variables
  int currentIndex = 0;
  List<String> langs = ['en', 'ru'];

  // Change language provider
  void changeLang() {
    if (currentIndex == 1) {
      currentIndex = 0;
      notifyListeners();
    } else {
      currentIndex++;
      notifyListeners();
    }
  }
}
