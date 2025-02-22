import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageItemsScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String? _selectedCategoryId;

  void _addItem() async {
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _selectedCategoryId != null) {
      await _firestore.collection("items").add({
        "name": _nameController.text.trim(),
        "price": double.parse(_priceController.text.trim()),
        "categoryId": _selectedCategoryId,
      });
      _nameController.clear();
      _priceController.clear();
    }
  }

  void _deleteItem(String itemId) async {
    await _firestore.collection("items").doc(itemId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Items")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Item Name"),
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: "Item Price"),
                  keyboardType: TextInputType.number,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection("categories").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    var categories = snapshot.data!.docs;
                    return DropdownButton<String>(
                      hint: Text("Select Category"),
                      value: _selectedCategoryId,
                      onChanged: (value) {
                        _selectedCategoryId = value;
                      },
                      items:
                          categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category.id,
                              child: Text(category["name"]),
                            );
                          }).toList(),
                    );
                  },
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _addItem),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("items").snapshots(),
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
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteItem(item.id),
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
