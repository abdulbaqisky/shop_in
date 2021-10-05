import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;

  CartItem(this.id, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(child: Text('\$$price'))),
          ),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('\$$quantity x'),
        ),
      ),
    );
  }
}