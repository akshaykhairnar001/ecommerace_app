import 'package:flutter/material.dart';

class SupportSettingsPage extends StatelessWidget {
  const SupportSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Help Center'),
            onTap: () {
              // Navigate to help center page
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            subtitle: const Text('Email, Phone, Chat'),
            onTap: () {
              // Navigate to contact us page
            },
          ),
          ListTile(
            title: const Text('Feedback'),
            subtitle: const Text('Provide feedback or report issues'),
            onTap: () {
              // Navigate to feedback page
            },
          ),
        ],
      ),
    );
  }
}
