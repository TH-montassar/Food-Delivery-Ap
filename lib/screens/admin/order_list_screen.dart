import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderListScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _updateOrderStatus(String orderId, String status) async {
    await _firestore.collection("orders").doc(orderId).update({
      "status": status,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("orders").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var orders = snapshot.data!.docs;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index];
              return ListTile(
                title: Text(order["name"]),
                subtitle: Text("Status: ${order["status"]}"),
                trailing: DropdownButton<String>(
                  value: order["status"],
                  onChanged: (value) {
                    _updateOrderStatus(order.id, value!);
                  },
                  items:
                      ["Pending", "Confirmed", "Delivered"].map((status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
