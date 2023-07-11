/*
  11.07.2023
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text("drawerContacts".tr()),
        backgroundColor: const Color(0xff527DA3),
        actions: [
          const Icon(Icons.search),
          SizedBox(width: context.width * 0.05),
          const Icon(Icons.menu_open_outlined),
          SizedBox(width: context.width * 0.04),
        ],
      ),
      // Body
      body: Column(
        children: [
          SizedBox(height: context.height * 0.01),
          Padding(
            padding: EdgeInsets.only(left: context.width * 0.04),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_add_alt_1_outlined,
                        size: 28, color: Colors.grey),
                    SizedBox(width: context.width * 0.05),
                    Text(
                      "drawerInviteFriends".tr(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.01),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 27, color: Colors.grey),
                    SizedBox(width: context.width * 0.05),
                    Text(
                      "contactsFindPeopleNearby".tr(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: context.height * 0.02),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xffE9E8E8)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.03,
                  vertical: context.height * 0.008),
              child: Text(
                "contactsSortedByLastSeenTime".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 131, 131, 131)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/$index"),
                    backgroundColor: const Color(0xff527DA3),
                    radius: 25,
                  ),
                  title: const Text("Unired Telegram"),
                  subtitle: const Text("online",
                      style: TextStyle(color: Colors.blue)),
                );
              },
            ),
          ),
        ],
      ),
      // Floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff527DA3),
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_rounded),
      ),
    );
  }
}
