import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/thank_you_screen.dart';

void showPurchaseDialog(BuildContext context, String foodName, String price, Function addOrder) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Purchase $foodName'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Text('Do you want to purchase $foodName?'),
            const SizedBox(height: 8),
            Text('Price: $price'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the purchase dialog
              addOrder(foodName); // Add the food item to recent orders
              // Show thank you dialog
              showThankYouDialog(context, foodName);
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
