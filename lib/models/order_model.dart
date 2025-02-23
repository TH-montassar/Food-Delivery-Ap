import 'package:food_delivery_app/models/cart_item_model.dart';

import 'item_model.dart'; // Add this line to import the Item class

class Order {
  final String id;
  final List<CartItem> items;
  final String name;
  final String phone;
  final String address;
  final String status; // e.g., "Pending", "Confirmed", "Delivered"
  final DateTime timestamp;

  Order({
    required this.id,
    required this.items,
    required this.name,
    required this.phone,
    required this.address,
    required this.status,
    required this.timestamp,
  });

  factory Order.fromMap(Map<String, dynamic> data) {
    return Order(
      id: data["id"],
      items:
          (data['items'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  item: Item.fromMap(item['item']),
                  quantity: item['quantity'],
                ),
              )
              .toList(),
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
      'items':
          items
              .map(
                (item) => {
                  'item': item.item.toMap(),
                  'quantity': item.quantity,
                },
              )
              .toList(),
      "name": name,
      "phone": phone,
      "address": address,
      "status": status,
      "timestamp": timestamp,
    };
  }
}
