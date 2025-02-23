class Item {
  final String id;
  final String name;
  final String description;
  final double price;
  final String categoryId;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    re,
  });

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      id: data['id'] ?? '',
      name: data['name'] ?? 'Unnamed Item',
      description: data['description'] ?? 'No description available',
      price: data['price'],
      categoryId: data['categoryId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      'description': description,
      "categoryId": categoryId,
      "price": price,
    };
  }
}
