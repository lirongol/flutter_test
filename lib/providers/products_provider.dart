import 'package:flutter/cupertino.dart';

import '../api/products_data.dart';
import '../models/product_model.dart';

enum ProductFilter {
  all,
  favorites,
}

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> _products = [...productsData];
  ProductFilter _filterType = ProductFilter.all;

  List<ProductModel> get products {
    if (_filterType == ProductFilter.favorites) {
      return _products.where((x) => x.isFavorite).toList();
    } else {
      return [..._products];
    }
  }

  void addProduct(ProductModel newProduct) {
    _products.add(newProduct);
    notifyListeners();
  }

  ProductModel findById(String productId) {
    return _products.firstWhere((x) => x.id == productId);
  }

  void setFavorite(String productId, bool isFavorite) {
    _products.firstWhere((x) => x.id == productId).isFavorite = !isFavorite;
    notifyListeners();
  }

  void setFilter(ProductFilter filterType) {
    _filterType = filterType;
    notifyListeners();
  }
}
