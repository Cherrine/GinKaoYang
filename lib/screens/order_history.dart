import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<String> orders; // List to hold recent orders

  const OrderHistoryScreen({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text('No orders yet.'),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(orders[index]), // Display each order
                );
              },
            ),
    );
  }
}
