import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/item_model.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;

  ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              "\$${item.price}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addItem(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item.name} added to cart")),
                );
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
