class Item {
  final String id;
  final String name;
  final String categoryId;
  final double price;

  Item({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
  });

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      id: data["id"],
      name: data["name"],
      categoryId: data["categoryId"],
      price: data["price"],
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "categoryId": categoryId, "price": price};
  }
}
