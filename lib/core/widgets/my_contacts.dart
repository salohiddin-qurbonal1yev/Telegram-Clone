import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class ContactsContainer extends StatelessWidget {
  const ContactsContainer(
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
              leading: const Icon(
                Icons.person,
                size: 32,
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
