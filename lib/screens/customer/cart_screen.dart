import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  var cartItem = cartProvider.items[index];
                  return ListTile(
                    title: Text(cartItem.item.name),
                    subtitle: Text(
                      "\$${cartItem.item.price} x ${cartItem.quantity}",
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeItem(cartItem.item);
                      },
                    ),
                  );
                },
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter your name";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: "Phone"),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please enter your phone number";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: "Address"),
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter your address";
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Place the order
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Order placed!")),
                        );
                        cartProvider.clearCart();
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Place Order"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
