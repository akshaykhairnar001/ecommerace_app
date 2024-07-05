import 'package:flutter/material.dart';
import 'package:ecommerace_app/Components/my_button.dart';
import 'package:ecommerace_app/Components/my_textfield.dart';
import 'package:ecommerace_app/Pages/Forgot_password_page.dart';
import 'package:ecommerace_app/Pages/Register_page.dart';
import 'package:ecommerace_app/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Sign in method
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Pop the loading circle
      if (context.mounted) Navigator.pop(context);

      // Navigate to the HomePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      if (context.mounted) Navigator.pop(context);

      // Display the error using a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An error occurred'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  bool isValidEmail(String email) {
    // Simple email validation regex
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 100),
                const SizedBox(height: 40),
                MyTextfield(
                  hintText: 'Enter Email',
                  controller: emailController,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                MyTextfield(
                  hintText: 'Enter Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Sign in button
                MyButton(text: "Login", onTap: () => login(context)),
                const SizedBox(height: 15),
                // Don't have an account? Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Register here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
