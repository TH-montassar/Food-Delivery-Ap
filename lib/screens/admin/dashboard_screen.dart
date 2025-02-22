import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/screens/auth_wrapper.dart';
import 'manage_categories_screen.dart';
import 'manage_items_screen.dart';
import 'manage_restaurants_screen.dart';
import 'order_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthWrapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text("Manage Categories"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageCategoriesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Manage Items"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageItemsScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Manage Restaurants"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageRestaurantsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("View Orders"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
