import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/core/widgets/pinput/src/pinput.dart';
import 'package:unired_telegram/provider/otp_provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.otpCode});
  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.1,
              ),
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/email_pochta.jpg"),
                  radius: 80,
                ),
              ),
              SizedBox(
                height: context.height * 0.025,
              ),
              Text(
                'otpEmail'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: context.height * 0.015,
              ),
              Text(
                'otpTitle'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
                child: Pinput(
                  controller: context.read<OtpProvider>().otpController,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Otp code length
                  length: 5,
                  // default
                  defaultPinTheme: PinTheme(
                    textStyle: const TextStyle(fontSize: 16),
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  // On focused
                  focusedPinTheme: PinTheme(
                    textStyle: const TextStyle(fontSize: 16),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  useNativeKeyboard: true,
                ),
              ),
              SizedBox(
                height: context.height * 0.025,
              ),
              Text(
                'otpEmailWait'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
              ),
              SizedBox(
                height: context.height * 0.008,
              ),
              Text(
                'otpSms'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff50a8eb),
          onPressed: () {
            if (context.read<OtpProvider>().otpController.text.length == 5) {
              Navigator.pushNamed(context, '/');
            } else {
              debugPrint('Otp code error');
            }
          },
          child: const Icon(Icons.arrow_forward_outlined),
        ),
      );
}
