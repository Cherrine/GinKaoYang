class Menu {
  final String id;
  final String title;
  final String description; // Optional field for more details
  final String imageUrl; // Optional field for an image URL

  Menu({
    required this.id,
    required this.title,
    this.description = '',
    this.imageUrl = '',
  });

  // Factory method to create a Menu from a Map (e.g., from Firestore)
  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] ?? '', // Assuming id is stored as 'id' in Firestore
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  // Convert a Menu object to a Map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
