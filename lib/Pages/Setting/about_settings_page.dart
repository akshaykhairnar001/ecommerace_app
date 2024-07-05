import 'package:flutter/material.dart';

class AboutSettingsPage extends StatelessWidget {
  const AboutSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('App Version'),
            subtitle: Text('1.0.0'), // Replace with actual app version
          ),
          const ListTile(
            title: Text('Developers'),
            subtitle: Text('Akshay Khairnar'),
          ),
          ListTile(
            title: const Text('Rate Us'),
            onTap: () {
              // Link to app store for rating the app
            },
          ),
        ],
      ),
    );
  }
}
