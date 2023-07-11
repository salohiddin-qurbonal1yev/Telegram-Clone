import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/view/drawer/home_driwer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    debugPrint('Welcome to Home Page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text("telegram".tr()),
        actions: [
          const Icon(Icons.search),
          SizedBox(
            width: context.width * 0.03,
          )
        ],
        backgroundColor: const Color(0xff527DA3),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/$index"),
                    backgroundColor: const Color(0xff527DA3),
                    radius: 25),
                title: const Text(
                  "Unired Telegram",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.01,
                  ),
                  child: const Text(
                    "Bitib qoldi",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                trailing: const Text(
                  "11.07.2023",
                  style: TextStyle(
                    color: Color(0xff999999),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: context.width * 0.18),
                child: Container(
                  width: double.infinity,
                  height: context.height * 0.001,
                  decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Add');
        },
        backgroundColor: const Color(0xff527DA3),
        child: const Icon(Icons.auto_fix_normal),
      ),
    );
  }
}
