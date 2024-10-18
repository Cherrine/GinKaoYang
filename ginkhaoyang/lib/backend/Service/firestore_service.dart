import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection('User');

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
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    DocumentSnapshot doc = await users.doc(uid).get();
    return doc.exists ? doc.data() as Map<String, dynamic> : null;
  }
}
