/*
12.07.2023
*/

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: const Color(0xff527DA3),
        title: Text("drawerInviteFriends".tr()),
      ),
      // Body
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.width * 0.03),
            child: SizedBox(
              width: double.infinity,
              height: context.height * 0.05,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "menuInviteFriendsSearch".tr(),
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 17),
                    contentPadding:
                        EdgeInsets.only(top: context.height * 0.01)),
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.008,
          ),
          const Divider(
            color: Colors.grey,
          ),
          // SizedBox(height: context.height * 0.02),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: context.width * 0.055),
          //   child: Row(
          //     children: [
          //       Icon(Icons.share, color: Colors.grey.shade600, size: 25),
          //       SizedBox(width: context.width * 0.09),
          //       Text(
          //         "menuInviteFriendsShareTelegram".tr(),
          //         style: const TextStyle(fontSize: 18),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: context.height * 0.02),
          // Padding(
          //   padding: EdgeInsets.only(left: context.width * 0.2),
          //   child: Container(
          //     width: double.infinity,
          //     height: context.height * 0.001,
          //     decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
          //   ),
          // ),
          // SizedBox(height: context.height * 0.01),
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                        radius: 25,
                      ),
                      title: Padding(
                        padding:
                            EdgeInsets.only(bottom: context.height * 0.005),
                        child: const Text("Unired Telegram"),
                      ),
                      subtitle: const Text("148 contacts Telegram"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.2),
                      child: Container(
                        width: double.infinity,
                        height: context.height * 0.001,
                        decoration:
                            const BoxDecoration(color: Color(0xffD9D9D9)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
