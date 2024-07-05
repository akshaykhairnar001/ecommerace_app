import 'package:ecommerace_app/Components/product_tile.dart';
import 'package:ecommerace_app/Components/my_drawer.dart';
import 'package:ecommerace_app/Components/banner_tile.dart';
import 'package:ecommerace_app/Pages/BagPage.dart';
import 'package:ecommerace_app/Pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerace_app/models/product.dart';

class HomePage extends StatefulWidget {
  final String? initialCategory; // Optional initial category

  const HomePage({super.key, this.initialCategory});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Initialize selectedIndex to 0

  // Example product list categorized
  final Map<String, List<Product>> categorizedProducts = {
    'MEN': [
      Product(
        imagePath: 'assets/images/Men/MProduct1.png',
        name: 'Product 1',
        price: 10.0,
        details:
            'No matter where you are in your running journey, you dont need your gear getting in your way. We designed this sweat-wicking Primary top to be soft and comfortable, with underarm ventilation to help keep you cool during your run. That way, the only thing on your mind is the road ahead.',
      ),
      Product(
        imagePath: 'assets/images/Men/MProduct2.png',
        name: 'Product 2',
        price: 20.0,
        details: 'Details for product Men 2',
      ),
      Product(
        imagePath: 'assets/images/Men/MProduct3.png',
        name: 'Product 2',
        price: 20.0,
        details: 'Details for product Men 3',
      ),
      Product(
        imagePath: 'assets/images/Men/MProduct4.png',
        name: 'Product 2',
        price: 20.0,
        details: 'Details for product Men 4',
      ),
      Product(
        imagePath: 'assets/images/Men/MProduct5.png',
        name: 'Product 2',
        price: 20.0,
        details: 'Details for product Men 5',
      ),
      Product(
        imagePath: 'assets/images/Men/MProduct6.png',
        name: 'Product 2',
        price: 20.0,
        details: 'Details for product Men 6',
      ),
    ],
    'WOMEN': [
      Product(
        imagePath: 'assets/images/Women/WProduct1.png',
        name: 'Product Women 1',
        price: 30.0,
        details: 'Details for product Women 1',
      ),
      Product(
        imagePath: 'assets/images/Women/WProduct2.png',
        name: 'Product Women 2',
        price: 30.0,
        details: 'Details for product Women 2',
      ),
      Product(
        imagePath: 'assets/images/Women/WProduct3.png',
        name: 'Product Women 3',
        price: 30.0,
        details: 'Details for product Women 3',
      ),
      Product(
        imagePath: 'assets/images/Women/WProduct4.png',
        name: 'Product Women 4',
        price: 30.0,
        details: 'Details for product Women 4',
      ),
      Product(
        imagePath: 'assets/images/Women/WProduct5.png',
        name: 'Product Women 5',
        price: 30.0,
        details: 'Details for product Women 5',
      ),
      Product(
        imagePath: 'assets/images/Women/WProduct6.png',
        name: 'Product Women 6',
        price: 30.0,
        details: 'Details for product Women 6',
      ),
      // Product(
      //   imagePath: 'assets/images/Women/WProduct7.png',
      //   name: 'Product Women 7',
      //   price: 30.0,
      //   details: 'Details for product Women 7',
      // ),
    ],
    'KIDS': [
      Product(
        imagePath: 'assets/images/kids/KProduct1.png',
        name: 'Product kids 1 ',
        price: 30.0,
        details: 'Details for product kids 1',
      ),
      Product(
        imagePath: 'assets/images/kids/KProduct2.png',
        name: 'Product kids 2',
        price: 50.0,
        details: 'Details for product kids 2',
      ),
      Product(
        imagePath: 'assets/images/kids/KProduct3.png',
        name: 'Product kids 3',
        price: 50.0,
        details: 'Details for product kids 3',
      ),
      Product(
        imagePath: 'assets/images/kids/KProduct4.png',
        name: 'Product kids 4',
        price: 50.0,
        details: 'Details for product kids 4',
      ),
      Product(
        imagePath: '',
        name: 'Product kids 5',
        price: 50.0,
        details: 'Details for product kids 5',
      ),
      Product(
        imagePath: 'assets/images/kids/KProduct6.png',
        name: 'Product kids 6',
        price: 50.0,
        details: 'Details for product kids 6',
      ),
      Product(
        imagePath: 'assets/images/kids/KProduct7.png',
        name: 'Product kids 7',
        price: 50.0,
        details: 'Details for product kids 7',
      ),
    ],
    'BEAUTY': [
      Product(
        imagePath: 'assets/images/Beauty/BProduct1.png',
        name: 'Product 5',
        price: 50.0,
        details: 'Details for product 5',
      ),
      Product(
        imagePath: 'assets/images/Beauty/BProduct3.png',
        name: 'Product 5',
        price: 50.0,
        details: 'Details for product 5',
      ),
      Product(
        imagePath: 'assets/images/Beauty/BProduct3.png',
        name: 'Product 5',
        price: 50.0,
        details: 'Details for product 5',
      ),
      Product(
        imagePath: 'assets/images/Beauty/BProduct4.png',
        name: 'Product 5',
        price: 50.0,
        details: 'Details for product 5',
      ),
      Product(
        imagePath: 'assets/images/Beauty/BProduct5.png',
        name: 'Product 5',
        price: 50.0,
        details: 'Details for product 5',
      ),
      Product(
        imagePath: 'assets/images/Beauty/BProduct6.png',
        name: 'Product 5',
        price: 50.0,
        details: 'Details for product 5',
      ),
    ],
  };

  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory ?? categorizedProducts.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = categorizedProducts[selectedCategory] ?? [];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Shop Page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishlistPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BagPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const BannerTile(
              imagePaths: [
                'assets/images/Banners/shop_page1.jpg',
                'assets/images/Banners/shop_page2.jpg',
                'assets/images/Banners/shop_page3.jpg',
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 35,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categorizedProducts.keys.length,
                itemBuilder: (BuildContext context, int index) {
                  String category = categorizedProducts.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Ink(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 25,
                          decoration: BoxDecoration(
                            color: selectedCategory == category
                                ? Colors.grey.shade500
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 0.9,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: selectedCategory == category
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(0),
              child: GridView.builder(
                shrinkWrap:
                    true, // Allows GridView to be scrollable within SingleChildScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4.7,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: products.length, // Number of products
                itemBuilder: (context, index) {
                  return ProductTile(
                    imagePath: products[index].imagePath,
                    productName: products[index].name,
                    productPrice: products[index].price,
                    productDetails: products[index].details,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
