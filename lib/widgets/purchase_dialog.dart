import 'package:flutter/material.dart';

void showPurchaseDialog(BuildContext context, String title, String description, String price) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Purchase $title'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Makes the column take minimum height
          children: [
            const SizedBox(height: 8), // Space at the top (removed image)
            Text(description), // Shows the description
            const SizedBox(height: 8), // Spacing between the description and price
            Text('Price: $price'), // Shows the price
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add your purchase logic here
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Confirm Purchase'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
