import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ["Pizza", "Plats", "Drinks"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Delivery")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              // Navigate to the category screen
            },
          );
        },
      ),
    );
  }
}
