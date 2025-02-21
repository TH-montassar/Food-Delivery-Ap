import 'item_model.dart'; // Add this line to import the Item class

class Order {
  final String id;
  final Item item;
  final String name;
  final String phone;
  final String address;
  final String status; // e.g., "Pending", "Confirmed", "Delivered"
  final DateTime timestamp;

  Order({
    required this.id,
    required this.item,
    required this.name,
    required this.phone,
    required this.address,
    required this.status,
    required this.timestamp,
  });

  factory Order.fromMap(Map<String, dynamic> data) {
    return Order(
      id: data["id"],
      item: Item.fromMap(data["item"]),
      name: data["name"],
      phone: data["phone"],
      address: data["address"],
      status: data["status"],
      timestamp: data["timestamp"].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "item": item.toMap(),
      "name": name,
      "phone": phone,
      "address": address,
      "status": status,
      "timestamp": timestamp,
    };
  }
}
