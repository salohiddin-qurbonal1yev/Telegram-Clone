import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';
import 'package:unired_telegram/view/menu/calls_page.dart';
import 'package:unired_telegram/view/menu/contact_page.dart';
import 'package:unired_telegram/view/menu/invite_friends_page.dart';
import 'package:unired_telegram/view/menu/new_group_page.dart';
import 'package:unired_telegram/view/menu/settings_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff527DA3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/$index"),
                    radius: 40),
                SizedBox(
                  height: context.height * 0.01,
                ),
                const Text(
                  'Salohiddin',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                const Text(
                  "+998941636067",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewGroupPage()));
            },
            leading: const Icon(
              Icons.group,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerNewGroup'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactPage()));
            },
            leading: const Icon(
              Icons.perm_identity_outlined,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerContacts'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CallsPage()));
            },
            leading: const Icon(
              Icons.call,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerCalls'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person_pin_circle,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerPeopleNearby'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmark_border,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerSavedMessages'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            leading: const Icon(
              Icons.settings,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerSettings'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InviteFriendsPage()));
            },
            leading: const Icon(
              Icons.person_add_alt_outlined,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerInviteFriends'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.question_mark_outlined,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerTelegramFeatures'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
