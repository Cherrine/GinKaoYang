import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ginkhaoyang/backend/Queue.dart';
import 'package:ginkhaoyang/backend/Service/firestore_service.dart';
import 'package:ginkhaoyang/backend/User.dart';
import 'package:ginkhaoyang/backend/Order.dart' as myOrder;

class OrderData {
  final String? orderId;
  final String menu;
  final int? queueNumber;

  OrderData({
    required this.orderId,
    required this.menu,
    this.queueNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'menu': menu,
      'queueNumber': queueNumber,
    };
  }
}

class Allorder {
  final FirestoreService _firestoreService = FirestoreService();
  final Queue queue = Queue();

  Future<List<OrderData>> getAllorder(User user) async {
    List<OrderData> ordersList = [];
    print('Fetching order history...');

    try {
      QuerySnapshot querySnapshot = await _firestoreService.orders
          .where('customer.first_name', isEqualTo: user.firstName)
          .where('customer.last_name', isEqualTo: user.lastName)
          .get();

      print('Documents retrieved: ${querySnapshot.docs.length}');

      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String? orderId =
            data['orderId']?.toString();

        if (orderId != null) {
          int queueNumber = await queue.searchByOrderId(
              int.tryParse(orderId) ?? 0);
          ordersList.add(OrderData(
            orderId: orderId,
            menu: data['menu'],
            queueNumber: queueNumber,
          ));
        } else {
          print("Error: Invalid orderId");
        }
      }

      for (var order in ordersList) {
        print(
            'Order ID: ${order.orderId}, Menu: ${order.menu}, Queue Number: ${order.queueNumber}');
      }
    } catch (e) {
      print("Error fetching orders: $e");
    }
    return ordersList;
  }
}