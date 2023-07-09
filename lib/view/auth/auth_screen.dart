import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/provider/auth/auth_provider.dart';
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
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) {
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
                // InkWell(
                //   onTap: () {
                //     // _Show modal bottom sheet
                //     showModalBottomSheet(
                //       isScrollControlled: true,
                //       context: context,
                //       shape: const RoundedRectangleBorder(
                //         borderRadius:
                //             BorderRadius.vertical(top: Radius.circular(15)),
                //       ),
                //       builder: (BuildContext context) {
                //         return SizedBox(
                //           height: 550.0,
                //           child: Column(
                //             children: [
                //               SizedBox(height: context.height * 0.01),
                //               AppBar(
                //                 backgroundColor: Colors.transparent,
                //                 elevation: 0,
                //                 iconTheme:
                //                     const IconThemeData(color: Colors.black),
                //                 title: Text(
                //                   "authChooseCountry".tr(),
                //                   style: const TextStyle(color: Colors.black),
                //                 ),
                //                 actions: [
                //                   Padding(
                //                     padding: EdgeInsets.only(
                //                         right: context.width * 0.045),
                //                     child: const Icon(Icons.search),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: context.height * 0.003,
                //               ),
                //               const Divider(color: Colors.black, height: 15),
                //               Expanded(
                //                 child: ListView.builder(
                //                   itemCount: 9,
                //                   itemBuilder: (context, index) {
                //                     return InkWell(
                //                       onTap: () {},
                //                       child: ListTile(
                //                         leading: const CircleAvatar(),
                //                         title: Text(regions[index]),
                //                         trailing: Text(codePhoneNum[index]),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     );
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey),
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(8)),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(
                //         horizontal: context.width * 0.05,
                //         vertical: context.height * 0.014,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'authCountry'.tr(),
                //             style: const TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontSize: 16,
                //             ),
                //           ),
                //           const Icon(Icons.keyboard_arrow_right_outlined),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                // Container(
                //   decoration:
                //       BoxDecoration(border: Border.all(color: Colors.grey)),
                //   child: Row(
                //     children: [
                //       SizedBox(width: context.width * 0.045),
                //       Expanded(
                //         flex: 2,
                //         child: TextFormField(
                //           decoration: const InputDecoration(
                //             border: InputBorder.none,
                //             hintText: "+",
                //           ),
                //         ),
                //       ),
                //       const Text("|"),
                //       SizedBox(width: context.width * 0.03),
                //       Expanded(
                //         flex: 9,
                //         child: TextFormField(
                //           decoration:
                //               const InputDecoration(border: InputBorder.none),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                IntlPhoneField(
                  controller:
                      context.watch<AuthProvider>().phoneNumberController,
                  flagsButtonPadding: const EdgeInsets.all(8),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                    labelText: 'authInputPhoneNumber'.tr(),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  // initialCountryCode: 'IN',
                  onChanged: (value) {
                    debugPrint(value.completeNumber);
                    debugPrint(value.countryCode);
                    debugPrint(value.countryISOCode);
                    debugPrint(value.number);
                  },
                )
                // SizedBox(
                //   width: double.infinity,
                //   height: context.height * 0.06,
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       prefixIcon: Padding(
                //         padding: EdgeInsets.only(
                //           top: context.height * 0.018,
                //           left: context.width * 0.04,
                //           right: context.width * 0.03,
                //         ),
                //         child: const Padding(
                //           padding: EdgeInsets.only(bottom: 13),
                //           child: Text(
                //             "+ |",
                //             style: TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontSize: 15,
                //             ),
                //           ),
                //         ),
                //       ),
                //       labelText: "authInputPhoneNumber".tr(),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      // Floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff50a8eb),
        onPressed: () {
          if (context.read<AuthProvider>().phoneNumberController.text.length >=
              9) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const OtpScreen(otpCode: "12345")),
                (route) => false);
          } else {
            debugPrint("Error number");
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  // Show Modal Bottom Sheet
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
