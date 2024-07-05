import 'package:flutter/material.dart';

class PreferencesSettingsPage extends StatelessWidget {
  const PreferencesSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('Change app language'),
            onTap: () {
              // Navigate to language settings page
            },
          ),
          ListTile(
            title: const Text('Currency'),
            subtitle: const Text('Set preferred currency'),
            onTap: () {
              // Navigate to currency settings page
            },
          ),
          ListTile(
            title: const Text('Size Preferences'),
            subtitle: const Text('Save preferred clothing sizes'),
            onTap: () {
              // Navigate to size preferences page
            },
          ),
          ListTile(
            title: const Text('Wishlist'),
            subtitle: const Text('Manage wishlist items'),
            onTap: () {
              // Navigate to wishlist page
            },
          ),
        ],
      ),
    );
  }
}
