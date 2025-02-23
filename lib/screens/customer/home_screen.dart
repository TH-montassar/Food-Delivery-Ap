import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/screens/customer/category_screen.dart';
import 'package:food_delivery_app/screens/customer/cart_screen.dart';
import 'package:food_delivery_app/models/category_model.dart'; // Import the Category model

class HomeScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Delivery App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for food...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Choose Category Section
              Text(
                "Choose Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildCategoryGrid(),
            ],
          ),
        ),
      ),
    );
  }

  // Build the category grid
  Widget _buildCategoryGrid() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("categories").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var categories = snapshot.data!.docs;
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var category = categories[index];
            var categoryData = category.data() as Map<String, dynamic>?;

            // Create a Category object
            var categoryModel = Category.fromMap({
              "id": category.id,
              "name": categoryData?['name'] ?? 'Unnamed Category',
              "image": categoryData?['image'] ?? '', // Handle null image
            });

            return GestureDetector(
              onTap: () {
                // Navigate to the category screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => CategoryScreen(categoryId: category.id),
                  ),
                );
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display the category image
                    if (categoryModel.image.isNotEmpty)
                      Image.network(
                        categoryModel.image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(height: 8),
                    Text(categoryModel.name, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
