import 'package:ginkhaoyang/backend/Queue.dart';
import 'package:ginkhaoyang/backend/Service/firestore_service.dart';
import 'package:ginkhaoyang/backend/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  User? customer;
  Queue? queue;
  int? orderId;
  String status;
  String menu;

  FirestoreService firestoreService =
      FirestoreService(); // สร้าง instance ของ FirestoreService

  Order({
    this.customer,
    this.queue,
    this.orderId,
    this.status = 'pending',
    required this.menu,
  });

  // Create order
  Future<void> createOrder(
      String menu, User user, String orderedTime, String additional) async {
    try {
      int nextOrderId = await getNextOrderId();

      if (user == null) {
        print('User is null, cannot create order.');
        return;
      }

      this.orderId = nextOrderId;

      Order order = Order(
        orderId: nextOrderId,
        customer: user,
        status: 'pending',
        menu: menu, // Set the menu here
      );
      await firestoreService.createOrder(order);
      print(orderId);
    } catch (e) {
      print('Failed to create order: $e');
    }
  }

  Future<int> getNextOrderId() async {
    DocumentReference counterRef = firestoreService.orders.doc('counter');

    // Increment the counter in Firestore
    await counterRef
        .set({'count': FieldValue.increment(1)}, SetOptions(merge: true));

    // Get the latest value of the counter
    DocumentSnapshot counterDoc = await counterRef.get();

    // Return the current value of the counter (or 1 if it doesn't exist)
    return (counterDoc.data() as Map<String, dynamic>)['count'] ?? 1;
  }
  // // Create order with Queue (both Firestore and Firebase Realtime Database)
  // Future<void> createOrderWithQueue(Menu menu, User user, String orderedTime, String additional) async {
  //   try {
  //     // สร้างคำสั่งซื้อใน Firestore
  //     Order order = Order(
  //       customer: user,
  //       shop: shop,
  //       queue: queue,
  //       status: 'pending',
  //     );
  //     await firestoreService.createOrder(order);

  //     // สร้างคำสั่งซื้อใน Firebase Realtime Database
  //     await queue.createQueue(order);
  //   } catch (e) {
  //     print('Failed to create order with queue: $e');
  //   }
  // }

  Future<Order?> getOrderById(String orderId) async {
    try {
      // ค้นหาคำสั่งซื้อในคิวตาม orderId ใน Firebase Realtime Database
      int? queueNumber = await queue!.searchByOrderId(orderId as int);
      if (queueNumber != null) {
        print('Order found in queue with number: $queueNumber');

        // สามารถดึงข้อมูลเพิ่มเติมจาก Firestore ได้ (ถ้ามี)
        return await firestoreService.getOrderById(orderId);
      }
    } catch (e) {
      print('Failed to get order by ID: $e');
    }
    return null;
  }

  // Update order status
  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    try {
      // อัปเดตสถานะใน Firebase Realtime Database
      int? queueNumber = await queue!.searchByOrderId(orderId as int);
      if (queueNumber != null) {
        await queue!.dbRef
            .child(queueNumber.toString())
            .update({'status': newStatus});
      }

      // อัปเดตสถานะใน Firestore
      await firestoreService.updateOrder(orderId, {'status': newStatus});
    } catch (e) {
      print('Failed to update order status: $e');
    }
  }

  // Delete order
  Future<void> deleteOrder(String orderId) async {
    try {
      await firestoreService.deleteOrder(orderId);
    } catch (e) {
      print('Failed to delete order: $e');
    }
  }

  // กำหนดเมธอด fromFirestore ที่นี่
  static Order fromFirestore(Map<String, dynamic> data) {
    // สร้างอ็อบเจ็กต์ User จากข้อมูลที่ดึงมา
    User user = User(data['customer']['uid'])
      ..firstName = data['customer']['first_name'] ?? ''
      ..lastName = data['customer']['last_name'] ?? '';
    //..email = data['customer']['email'] ?? ''
    //..telephone = data['customer']['telephone'] ?? ''
    //..role = data['customer']['role'] ??
    //..createdAt = data['customer']['createdAt'] ?? Timestamp.now()
    return Order(
      orderId: data['order_id'],
      customer: user, //user
      status: data['status'],
      menu: data['menu'],
    );
  }

  // Convert Order object to Firestore-compatible format
  Map<String, dynamic> toFirestore() {
    return {
      'orderId': orderId,
      'customer': {
        'first_name': customer?.firstName,
        'last_name': customer?.lastName,
      },
      'status': status,
      'menu': menu, // Add this line
    };
  }

  Map<String, int?> toMap() {
    return {
      'orderId': orderId,
    };
  }

  String get orderDetails {
    return 'Order ID: $orderId\nCustomer: ${customer?.firstName} ${customer?.lastName}\nStatus: $status';
  }
}
