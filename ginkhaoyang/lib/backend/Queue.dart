import 'package:firebase_database/firebase_database.dart';

class Order {
  final String menu;
  final String shop;
  final double price;
  final String orderId;

  Order({
    required this.menu,
    required this.shop,
    required this.price,
    required this.orderId,
  });

  Map<String, dynamic> toMap() {
    return {
      'menu': menu,
      'shop': shop,
      'price': price,
      'orderId': orderId,
    };
  }
}

class Queue {
  late DatabaseReference dbRef;
  List<Map<dynamic, dynamic>> queueList = [];

  Queue({
    List<Order>? orders,
  }) {
    dbRef = FirebaseDatabase.instance.ref().child('queue');

    dbRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      queueList.clear();
      data.forEach((key, value) {
        value['key'] = key;
        queueList.add(value);
      });
      updateQueueNumbers();
    });

    if (orders != null) {
      for (var order in orders) {
        createQueue(order);
      }
    }
  }

  void createQueue(Order order) async {
    await dbRef.push().set(order.toMap());
  }

  void deleteQueue(String key) async {
    await dbRef.child(key).remove();
  }

  void updateQueueNumbers() async {
    for (int i = 0; i < queueList.length; i++) {
      String key = queueList[i]['key'];
      await dbRef.child(key).update({'queueNumber': i + 1});
    }
  }

  Future<int?> searchByOrderId(String orderId) async {
    Query query = dbRef.orderByChild('orderId').equalTo(orderId);
    DataSnapshot snapshot = await query.get();

    if (snapshot.children.isNotEmpty) {
      final value = snapshot.children.first.value as Map<dynamic, dynamic>;
      return value['queueNumber'];
    }

    return null;
  }
}
