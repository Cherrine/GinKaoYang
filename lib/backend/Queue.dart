import 'package:firebase_database/firebase_database.dart';
import 'package:ginkhaoyang/backend/Order.dart';

class Queue {
  late DatabaseReference dbRef;
  late int queunum;
  List<Map<dynamic, dynamic>> queueList = [];

  Queue() {
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
  }

  Future<void> createQueue(Order order) async {
    try {
      await dbRef.push().set(order.toMap());
      updateQueueNumbers();
      print('Queue created successfully');
    } catch (e) {
      print('Failed to create queue: $e');
    }
  }

  void deleteQueue(String key) async {
    await dbRef.child(key).remove();
  }

  Future<void> updateQueueNumbers() async {
    for (int i = 0; i < queueList.length; i++) {
      String key = queueList[i]['key'];
      await dbRef.child(key).update({'queueNumber': i + 1});
    }
  }

  Future<int> searchByOrderId(int orderId) async {
    updateQueueNumbers();
    Query query = dbRef.orderByChild('orderId').equalTo(orderId);
    DataSnapshot snapshot = await query.get();

    if (snapshot.children.isNotEmpty) {
      final value = snapshot.children.first.value as Map<dynamic, dynamic>;
      return value['queueNumber'];
    }
    return -1;
  }

  // void printQueueData() {
  //   for (var entry in queueList) {
  //     print(
  //         'Order ID: ${entry['orderId']}, Queue Number: ${entry['queueNumber']}');
  //   }
  // }
}
