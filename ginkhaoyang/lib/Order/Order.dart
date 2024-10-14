import 'Menu.dart';
import 'User.dart';
import '../shop.dart';
import 'Queue.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  // Attributes
  User customer;
  Shop shop;
  Queue queue;
  String status;


  // Constructor
  Order({required this.customer, required this.shop, required this.queue, required this.status});
  // Set user for the order
  void setUser(User user) {
    this.customer = user;
  }

  // Create order
Future<void> createOrder(Menu menu, User user, String orderedTime, String additional) async {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  try {
    // Create a new order document with the provided details
    await orders.add({
      'menu': menu.toFirestore(),  // Convert Menu object to Firestore compatible format
      'user': user.toFirestore(),  // Convert User object to Firestore compatible format
      'orderedTime': orderedTime,
      'additional': additional,
      'status': 'pending',  // Set default status as 'pending'
    });

    print('Order created successfully!');
  } catch (e) {
    print('Failed to create order: $e');
    // Optionally, rethrow the error or handle it as needed
  }
}
  // Get payment status
  String getPaymentStatus() {
    // ไม่ทำpayment
    return status;
  }

  // Set payment status
  void setPaymentStatus(String newStatus) {
    // ไม่ทำpayment
    status = newStatus;
  }

  // Get order status
  String getStatus() {
    return status;
  }

  // Set order status
  void setStatus(String newStatus) {
    status = newStatus;
  }

  // Get order object
  Order getOrder() {
    return this;
  }

  // Factory method to create an Order from Firestore data
  factory Order.fromFirestore(Map<String, dynamic> data) {
  return Order(
    customer: User.fromFirestore(data['customer']),  // .fromFirestore สามารถใช้ได้เมื่อคลาส User มีฟังก์ชันนี้
    shop: Shop.fromFirestore(data['shop']),          // คล้ายกันกับ Shop
    queue: Queue.fromFirestore(data['queue']),       // คล้ายกันกับ Queue
    status: data['status'] ?? 'unknown',
  );
}

  // Method to convert an Order object to Firestore-compatible format (optional)

   Map<String, dynamic> toFirestore() {
    return {
      'customer': {
        'name': customer.name,
        'email': customer.email,
      },
      'shop': {
        'shopName': shop.shopName,
        'location': shop.location,
      },
      'queue': {
        'queueNumber': queue.queueNumber,
        'queueStatus': queue.queueStatus,
      },
      'status': status,
    };
  }
}


