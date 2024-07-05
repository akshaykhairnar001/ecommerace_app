import 'package:ecommerace_app/auth/auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
    // Add code after super
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AuthPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 120,
            ),
            Text(
              'E-commerce',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
