import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/customer/item_details_screen.dart';
import 'package:food_delivery_app/models/item_model.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CategoryScreen({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category")),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            _firestore
                .collection("items")
                .where("categoryId", isEqualTo: categoryId)
                .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var items = snapshot.data!.docs;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              var itemData =
                  item.data() as Map<String, dynamic>?; // Define itemData here
              // Handle null values
              var name = itemData?['name'] ?? 'Unnamed Item';
              var price = itemData?['price']?.toString() ?? '0.00';

              return ListTile(
                title: Text(item["name"]),
                subtitle: Text("\$${item["price"]}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ItemDetailsScreen(
                            item: Item.fromMap(
                              item.data() as Map<String, dynamic>,
                            ),
                          ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
