import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/router/router.dart';
import 'package:unired_telegram/provider/auth/auth_provider.dart';
import 'package:unired_telegram/provider/language_provider.dart';
import 'package:unired_telegram/provider/otp_provider.dart';

void main() async {
  // Initialize widgets flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize easy localization package
  await EasyLocalization.ensureInitialized();
  // Change Language
  runApp(EasyLocalization(
    startLocale: const Locale('en'), // Start lang
    saveLocale: true, // Save language
    supportedLocales: const [
      // English
      Locale('en'),
      // Russian
      Locale('ru'),
    ],
    path: 'lib/core/lang',
    // Multi Providers
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(), // AuthProvider
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(), // LanguageProvider
        ),
        ChangeNotifierProvider(
          create: (context) => OtpProvider(), // OtpProvider
        ),
      ],
      child: const MyApp(), // MyApp
    ),
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
