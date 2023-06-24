import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:unired_telegram/core/extensions/build_context_extension.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterContactPicker _contactPicker = FlutterContactPicker();
    Contact? _contact;
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
                const CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random/?5"),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                const Text(
                  "Ilyos",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                const Text(
                  "+998943613555",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.group,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerNewGroup'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
            onTap: () => {},
          ),
          ListTile(
            onTap: () async {
              Contact? contact = await _contactPicker.selectContact();
              _contact = contact;
            },
            leading: const Icon(
              Icons.perm_contact_cal_outlined,
              color: Colors.grey,
              size: 28,
            ),
            title: Text(
              'drawerContacts'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
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
