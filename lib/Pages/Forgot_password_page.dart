import 'package:ecommerace_app/Components/my_button.dart';
import 'package:ecommerace_app/Components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  void resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send reset email. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lock_reset,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 200,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: 'Enter your Email',
              controller: emailController,
              obscureText: false,
            ),
            // keyboardType: TextInputType.emailAddress,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter your email';
            //   }
            //   return null;
            // },
            SizedBox(height: 20),
            MyButton(
                text: "Reset Password", onTap: () => resetPassword(context)),
            // ElevatedButton(
            //   onPressed: () => resetPassword(context),
            //   child: Text('Reset Password'),
            // ),
          ],
        ),
      ),
    );
  }
}
