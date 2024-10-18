import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/order_history.dart';


void showThankYouDialog(BuildContext context, String foodName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thank You!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Thank you for your order!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'You have purchased: $foodName',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your order queue is:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'We will notify you shortly after your order is ready.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Navigate to Order History Screen with the recent order
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderHistoryScreen(
                    orders: [foodName], // Pass the recent order here
                  ),
                ),
              );
            },
            child: const Text('Go to order history'),
          ),
        ],
      );
    },
  );
}
