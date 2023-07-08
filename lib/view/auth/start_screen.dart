import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/provider/language_provider.dart';
import 'package:unired_telegram/view/auth/auth_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.15,
              ),
              // Telegram Logo png
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/telegram_logo.png"),
                  radius: 80,
                ),
              ),
              SizedBox(
                height: context.height * 0.025,
              ),
              const Text(
                'Telegram',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: context.height * 0.015,
              ),
              Center(
                child: Text(
                  'startTitle'.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromARGB(255, 124, 124, 124),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: context.height * 0.23,
              ),
              // CHANGE LANGUAGE
              InkWell(
                onTap: () async {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLang();
                  await context.setLocale(
                    Locale(
                      Provider.of<LanguageProvider>(context, listen: false)
                              .langs[
                          Provider.of<LanguageProvider>(context, listen: false)
                              .currentIndex],
                    ),
                  );
                },
                child: Text(
                  'startLang'.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                child: SizedBox(
                  width: double.infinity,
                  height: context.height * 0.055,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff50a8eb),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'startButton'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
