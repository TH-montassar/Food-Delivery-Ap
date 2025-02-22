import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageCategoriesScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _nameController = TextEditingController();

  void _addCategory() async {
    if (_nameController.text.isNotEmpty) {
      await _firestore.collection("categories").add({
        "name": _nameController.text.trim(),
      });
      _nameController.clear();
    }
  }

  void _deleteCategory(String categoryId) async {
    await _firestore.collection("categories").doc(categoryId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Categories")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Category Name"),
                  ),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _addCategory),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("categories").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var categories = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    var category = categories[index];
                    return ListTile(
                      title: Text(category["name"]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteCategory(category.id),
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
