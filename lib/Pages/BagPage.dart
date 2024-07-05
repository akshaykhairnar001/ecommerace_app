import 'package:flutter/material.dart';
import 'package:ecommerace_app/Components/bag_manager.dart';
import 'package:ecommerace_app/Components/my_button.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  List<Map<String, dynamic>> bagItems = [];

  @override
  void initState() {
    super.initState();
    bagItems = BagManager().bagItems;
  }

  void _removeItem(int index) {
    setState(() {
      BagManager().removeItem(index);
      bagItems = BagManager().bagItems;
    });
  }

  void _updateItem(int index, Map<String, dynamic> newItem) {
    setState(() {
      BagManager().updateItem(index, newItem);
      bagItems = BagManager().bagItems;
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      var item = bagItems[index];
      item['quantity'] = newQuantity;
      _updateItem(index, item);
    }
  }

  void _updateSize(int index, String newSize) {
    var item = bagItems[index];
    item['size'] = newSize;
    _updateItem(index, item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Bag'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bagItems.length,
              itemBuilder: (context, index) {
                final item = bagItems[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 50, // Set the desired width
                            height: 70, // Set the desired height
                            child: Image.asset(item['imagePath']),
                          ),
                        ),
                        title: Text(item['productName']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'MRP ₹${item['productPrice'].toStringAsFixed(2)}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Qty:'),
                                _QuantitySelector(
                                  quantity: item['quantity'],
                                  onQuantityChanged: (newQuantity) {
                                    _updateQuantity(index, newQuantity);
                                  },
                                ),
                                Text('Size: '),
                                DropdownButton<String>(
                                  value: item['size'],
                                  items: ['S', 'M', 'L', 'XL']
                                      .map((size) => DropdownMenuItem<String>(
                                            value: size,
                                            child: Text(size),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      _updateSize(index, value);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Container(
                          padding: EdgeInsets.only(left: 2),
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              size: 26,
                            ),
                            onPressed: () => _removeItem(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ₹${BagManager().getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                MyButton(
                  text: 'Checkout',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const _QuantitySelector({
    Key? key,
    required this.quantity,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove,
            size: 18,
          ),
          onPressed: () {
            if (quantity > 1) {
              onQuantityChanged(quantity - 1);
            }
          },
        ),
        Text(
          '$quantity',
          style: const TextStyle(fontSize: 14),
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            size: 18,
          ),
          onPressed: () {
            onQuantityChanged(quantity + 1);
          },
        ),
      ],
    );
  }
}
