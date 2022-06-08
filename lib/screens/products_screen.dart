import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product/products_grid.dart';
import '../providers/products_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart/badge.dart';
import './cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const routName = '/products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (ProductFilter filterType) {
              Provider.of<ProductsProvider>(context, listen: false).setFilter(filterType);
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: ProductFilter.all,
                child: Text('All'),
              ),
              PopupMenuItem(
                value: ProductFilter.favorites,
                child: Text('Favorites'),
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (_, cart, __) => Badge(
              value: cart.itemsCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: const ProductsGrid(),
    );
  }
}
