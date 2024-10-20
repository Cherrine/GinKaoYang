import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ginkhaoyang/backend/Service/firebase_auth_service.dart';
import 'package:ginkhaoyang/backend/Service/firestore_service.dart';

class Account {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();

  Future<String?> login(String email, String password) async {
    String? uid = await _firebaseAuthService.signIn(email, password);
    if (uid == null) {
      return null;
    }
    return uid;
  }

  Future<int> register(
      String email,
      String password,
      String firstName,
      String lastName,
      String phone,
      bool isMerchant,
      Timestamp createdAt) async {
    String? uid = await _firebaseAuthService.signUp(email, password);

    if (uid != null) {
      await _firestoreService.createUser(
        uid,
        firstName,
        lastName,
        email,
        phone,
        isMerchant,
        createdAt,
      );
      return 0;
    }

    return 1;
  }
}
