import 'package:ecommerace_app/Components/my_button.dart';
import 'package:ecommerace_app/Components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addAddress() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('user')
            .doc(user.uid) // Use UID instead of email for document ID
            .collection('addresses')
            .add({
          'addressLine1': _addressLine1Controller.text.trim(),
          'addressLine2': _addressLine2Controller.text.trim(),
          'city': _cityController.text.trim(),
          'state': _stateController.text.trim(),
          'zipcode': _zipcodeController.text.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Address added successfully')),
        );

        // Clear input fields after successful addition
        _addressLine1Controller.clear();
        _addressLine2Controller.clear();
        _cityController.clear();
        _stateController.clear();
        _zipcodeController.clear();
      } catch (e) {
        print('Error adding address: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to add address. Please try again later.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MyTextfield(
                hintText: 'Address Line 1',
                controller: _addressLine1Controller,
                obscureText: false),
            const SizedBox(height: 10),
            MyTextfield(
                hintText: 'Address Line 2',
                controller: _addressLine2Controller,
                obscureText: false),
            const SizedBox(height: 10),
            MyTextfield(
                hintText: 'City',
                controller: _cityController,
                obscureText: false),
            const SizedBox(height: 10),
            MyTextfield(
                hintText: 'State',
                controller: _stateController,
                obscureText: false),
            const SizedBox(height: 10),
            MyTextfield(
                hintText: 'Zip Code',
                controller: _zipcodeController,
                obscureText: false),
            const SizedBox(height: 40),
            MyButton(
              onTap: _addAddress,
              text: 'Save Address',
            ),
          ],
        ),
      ),
    );
  }
}
