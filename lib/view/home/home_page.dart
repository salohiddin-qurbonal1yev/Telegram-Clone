import 'package:flutter/material.dart';
import 'package:unired_telegram/view/drawer/home_driwer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text(
          "SuperApp",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          labelStyle: const TextStyle(fontSize: 20),
          isScrollable: true,
          tabs: const [
            Tab(
              text: "All",
            ),
            Tab(
              text: "My Own",
            ),
            Tab(
              text: "Groups",
            ),
            Tab(
              text: "Channels",
            ),
            Tab(
              text: "Bots",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(controller: _tabController, children: _widgets),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

List<Widget> _widgets = const [
  // AllChatsPage(),
  // MyOwnPage(),
  // GroupsPage(),
  // ChannelsPage(),
  // BotsPage()
];
