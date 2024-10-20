import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:ginkhaoyang/backend/Order.dart' as myOrder; // import Order model

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection('User');
  final CollectionReference orders = FirebaseFirestore.instance.collection('Order'); // แก้จาก order เป็น orders เพื่อให้สอดคล้องกัน
  FirebaseFirestore get firestore => FirebaseFirestore.instance;


  Future<void> createUser(String uid, String firstName, String lastName, String email, String phone, bool isMerchant, Timestamp createdAt) async {
    await users.doc(uid).set({
      'first_Name': firstName,
      'last_Name': lastName,
      'email': email,
      'telephone': phone,
      'role': isMerchant ? 'merchant' : 'customer',
      'created_at': createdAt,
    });
  }

  // Get user data by UID
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    DocumentSnapshot doc = await users.doc(uid).get();
    return doc.exists ? doc.data() as Map<String, dynamic> : null;
  }

  // Create a new order in Firestore
  Future<void> createOrder(myOrder.Order order) async {
    await orders.add(order.toFirestore());  // ใช้ method toFirestore() จาก Order model
  }

  // Get order data by Order ID
  Future<myOrder.Order?> getOrderById(String orderId) async {
    DocumentSnapshot doc = await orders.doc(orderId).get();
    if (doc.exists) {
      return myOrder.Order.fromFirestore(doc.data() as Map<String, dynamic>);  // ใช้ fromFirestore() เพื่อแปลงข้อมูลจาก Firestore กลับมาเป็น Order object
    }
    return null;
  }

   // Get all orders
  Future<List<myOrder.Order>> getAllOrders() async {
    try {
      QuerySnapshot snapshot = await orders.get();
      return snapshot.docs
          .map((doc) => myOrder.Order.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Failed to fetch orders: $e');
      return [];
    }
  }

  // Update an existing order in Firestore
  Future<void> updateOrder(String orderId, Map<String, dynamic> updatedData) async {
    await orders.doc(orderId).update(updatedData);  // อัปเดตข้อมูลในเอกสารของ Order ที่เจาะจงด้วย orderId
  }

  // Delete an order from Firestore
  Future<void> deleteOrder(String orderId) async {
    await orders.doc(orderId).delete();  // ลบเอกสาร Order ตาม orderId
  }
}