import 'package:ecommerace_app/Components/bag_manager.dart';
import 'package:ecommerace_app/Components/dropdown_button.dart';
import 'package:ecommerace_app/Components/my_button.dart';
import 'package:ecommerace_app/Pages/BagPage.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double productPrice;
  final String productDetails;

  const ProductDetailsPage({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.productDetails,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite = false;
  Color selectedColor = Colors.red;

  // List of available colors
  final List<Color> availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _selectColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  void _addToBag() {
    BagManager().addItem({
      'imagePath': widget.imagePath,
      'productName': widget.productName,
      'productPrice': widget.productPrice,
      'productDetails': widget.productDetails,
      'selectedColor': selectedColor,
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BagPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        widget.imagePath,
                        height: 400,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: GestureDetector(
                          onTap: _toggleFavorite,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.productName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.productDetails,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Row(
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const DropdownButtonExample(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Colors',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Wrap(
                        spacing: 10,
                        children: availableColors.map((color) {
                          return GestureDetector(
                            onTap: () => _selectColor(color),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color,
                                border: Border.all(
                                  color: selectedColor == color
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              width: 30,
                              height: 30,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'MRP ₹${widget.productPrice}',
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  MyButton(
                    text: "Add To Bag",
                    onTap: _addToBag,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
