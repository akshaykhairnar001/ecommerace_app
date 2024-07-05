class BagManager {
  static final BagManager _instance = BagManager._internal();

  factory BagManager() {
    return _instance;
  }

  BagManager._internal();

  List<Map<String, dynamic>> bagItems = [];

  void addItem(Map<String, dynamic> item) {
    // Add default quantity and size to item
    item['quantity'] = item['quantity'] ?? 1; // default quantity
    item['size'] = item['size'] ?? 'M'; // default size
    bagItems.add(item);
  }

  void updateItem(int index, Map<String, dynamic> newItem) {
    bagItems[index] = newItem;
  }

  void removeItem(int index) {
    bagItems.removeAt(index);
  }

  double getTotalPrice() {
    return bagItems.fold(
        0, (total, item) => total + (item['productPrice'] * item['quantity']));
  }
}
