import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text("drawerCalls".tr()),
        backgroundColor: const Color(0xff527DA3),
        actions: [
          const Icon(Icons.more_vert_outlined),
          SizedBox(width: context.width * 0.035),
        ],
      ),
      // Body
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                      ),
                      title: const Text("Unired Telegram",
                          style: TextStyle(fontSize: 17)),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: context.height * 0.01),
                        child: Row(
                          children: [
                            const Icon(
                              Icons
                                  .arrow_outward_outlined, //call_received_rounded
                              color: Colors.green,
                              size: 20,
                            ),
                            SizedBox(width: context.width * 0.02),
                            const Text("June 5 at 22:12"),
                          ],
                        ),
                      ),
                      trailing: const Icon(Icons.phone, color: Colors.blue),
                    ),
                    SizedBox(height: context.height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.18),
                      child: Container(
                        width: double.infinity,
                        height: 0.65,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff527DA3),
        onPressed: () {},
        child: const Icon(Icons.phone),
      ),
    );
  }
}
