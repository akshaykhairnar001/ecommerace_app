import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerace_app/Components/my_button.dart';
import 'package:ecommerace_app/Components/my_textfield.dart';
import 'package:ecommerace_app/Pages/login_page.dart';
import 'package:ecommerace_app/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  final void Function()? onTap;
}

class _RegisterPageState extends State<RegisterPage> {
  void register() {}

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpwdController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Make sure the passwords match
    if (passwordController.text != confirmpwdController.text) {
      // Pop loading circle
      Navigator.pop(context);
      // Display the error
      DisplayMessageToUser("Passwords don't match", context);
      return;
    }

    // Create the user
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      await createUserDocument(userCredential);

      // pop loading circle
      Navigator.of(context, rootNavigator: true).pop();

      // Clear the text fields
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmpwdController.clear();

      // Navigate to the login page
      if (widget.onTap != null) {
        widget.onTap!();
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // Display the error using a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An error occurred'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('user ')
            .doc(userCredential
                .user!.uid) // Use UID instead of email for document ID
            .set({
          'email': userCredential.user!.email,
          'username': nameController.text,
        });
        print("User document created successfully.");
      } catch (e) {
        print("Error creating user document: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_outlined, size: 100),
                      const SizedBox(height: 20),
                      MyTextfield(
                        hintText: 'Enter your Name',
                        controller: nameController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      MyTextfield(
                        hintText: 'Enter your Email',
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      MyTextfield(
                        hintText: 'Enter Password',
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      MyTextfield(
                        hintText: 'Confirm Password',
                        controller: confirmpwdController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 25),
                      // Register button
                      MyButton(text: "Register", onTap: registerUser),
                      const SizedBox(height: 25),
                      // Already have account? Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have an Account ",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the registration page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              "Login here",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // MyButton(
                      //   text: "Register",
                      //   onTap: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       if (!isValidEmail(emailController.text)) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //               content: Text('Please enter a valid email')),
                      //         );
                      //       } else if (passwordController.text.length < 6) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //               content:
                      //                   Text('Password must be at least 6 characters')),
                      //         );
                      //       } else {
                      //         registerUser();
                      //       }
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
