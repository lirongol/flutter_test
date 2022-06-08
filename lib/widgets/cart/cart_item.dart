import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../models/cart_item_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({required this.item, required this.productId, Key? key}) : super(key: key);

  final CartItemModel item;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (dir) {
        Provider.of<CartProvider>(context, listen: false).removeFromCart(productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 25),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.black,
            maxRadius: 30,
            child: FittedBox(
              child: Text('\$${item.price}'),
            ),
          ),
          title: Text(item.title),
          subtitle: Text('Total: \$${(item.price * item.quantity).toStringAsFixed(2)}'),
          trailing: Text('${item.quantity} X'),
        ),
      ),
    );
  }
}
