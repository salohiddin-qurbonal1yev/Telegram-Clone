/*
11.07.2023
*/

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // File image
  File? image;

  // Pick image service
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

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
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: image != null
                                ? Image.file(image!, fit: BoxFit.fill)
                                : const FlutterLogo(),
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: InkWell(
                              onTap: () {
                                // Show modal bottom sheet
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: context.height * 0.7,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: context.height * 0.03),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: context.width * 0.055),
                                            child: Text(
                                              "menuSettingsProfilePhoto".tr(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                              height: context.height * 0.02),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    context.width * 0.03),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    pickImage(
                                                        ImageSource.camera);
                                                  },
                                                  // Camera container
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      borderRadius:
                                                          const BorderRadiusDirectional
                                                              .only(
                                                        topStart:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(50),
                                                      child: Icon(
                                                        Icons.camera_alt,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        context.width * 0.03),
                                                InkWell(
                                                  onTap: () {
                                                    pickImage(
                                                        ImageSource.gallery);
                                                  },
                                                  // Gallery container
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(50),
                                                      child: Icon(
                                                        Icons.image,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Icon(Icons.camera_alt_outlined,
                                  color: Colors.white),
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
                          SizedBox(height: context.height * 0.015),
                          const Text(
                            "+998 941636067",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: context.height * 0.008),
                          Text(
                            "menuSettingsPhoneNumber".tr(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: context.height * 0.01),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.003),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration:
                                  const BoxDecoration(color: Color(0xffD9D9D9)),
                            ),
                          ),
                          SizedBox(height: context.height * 0.01),
                          const Text(
                            "@qurbonaliyev_66",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: context.height * 0.008),
                          Text(
                            "menuSettingsUserName".tr(),
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          SizedBox(height: context.height * 0.01),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.width * 0.003),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration:
                                  const BoxDecoration(color: Color(0xffD9D9D9)),
                            ),
                          ),
                          SizedBox(height: context.height * 0.01),
                          const Text(
                            "Flutter Developer",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: context.height * 0.008),
                          Text(
                            "menuSettingsBio".tr(),
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          SizedBox(height: context.height * 0.01),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: context.height * 0.01,
                      decoration:
                          BoxDecoration(color: Colors.blueGrey.shade100),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.height * 0.025),
                          Text("drawerSettings".tr(),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: context.height * 0.015),
                          Row(
                            children: [
                              Icon(Icons.message_outlined,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsChatSettings".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          Row(
                            children: [
                              Icon(Icons.lock_outline_rounded,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsPrivacy".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          Row(
                            children: [
                              Icon(Icons.notifications_none_outlined,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsNotifications".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          Row(
                            children: [
                              Icon(Icons.data_usage_outlined,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsData".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          Row(
                            children: [
                              Icon(Icons.battery_charging_full_outlined,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsPowerSaving".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          Row(
                            children: [
                              Icon(Icons.folder_open_rounded,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsChatFolders".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          Row(
                            children: [
                              Icon(Icons.devices,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsDevices".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.013),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.013),
                          // On language add Inkwell (){}
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.language_outlined,
                                        size: 26, color: Colors.grey.shade600),
                                    SizedBox(width: context.width * 0.045),
                                    Text(
                                      "menuSettingsLanguage".tr(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: context.width * 0.04),
                                  child: const Text(
                                    "English",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.height * 0.015),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: context.height * 0.01,
                      decoration:
                          BoxDecoration(color: Colors.blueGrey.shade100),
                    ),
                    SizedBox(height: context.height * 0.015),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.04),
                      child: Row(
                        children: [
                          Icon(Icons.star,
                              size: 28, color: Colors.deepPurple.shade300),
                          SizedBox(width: context.width * 0.045),
                          const Text("Telegram Premium",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.015),
                    Container(
                      width: double.infinity,
                      height: context.height * 0.01,
                      decoration:
                          BoxDecoration(color: Colors.blueGrey.shade100),
                    ),
                    SizedBox(height: context.height * 0.025),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "menuSettingsHelp".tr(),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 15.5,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: context.height * 0.015),
                          Row(
                            children: [
                              Icon(Icons.question_answer_sharp,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsAskQuestion".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration:
                                  const BoxDecoration(color: Color(0xffD9D9D9)),
                            ),
                          ),
                          SizedBox(height: context.height * 0.01),
                          Row(
                            children: [
                              Icon(Icons.question_mark_outlined,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsFAQ".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: context.width * 0.1),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.001,
                              decoration:
                                  const BoxDecoration(color: Color(0xffD9D9D9)),
                            ),
                          ),
                          SizedBox(height: context.height * 0.01),
                          Row(
                            children: [
                              Icon(Icons.library_add_check_outlined,
                                  size: 26, color: Colors.grey.shade600),
                              SizedBox(width: context.width * 0.045),
                              Text(
                                "menuSettingsPrivacyPolicy".tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: context.height * 0.018),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: context.height * 0.04,
                      decoration:
                          BoxDecoration(color: Colors.blueGrey.shade100),
                      child: Padding(
                        padding: EdgeInsets.only(top: context.height * 0.008),
                        child: const Text("Unired Telegram",
                            textAlign: TextAlign.center),
                      ),
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
