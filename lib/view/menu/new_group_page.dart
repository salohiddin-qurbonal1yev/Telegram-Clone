/*
11.07.2023
*/
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class NewGroupPage extends StatelessWidget {
  const NewGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "drawerNewGroup".tr(),
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: context.height * 0.005,
            ),
            Text(
              "menuNewGroupMembers".tr(),
              style: TextStyle(fontSize: 14, color: Colors.blue.shade200),
            )
          ],
        ),
        backgroundColor: const Color(0xff527DA3),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.width * 0.03),
            child: SizedBox(
              width: double.infinity,
              height: context.height * 0.04,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "menuNewGroupTextField".tr(),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    contentPadding:
                        EdgeInsets.only(top: context.height * 0.003)),
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.008,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                      ),
                      title: Padding(
                        padding:
                            EdgeInsets.only(bottom: context.height * 0.006),
                        child: const Text("unired telegram"),
                      ),
                      subtitle: const Text("last sesn recently"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.19),
                      child: Container(
                        width: double.infinity,
                        height: context.height * 0.001,
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff527DA3),
        onPressed: () {},
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
