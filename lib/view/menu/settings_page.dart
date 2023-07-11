/*
11.07.2023
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff527DA3),
      // Body
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Top container
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff527DA3),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.035),
                  child: Column(
                    children: [
                      SizedBox(height: context.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.white)),
                          Row(
                            children: [
                              const Icon(Icons.qr_code, color: Colors.white),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: context.width * 0.055),
                                  child: const Icon(Icons.search,
                                      color: Colors.white)),
                              const Icon(Icons.more_vert_outlined,
                                  color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: context.height * 0.035),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random/?99",
                            ),
                          ),
                          SizedBox(width: context.width * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Unired Telegram",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "menuSettingsOnline".tr(),
                                style: const TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.03),
              // Bottom container
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.height * 0.025),
                          Text(
                            "menuSettingsAccount".tr(),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 15.5,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: context.height * 0.01),
                          const Text("+998 941636067"),
                          Text("menuSettingsPhoneNumber".tr()),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration:
                                  const BoxDecoration(color: Color(0xffD9D9D9)),
                            ),
                          ),
                          const Text("@qurbonaliyev_66"),
                          Text("menuSettingsUserName".tr()),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration:
                                  const BoxDecoration(color: Color(0xffD9D9D9)),
                            ),
                          ),
                          const Text("🌙"),
                          Text("menuSettingsBio".tr()),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: context.height * 0.01,
                      decoration: const BoxDecoration(color: Color(0xff999999)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("drawerSettings".tr(),
                              style: const TextStyle(color: Colors.blue)),
                          Row(
                            children: [
                              Icon(Icons.message_outlined),
                              Text("menuSettingsChatSettings".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              // Icon(Icons.),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded),
                              Text("menuSettingsPrivacy".tr()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.01),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
