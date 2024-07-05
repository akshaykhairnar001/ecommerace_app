import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String zipcode;
  final VoidCallback onEdit;

  const AddressCard({
    super.key,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              addressLine1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (addressLine2.isNotEmpty)
              Text(
                addressLine2,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            Text(
              '$city, $state, $zipcode',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onEdit,
                  child: const Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
