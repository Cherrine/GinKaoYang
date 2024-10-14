import 'Order.dart';

class AllOrder {
  // Attributes
  int amountOrder;          // จำนวนคำสั่งซื้อทั้งหมด
  List<Order> allOrders;    // ลิสต์ของคำสั่งซื้อทั้งหมด

  // Constructor
  AllOrder({
    required this.amountOrder,
    required this.allOrders,
  });

  // Method to add a new order
  void addOrder(Order order) {
    allOrders.add(order);   // เพิ่มคำสั่งซื้อเข้าไปในลิสต์
    amountOrder = allOrders.length;   // อัพเดทจำนวนคำสั่งซื้อทั้งหมด
  }

  // Method to get all orders (optional)
  List<Order> getAllOrders() {
    return allOrders;
  }

  // Factory method to create an AllOrder object from Firestore data (optional)
  factory AllOrder.fromFirestore(Map<String, dynamic> data) {
    // Assuming each order in the list is a Firestore document and can be mapped using Order.fromFirestore
    List<Order> orders = (data['orders'] as List<dynamic>)
        .map((orderData) => Order.fromFirestore(orderData as Map<String, dynamic>))
        .toList();

    return AllOrder(
      amountOrder: data['amountOrder'] ?? 0,
      allOrders: orders,
    );
  }

  // Method to convert AllOrder object to Firestore compatible map (optional)
  Map<String, dynamic> toFirestore() {
    return {
      'amountOrder': amountOrder,
      'orders': allOrders.map((order) => order.toFirestore()).toList(),
    };
  }
}