import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/router/router.dart';

void main() async {
  // Initialize widgets flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize easy localization package
  await EasyLocalization.ensureInitialized();

  // Change Language
  runApp(EasyLocalization(
    startLocale: const Locale('en'),
    saveLocale: true,
    supportedLocales: const [
      // English
      Locale('en'),
      // Russian
      Locale('ru'),
    ],
    path: 'lib/core/lang',
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.router.onGenerate,
      initialRoute: 'start',
    );
  }
}
