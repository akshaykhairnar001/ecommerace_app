import 'package:ecommerace_app/Components/bag_manager.dart';
import 'package:ecommerace_app/Pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductTile extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double productPrice;
  final String productDetails;

  const ProductTile({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.productDetails,
  });

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isFavorite = false;
  bool isImageLoaded = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _addToBag() {
    BagManager().addItem({
      'imagePath': widget.imagePath,
      'productName': widget.productName,
      'productPrice': widget.productPrice,
      'productDetails': widget.productDetails,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.productName} added to bag')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              imagePath: widget.imagePath,
              productName: widget.productName,
              productPrice: widget.productPrice,
              productDetails: widget.productDetails,
            ),
          ),
        );
      },
      child: Card(
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    width: double.infinity,
                    height: 223,
                    child: FutureBuilder(
                      future: _loadImage(widget.imagePath),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          );
                        } else if (snapshot.hasError ||
                            widget.imagePath.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Image Not Available',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black54,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15), // Added padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                              'MRP ₹${widget.productPrice.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _addToBag,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadImage(String path) async {
    // Simulate a network call or image loading delay
    await Future.delayed(const Duration(seconds: 2));
  }
}
