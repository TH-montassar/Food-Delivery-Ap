class Category {
  final String id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
      id: data["id"],
      name: data["name"],
      image: data["image"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "image": image};
  }
}
