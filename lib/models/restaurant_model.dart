class Restaurant {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String imageUrl; // Optional: URL for restaurant image

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    this.imageUrl = "",
  });

  factory Restaurant.fromMap(Map<String, dynamic> data) {
    return Restaurant(
      id: data["id"],
      name: data["name"],
      address: data["address"],
      phone: data["phone"],
      imageUrl: data["imageUrl"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "phone": phone,
      "imageUrl": imageUrl,
    };
  }
}
