import 'package:flutter/material.dart';
import 'package:unired_telegram/core/helpers/show_message.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? _lastPressedAt;
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (_lastPressedAt == null ||
            now.difference(_lastPressedAt!) > const Duration(seconds: 1)) {
          _lastPressedAt = now;
          showMessage("Chiqish uchun 2 marta bosing");
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            // title: Text(data),
            ),
      ),
    );
  }
}
