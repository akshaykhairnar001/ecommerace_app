import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
