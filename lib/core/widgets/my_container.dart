import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.index});

  final String title;
  final int index;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.height * 0.07,
            child: ListTile(
              trailing: index % 2 == 0
                  ? CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 12,
                      child: Text(
                        index.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  : CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                      child: Text(
                        index.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://source.unsplash.com/random/?$index"),
                radius: 32,
              ),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ),
        ],
      ),
    );
  }
}
