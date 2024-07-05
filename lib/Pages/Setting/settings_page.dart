import 'package:ecommerace_app/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'notifications_settings_page.dart';
import 'preferences_settings_page.dart';
import 'privacy_security_settings_page.dart';
import 'support_settings_page.dart';
import 'about_settings_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Notifications'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsSettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Preferences'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PreferencesSettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Privacy & Security'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PrivacySecuritySettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Support'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SupportSettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('About'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutSettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primary),
              child: ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  logout(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
