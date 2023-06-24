import 'package:flutter/material.dart';
import 'package:unired_telegram/core/widgets/my_container.dart';
import 'package:unired_telegram/data/model/users_model.dart';
import 'package:unired_telegram/data/service/users_service.dart';

class ChatsBuilder extends StatelessWidget {
  const ChatsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UsersService().getUsers(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          List<UsersModel> data = snapshot.data as List<UsersModel>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return MyContainer(
                title: data[index].name.toString(),
                subtitle: data[index].username.toString(),
                index: index,
              );
            },
          );
        }
      },
    );
  }
}
