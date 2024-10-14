//ทำมาtest

class Menu {
  // Attributes
  List<String> menuItems;

  // Constructor
  Menu({required this.menuItems});

  // Method to convert Menu object to Firestore compatible format
  Map<String, dynamic> toFirestore() {
    return {
      'menuItems': menuItems,
    };
  }

  // Factory method to create a Menu from Firestore data
  factory Menu.fromFirestore(Map<String, dynamic> data) {
    return Menu(
      menuItems: List<String>.from(data['menuItems'] ?? []),
    );
  }
}
