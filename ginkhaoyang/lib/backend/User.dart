import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queuesystem/backend/Service/firestore_service.dart';

class User {
  String? _uid;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _telephone;
  String? _role;
  Timestamp? _createdAt;

  User(String uid) : _uid = uid;

  String? get uid => _uid;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get telephone => _telephone;
  String? get role => _role;
  Timestamp? get createdAt => _createdAt;

  set firstName(String? value) => _firstName = value;
  set lastName(String? value) => _lastName = value;
  set email(String? value) => _email = value;
  set telephone(String? value) => _telephone = value;
  set role(String? value) => _role = value;
  set createdAt(Timestamp? value) => _createdAt = value;

  Future<void> fetchUserData() async {
    if (_uid == null) {
      throw Exception('not found uid');
    }
    FirestoreService firestoreService = FirestoreService();
    print('Hi am in user');
    Map<String, dynamic>? userData = await firestoreService.getUserData(_uid!);
    if (userData != null) {
       _createdAt = (userData['created_at']);
       _email = userData['email'];
      _firstName = userData['first_Name'];
      _lastName = userData['last_Name'];
      _role = userData['role'];
      _telephone = userData['telephone'];
    } else {
      print('error');
    }
  }
}
