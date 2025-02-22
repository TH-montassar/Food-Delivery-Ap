import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageRestaurantsScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  void _addRestaurant() async {
    if (_nameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      await _firestore.collection("restaurants").add({
        "name": _nameController.text.trim(),
        "address": _addressController.text.trim(),
        "phone": _phoneController.text.trim(),
      });
      _nameController.clear();
      _addressController.clear();
      _phoneController.clear();
    }
  }

  void _deleteRestaurant(String restaurantId) async {
    await _firestore.collection("restaurants").doc(restaurantId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Restaurants")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Restaurant Name"),
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: "Address"),
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: "Phone"),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _addRestaurant),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("restaurants").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var restaurants = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = restaurants[index];
                    return ListTile(
                      title: Text(restaurant["name"]),
                      subtitle: Text(restaurant["address"]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteRestaurant(restaurant.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
