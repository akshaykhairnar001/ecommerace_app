import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current user data
    _usernameController.text =
        'Current Username'; // Replace with actual username
    _emailController.text =
        'currentemail@example.com'; // Replace with actual email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/Profile/default_profile.jpg'),
              ),
            ),
            const SizedBox(height: 20),

            // Username TextField
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Email TextField (disabled for editing)
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              enabled: false, // Email should not be editable
            ),
            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Implement save functionality here
                _saveProfileChanges();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfileChanges() {
    // Implement saving profile changes to Firestore or backend
    String newUsername = _usernameController.text.trim();
    // Validate and update user profile data
    // Example: Update Firestore document
    // Example: Show success or error message
    print('New Username: $newUsername');
    // Navigate back to profile page after saving
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // Clean up controllers
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
