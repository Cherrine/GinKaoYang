import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ginkhaoyang/backend/Menu.dart';
import 'package:ginkhaoyang/backend/Order.dart' as myOrder;
import 'package:ginkhaoyang/backend/Queue.dart';
import 'package:ginkhaoyang/backend/User.dart';
import 'package:ginkhaoyang/screens/thank_you_screen.dart';

void showPurchaseDialog(BuildContext context, String foodName, String price,
    User currentuser, Function createOrder) {
  Queue newQueue = Queue();
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
            onPressed: () async {
              try {
                Timestamp timestamp = Timestamp.now();
                //Menu menu = Menu.fromSingleItem(foodName);
                myOrder.Order order =
                    myOrder.Order(customer: currentuser, menu: foodName);

                await order.createOrder(
                    foodName, currentuser, timestamp.toString(), '');
                print(order.orderId);

                await newQueue.createQueue(order);
                await newQueue.updateQueueNumbers();
                //newQueue.searchByOrderId(order.orderId.toString())
                Navigator.of(context).pop();
                showThankYouDialog(
                    context, foodName, order.orderId!, currentuser);
              } catch (e) {
                print('Error: $e');
              }
            },
            child: const Text('Confirm Purchase'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
