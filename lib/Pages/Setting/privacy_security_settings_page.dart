import 'package:flutter/material.dart';

class PrivacySecuritySettingsPage extends StatelessWidget {
  const PrivacySecuritySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Security Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          ListTile(
            title: const Text('Terms & Conditions'),
            onTap: () {
              // Navigate to terms & conditions page
            },
          ),
          ListTile(
            title: const Text('Data Privacy'),
            subtitle: const Text('Download or delete account data'),
            onTap: () {
              // Navigate to data privacy settings page
            },
          ),
          SwitchListTile(
            title: const Text('Two-Factor Authentication'),
            value: true, // Replace with actual value
            onChanged: (bool value) {
              // Handle change
            },
          ),
        ],
      ),
    );
  }
}
