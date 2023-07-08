import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/provider/auth/auth_provider.dart';
import 'package:unired_telegram/provider/phone_number_provider.dart';
import 'package:unired_telegram/view/auth/otp_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      builder: (context, child) {
        return Scaffold(
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
                    InkWell(
                      onTap: () {
                        // _Show modal bottom sheet
                        _showModalBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.05,
                            vertical: context.height * 0.014,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'authCountry'.tr(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined),
                            ],
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
                              "+998",
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
          // Floating action button
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff50a8eb),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OtpScreen(otpCode: '12345'),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }

  // Show Modal Bottom Sheet
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            SizedBox(height: context.height * 0.005),
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              title: Text(
                "authChooseCountry".tr(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: context.width * 0.03,
                  ),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            const Divider(color: Colors.black),
            SizedBox(height: context.height * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: regions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        Provider.of<CountryProvider>(context, listen: false)
                            .countryController
                            .text = regions[index];
                        Navigator.pop(context);
                      });
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/$index",
                      ),
                    ),
                    title: Text(regions[index]),
                    trailing: Text(codePhoneNum[index]),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // Regions
  List regions = [
    "United Kingdom",
    "Saudi Arabia",
    "United Arab Emirates",
    "Uzbekistan",
    "Argentina",
    "Azerbaijan",
    "Australia",
    "Germany",
    "Brazil",
  ];

  // Code Phone Number
  List codePhoneNum = [
    "+971",
    "+966",
    "+971",
    "+998",
    "+54",
    "+994",
    "+61",
    "+49",
    "+55",
  ];
}
