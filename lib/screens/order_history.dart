import 'package:flutter/material.dart';
import 'package:ginkhaoyang/backend/AllOrder.dart';
import 'package:ginkhaoyang/backend/User.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';

class OrderHistoryScreen extends StatelessWidget {
  final User user;

  const OrderHistoryScreen({Key? key, required this.user}) : super(key: key);

  Future<List<OrderData>> fetchOrders() async {
    Allorder allOrder = Allorder();
    List<OrderData> orders = await allOrder.getAllorder(user);
    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History', style: montserratStyle.copyWith(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<OrderData>>(
        future: fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No orders yet',
                    style: montserratStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your order history will appear here',
                    style: montserratStyle.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/placeholder.jpg'),
                    ),
                    title: Text(order.menu, style: montserratStyle.copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Order ID: ${order.orderId}, Queue: ${order.queueNumber ?? 'N/A'}',
                      style: montserratStyle.copyWith(color: Colors.grey[600]),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}