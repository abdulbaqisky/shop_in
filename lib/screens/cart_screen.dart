import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_in/providers/cart.dart' show Cart;
import 'package:shop_in/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount}',
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.headline1!.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                TextButton(
                  child: const Text('ORDER NOW'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItem(
              cart.items.values.toList()[i].id,
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
            ),
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
