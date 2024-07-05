import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerace_app/Components/Address_card.dart';
import 'package:ecommerace_app/Pages/Profile/add_address_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SavedAddresses extends StatelessWidget {
  const SavedAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Addresses'),
      ),
      body: user == null
          ? const Center(child: Text('No user logged in'))
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(user.uid)
                  .collection('addresses')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching addresses'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No addresses found'));
                }

                final addresses = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address =
                        addresses[index].data() as Map<String, dynamic>;
                    return AddressCard(
                      addressLine1: address['addressLine1'],
                      addressLine2: address['addressLine2'] ?? '',
                      city: address['city'],
                      state: address['state'],
                      zipcode: address['zipcode'],
                      onEdit: () {
                        // Navigate to edit address page
                      },
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAddressPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
