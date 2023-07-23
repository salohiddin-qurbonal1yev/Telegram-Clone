/*
13.07.2023
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/provider/translate/show_translate_switch_button.dart';

class SettingsLanguagePage extends StatefulWidget {
  const SettingsLanguagePage({Key? key}) : super(key: key);

  @override
  State<SettingsLanguagePage> createState() => _SettingsLanguagePageState();
}

class _SettingsLanguagePageState extends State<SettingsLanguagePage> {
  // Variables
  int _value = 0;
  String lang = "";
  int currentIndex = 0;
  GetStorage getStorage = GetStorage();

  @override
  void initState() {
    lang = getStorage.read("lang") ?? "en";
    getStorage.write("lang", lang);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShowTranslateSwitchButtonProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("menuSettingsLanguage".tr()),
        actions: [
          const Icon(Icons.search),
          SizedBox(
            width: context.width * 0.04,
          )
        ],
        backgroundColor: const Color(0xff527DA3),
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "menuSettingsLanguageTMessage".tr(),
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: context.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "menuSettingsLanguageSwitch1".tr(),
                      style: const TextStyle(fontSize: 16.5),
                    ),
                    Switch.adaptive(
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blue,
                      inactiveThumbColor: Colors.white,
                      value: context
                          .watch<ShowTranslateSwitchButtonProvider>()
                          .change,
                      onChanged: (value) {
                        context
                            .read<ShowTranslateSwitchButtonProvider>()
                            .changeSwitch();
                      },
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: context.height * 0.001,
                  decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "menuSettingsLanguageSwitch2".tr(),
                      style: const TextStyle(fontSize: 16.5),
                    ),
                    Switch.adaptive(
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blue,
                      inactiveThumbColor: Colors.white,
                      value: context
                          .watch<ShowTranslateSwitchButtonProvider>()
                          .change2,
                      onChanged: (value) {
                        context
                            .read<ShowTranslateSwitchButtonProvider>()
                            .changeSwitch2();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 231, 231, 231)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.038,
                  vertical: context.height * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "menuSettingsLanguageTitle1".tr(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(height: context.height * 0.02),
                  Text(
                    "menuSettingsLanguageTitle2".tr(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                  top: context.height * 0.02, left: context.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "menuSettingsLanguage".tr(),
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  // Radio 1
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              lang = "en";
                              context.setLocale(Locale(lang));
                              getStorage.write("lang", lang);
                              _value = value!;
                            });
                          }),
                      const Text("English"),
                    ],
                  ),
                  // Radio 2
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) async {
                            setState(() {
                              lang = "ru";
                              context.setLocale(Locale(lang));
                              getStorage.write("lang", lang);
                              _value = value!;
                            });
                          }),
                      const Text("Русский"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Provider.of<LanguageProvider>(context,
//                                       listen: false)
//                                   .changeLang();
//                               await context.setLocale(Locale(
//                                   Provider.of<LanguageProvider>(context,
//                                           listen: false)
//                                       .langs[Provider.of<LanguageProvider>(
//                                           context,
//                                           listen: false)
//                                       .currentIndex]));