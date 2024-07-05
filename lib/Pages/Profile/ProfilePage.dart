import 'package:ecommerace_app/Components/my_button.dart';
import 'package:ecommerace_app/Pages/Profile/add_address_Page.dart';
import 'package:ecommerace_app/Pages/Profile/edit_profile.dart';
import 'package:ecommerace_app/Pages/Profile/saved_addresses.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Current logged-in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('User')
        .doc(currentUser?.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Error
          else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          // Data Received
          else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data?.data();

            return ListView(
              children: [
                // Profile image
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile Picture
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/Profile/default_profile.jpg'),
                        ),
                      ),
                    ]),

                // Profile name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    user?['username'] ?? 'User Name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Profile email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    user?['email'] ?? 'user@example.com',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Divider(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                ),

                // Service
                ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: const Text('Order history'),
                  onTap: () {
                    // Go to order history page
                  },
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Saved addresses'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedAddresses()),
                    );
                  },
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('Payment methods'),
                  onTap: () {
                    // Go to payment methods page
                  },
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),

                // Profile settings
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Edit profile button
                      Expanded(
                        child: MyButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(),
                              ),
                            );
                          },
                          text: 'Edit Profile',
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      // Logout button
                      Expanded(
                        child: MyButton(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            // Handle the logout action here.
                          },
                          text: 'Logout',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}
