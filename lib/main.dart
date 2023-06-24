import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/view/auth/auth_screen.dart';
import 'package:unired_telegram/view/auth/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    startLocale: const Locale('en'),
    saveLocale: true,
    supportedLocales: const [
      Locale('en'),
      Locale('ru'),
    ],
    path: 'lib/core/lang',
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
    );
  }
}
