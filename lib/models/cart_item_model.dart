import 'item_model.dart';

class CartItem {
  final Item item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}
