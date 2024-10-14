//ทำมาtest

class User {
  String name;
  String email;

  User({
    required this.name,
    required this.email,
  });

  // Factory constructor to create a User from Firestore data
  factory User.fromFirestore(Map<String, dynamic> data) {
    return User(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }

  // Convert User object to Firestore compatible map (optional)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
    };
  }
}