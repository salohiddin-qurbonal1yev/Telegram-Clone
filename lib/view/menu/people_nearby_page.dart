/*
13.07.2023
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class PeopleNearbyPage extends StatelessWidget {
  const PeopleNearbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.015,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff50a8eb),
                    borderRadius: BorderRadius.all(Radius.circular(54))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.06,
                      vertical: context.height * 0.03),
                  child: const Icon(Icons.location_on,
                      color: Colors.white, size: 45),
                ),
              ),
              SizedBox(
                height: context.height * 0.08,
              ),
              Text(
                "drawerPeopleNearby".tr(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              Text(
                "menuPeopleNearbyTitle1".tr(),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.025,
              ),
              Text(
                "menuPeopleNearbyTitle2".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
              ),
              SizedBox(
                height: context.height * 0.28,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
                child: SizedBox(
                  width: double.infinity,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff50a8eb))),
                      onPressed: () {},
                      child: Text("menuPeopleNearbyButton".tr())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
