import 'package:flutter/material.dart';
import 'package:ecommerace_app/models/product.dart';

class WishlistManager with ChangeNotifier {
  final List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  void addItem(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.any((item) => item.name == product.name);
  }
}
