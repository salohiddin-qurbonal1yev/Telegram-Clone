import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

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
          const DrawerHeader(
            // ignore: sort_child_properties_last
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random/?5"),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.group,
              color: Color(0xff2B9EF0),
              size: 28,
            ),
            title: const Text(
              'New Group',
              style: TextStyle(fontSize: 16),
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
              color: Color(0xff2B9EF0),
              size: 28,
            ),
            title: const Text(
              'Contacts',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.call,
              color: Color(0xff2B9EF0),
              size: 28,
            ),
            title: Text(
              'Calls',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.person_pin_circle,
              color: Color(0xff2B9EF0),
              size: 28,
            ),
            title: Text(
              'People Nearby',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.bookmark_border,
              color: Color(0xff2B9EF0),
              size: 28,
            ),
            title: Text(
              'Saved Messages',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xff2B9EF0),
              size: 28,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
