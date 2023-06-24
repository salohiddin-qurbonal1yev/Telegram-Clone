import 'package:flutter/material.dart';
import 'package:unired_telegram/view/auth/auth_screen.dart';
import 'package:unired_telegram/view/auth/otp_screen.dart';
import 'package:unired_telegram/view/auth/start_screen.dart';
import 'package:unired_telegram/view/home/home_page.dart';

class RouteGenerator {
  // Singletone
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case 'start':
        return _navigate(const StartScreen());
      case 'auth':
        return _navigate(const AuthScreen());
      case 'otp':
        return _navigate(OtpScreen(
          otpCode: settings.arguments.toString(),
        ));
      case '/':
        return _navigate(const HomePage());
      case 'contacts':
      default:
        return _navigate(const HomePage());
    }
  }

  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
