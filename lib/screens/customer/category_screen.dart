import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/customer/order_screen.dart';

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
              return ListTile(
                title: Text(item["name"]),
                subtitle: Text("\$${item["price"]}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(itemId: item.id),
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
