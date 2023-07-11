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
                SizedBox(
                  height: context.height * 0.03,
                ),
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
                  initialCountryCode: 'UZ',
                  onChanged: (value) {
                    debugPrint(value.completeNumber);
                    debugPrint(value.countryCode);
                    debugPrint(value.countryISOCode);
                    debugPrint(value.number);
                  },
                ),
                // InkWell(
                //   onTap: () {
                //     showModalBottomSheet(
                //       context: context,
                //       isScrollControlled: true,
                //       shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(15)),
                //       ),
                //       builder: (BuildContext context) {
                //         return SizedBox(
                //           height: 600,
                //           child: Column(
                //             children: [
                //               SizedBox(height: context.height * 0.015),
                //               AppBar(
                //                 iconTheme:
                //                     const IconThemeData(color: Colors.black),
                //                 title: Text(
                //                   "authChooseCountry".tr(),
                //                   style: const TextStyle(color: Colors.black),
                //                 ),
                //                 backgroundColor: Colors.transparent,
                //                 elevation: 0,
                //                 actions: [
                //                   const Icon(Icons.search),
                //                   SizedBox(width: context.width * 0.045),
                //                 ],
                //               ),
                //               SizedBox(height: context.height * 0.005),
                //               const Divider(color: Colors.black),
                //               Expanded(
                //                 child: ListView.builder(
                //                   itemCount: regions.length,
                //                   itemBuilder: (context, index) {
                //                     return InkWell(
                //                       onTap: () {
                //                         setState(() {
                //                           // text = codePhoneNum[index];
                //                         });
                //                         Navigator.of(context).pop();
                //                       },
                //                       child: ListTile(
                //                         leading: const CircleAvatar(),
                //                         title: Text(regions[index].toString()),
                //                         trailing: Text(
                //                             codePhoneNum[index].toString()),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //               )
                //             ],
                //           ),
                //         );
                //       },
                //     );
                //   },
                //   child: Container(
                //     width: context.width * 0.9,
                //     height: context.height * 0.06,
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey),
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(10.0)),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: context.width * 0.03),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "authCountry".tr(),
                //             style: const TextStyle(
                //                 fontSize: 15, fontWeight: FontWeight.w500),
                //           ),
                //           const Icon(Icons.keyboard_arrow_right_outlined),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: context.height * 0.02),
                // Container(
                //   width: context.width * 0.9,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                //   ),
                //   child: Row(
                //     children: [
                //       SizedBox(width: context.width * 0.03),
                //       Expanded(
                //         flex: 1,
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //             border: InputBorder.none,
                //             // prefix: Text(text),
                //           ),
                //         ),
                //       ),
                //       const Text("|"),
                //       SizedBox(width: context.width * 0.03),
                //       Expanded(
                //         flex: 9,
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: "authInputPhoneNumber".tr()),
                //         ),
                //       ),
                //     ],
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
    "971",
    "966",
    "971",
    "998",
    "54",
    "994",
    "61",
    "49",
    "55",
  ];
}
