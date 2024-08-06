import 'package:flutter/material.dart';
import 'package:inventory_app/firestore_service.dart';
import 'package:inventory_app/product_model.dart';

class ProductStore extends ChangeNotifier {
  //Paste the dummy product from inventory_data
  final List<Product> _products = [];
  // delete the data when fetching the products

  get products => _products;

  List<Product> getProductsByCategory(int categoryId) {
    return products
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  // Add Product then edit the product view create product that pass the value here
  void addProduct(Product product) async {
    // Add this only after adding the add product from firestore_service
    await FirestoreService.addProduct(product);

    _products.add(product);
    notifyListeners(); // to update the builders
  }

  // fetch products
  void fetchProductsOnce() async {
    if (products.length == 0) {
      final snapshot = await FirestoreService.getProductsOnces();

      for (var doc in snapshot.docs) {
        _products.add(doc.data());
      }
      notifyListeners();
    }
  }

  // Update Product
  Future<void> updateProduct(Product product) async {
    await FirestoreService.updateProduct(product);

    notifyListeners();
  }

  // Delete product
  void deleteProduct(Product product) async {
    await FirestoreService.deleteProduct(product);

    _products.remove(product);

    notifyListeners();
  }
}
