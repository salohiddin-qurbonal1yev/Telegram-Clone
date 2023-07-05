import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/provider/auth/auth_provider.dart';
import 'package:unired_telegram/provider/code_phone_number_provider.dart';
import 'package:unired_telegram/view/auth/otp_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.2,
                  ),
                  Text(
                    'authPhoneNumber'.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.015,
                  ),
                  Text(
                    'authTitle'.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(255, 124, 124, 124),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: context.height * 0.04,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: context.height * 0.06,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'authCountry'.tr(),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 25.0,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: context.height * 0.01,
                          horizontal: context.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: context.height * 0.06,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            top: context.height * 0.018,
                            left: context.width * 0.04,
                            right: context.width * 0.03,
                          ),
                          child: const Text(
                            '+998 | ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        labelText: 'authInputPhoneNumber'.tr(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: context.height * 0.01,
                          horizontal: context.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff50a8eb),
          onPressed: () {
            if (context
                .watch<CodePhoneNumberProvider>()
                .codePhoneNumberController
                .text
                .isNotEmpty) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const OtpScreen(otpCode: '12345'),
                ),
                (route) => false,
              );
            } else {
              debugPrint('TextFormField ichiga hech nima kiritilmadi!!!');
            }
          },
          child: const Icon(Icons.arrow_forward),
        ),
      );
}
