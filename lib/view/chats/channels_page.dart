import 'package:flutter/material.dart';
import 'package:unired_telegram/core/widgets/chats_builder.dart';

class ChannelsPage extends StatelessWidget {
  const ChannelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ChatsBuilder());
  }
}
