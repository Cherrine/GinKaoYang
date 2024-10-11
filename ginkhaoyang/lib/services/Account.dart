class Account {
  String password;
  Role role;

  Account({
    required this.password,
    required this.role,
  });

  // Method to convert Account to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'password': password,  // It's recommended to hash passwords for security.
      'role': role.toString(),
    };
  }
}

enum Role { customer, shopkeeper }
