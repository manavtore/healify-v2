import 'package:flutter/material.dart';
import 'package:healify/domain_layer/providers/authProvider.dart';
import 'package:healify/domain_layer/routes/routename.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  LoginNotifier loginNotifier = LoginNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Info'),
            onTap: () {
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); 
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                         loginNotifier.signOut();
                          Navigator.pushNamedAndRemoveUntil(context, Routename.login, (route) => false);
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
