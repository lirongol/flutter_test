import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './router/index.dart';
import './theme/index.dart';
import './providers/cart_provider.dart';
import './screens/products_screen.dart';
import './providers/products_provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // test
//   test 2
// test 3
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: theme(),
        initialRoute: ProductsScreen.routName,
        routes: routes(),
      ),
    );
  }
}
