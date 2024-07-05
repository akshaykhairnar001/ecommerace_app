import 'package:flutter/material.dart';

class NotificationsSettingsPage extends StatefulWidget {
  @override
  _NotificationsSettingsPageState createState() =>
      _NotificationsSettingsPageState();
}

class _NotificationsSettingsPageState extends State<NotificationsSettingsPage> {
  bool _pushNotificationsEnabled = true;
  bool _emailNotificationsEnabled = false;

  void _togglePushNotifications(bool value) {
    setState(() {
      _pushNotificationsEnabled = value;
      // You can save this value to preferences or database for persistence
    });
  }

  void _toggleEmailNotifications(bool value) {
    setState(() {
      _emailNotificationsEnabled = value;
      // You can save this value to preferences or database for persistence
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Push Notifications'),
              subtitle: const Text('Receive updates and alerts'),
              value: _pushNotificationsEnabled,
              onChanged: _togglePushNotifications,
            ),
            SwitchListTile(
              title: const Text('Email Notifications'),
              subtitle: const Text('Receive promotional emails'),
              value: _emailNotificationsEnabled,
              onChanged: _toggleEmailNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
