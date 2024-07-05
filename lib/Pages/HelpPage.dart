import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Help & Support',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Welcome message
              Text(
                'Welcome to E-Commerce Help Center!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Introduction
              Text(
                '''At E-Commerce, we strive to provide the best shopping experience possible. If you have any questions or need assistance, you're in the right place. Below you'll find answers to our most frequently asked questions, as well as ways to contact our support team for further help.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              // Account & Login section
              Text(
                '1. Account & Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'How do I create an account?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Tap on the 'Sign Up' button on the login page. Fill in your details and follow the on-screen instructions to create your account.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'I forgot my password. What should I do?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Tap on 'Forgot Password' on the login page. Enter your registered email address, and we'll send you a link to reset your password.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              // Browsing & Searching section
              Text(
                '2. Browsing & Searching',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'How do I find a specific item?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Use the search bar at the top of the app to type in keywords related to the item you're looking for. Use filters and categories to narrow down your search results.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              // Placing an Order section
              Text(
                '3. Placing an Order',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'How do I place an order?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Select the item you wish to purchase. Choose your size and color options. Tap 'Add to Bag' and then proceed to checkout. Enter your shipping and payment information, then confirm your order.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              // More sections can be added similarly...
              // Payment & Billing section
              SizedBox(height: 20),
              Text(
                '4. Payment & Billing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'What payment methods do you accept?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''We accept major credit cards, debit cards, and PayPal.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Can I use multiple payment methods for one order?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''No, at this time, we only accept one form of payment per order.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              // Shipping & Delivery section
              SizedBox(height: 20),
              Text(
                '5. Shipping & Delivery',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'What are your shipping options?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''We offer standard, express, and next-day delivery options. Shipping costs and delivery times vary based on your location and selected shipping method.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'How can I track my order?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Once your order is shipped, you will receive a tracking number via email. You can also track your order in the 'My Orders' section of the app.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              // Returns & Refunds section
              SizedBox(height: 20),
              Text(
                '6. Returns & Refunds',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'What is your return policy?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''We accept returns within 30 days of purchase. Items must be unworn, unwashed, and in original packaging with tags attached.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'How do I return an item?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Go to 'My Orders' and select the item you wish to return. Follow the on-screen instructions to generate a return label and send the item back to us.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'When will I receive my refund?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '''Refunds are processed within 7-10 business days after we receive your return. The refund will be credited to your original method of payment.''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              // More sections can be added similarly...
            ],
          ),
        ),
      ),
    );
  }
}
