//ทำมาtest

class Shop {
  String shopName;
  String location;

  Shop({
    required this.shopName,
    required this.location,
  });

  // Factory constructor to create a Shop from Firestore data
  factory Shop.fromFirestore(Map<String, dynamic> data) {
    return Shop(
      shopName: data['shopName'] ?? '',
      location: data['location'] ?? '',
    );
  }

  // Convert Shop object to Firestore compatible map (optional)
  Map<String, dynamic> toFirestore() {
    return {
      'shopName': shopName,
      'location': location,
    };
  }
}