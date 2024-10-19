import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/menu_items.dart' as menu_items;
import 'package:ginkhaoyang/utils/app_styles.dart';
import 'package:intl/intl.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<String>? orders;

  const OrderHistoryScreen({Key? key, this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History', style: montserratStyle.copyWith(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
      ),
      body: orders == null || orders!.isEmpty
          ? Center(
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
            )
          : ListView.builder(
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                final orderName = orders![index];
                final menuItem = menu_items.popularItems.firstWhere(
                  (item) => item['title'] == orderName,
                  orElse: () => {'title': orderName, 'price': 'N/A', 'image': 'assets/images/placeholder.jpg'},
                );
                final orderTime = DateTime.now().subtract(Duration(minutes: index * 10));

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(menuItem['image']),
                    ),
                    title: Text(orderName, style: montserratStyle.copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Ordered on ${DateFormat('MMM d, yyyy HH:mm').format(orderTime)}',
                      style: montserratStyle.copyWith(color: Colors.grey[600]),
                    ),
                    trailing: Text(
                      menuItem['price'],
                      style: montserratStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                );
              },
            ),
    );
  }
}