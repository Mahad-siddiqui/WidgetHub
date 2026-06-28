import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://example.com/user_profile_image.png'; // Replace with a valid image URL

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.purple),
            accountName: const Text('User Name'),
            accountEmail: const Text('user@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.purple),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.purple),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
