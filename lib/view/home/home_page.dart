import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/core/widgets/loading_widget.dart';
import 'package:unired_telegram/data/model/users_model.dart';
import 'package:unired_telegram/data/service/get_users_service.dart';
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
      body: FutureBuilder(
        future: UsersService().getUsers(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: LoadingWidget(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else {
            // List<UsersModel> data = snapshot.data as List<UsersModel>;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(radius: 30),
                      title: const Text(
                        "data[index].name.toString()",
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
                          "data[index].company!.catchPhrase.toString()",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      trailing: const Text(
                        'May 24',
                        style: TextStyle(
                          color: Colors.grey,
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
                        height: 0.65,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Added+++');
        },
        backgroundColor: const Color(0xff527DA3),
        child: const Icon(Icons.add),
      ),
    );
  }
}
