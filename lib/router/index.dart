import 'package:flutter/cupertino.dart';

import '../screens/cart_screen.dart';
import '../screens/products_screen.dart';
import '../screens/product_details_screen.dart';

Map<String, Widget Function(BuildContext context)> routes() {
  return {
    ProductsScreen.routName: (_) => const ProductsScreen(),
    ProductDetailsScreen.routeName: (_) => const ProductDetailsScreen(),
    CartScreen.routeName: (_) => const CartScreen(),
  };
}
