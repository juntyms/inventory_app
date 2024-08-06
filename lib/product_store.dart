import 'package:flutter/material.dart';
import 'package:inventory_app/firestore_service.dart';
import 'package:inventory_app/product_model.dart';

class ProductStore extends ChangeNotifier {
  //Paste the dummy product from inventory_data
  final List<Product> _products = [
    Product(
        id: '1',
        categoryId: 1,
        name: 'Brand New Samsung Galaxy Z Fold6',
        qty: 10,
        image: 'products/zfold6.png',
        isFav: false),
    Product(
        id: '2',
        categoryId: 1,
        name: 'Samsung Galaxy Flip6',
        qty: 10,
        image: 'products/flip6.png',
        isFav: false),
    Product(
        id: '3',
        categoryId: 1,
        name: 'Samsung Galaxy M35',
        qty: 10,
        image: 'products/m35.png',
        isFav: false),
    Product(
        id: '4',
        categoryId: 1,
        name: 'Samsung Galaxy F55',
        qty: 10,
        image: 'products/f55.png',
        isFav: false),
    Product(
        id: '5',
        categoryId: 1,
        name: 'Samsung Galaxy C55',
        qty: 10,
        image: 'products/c55.png',
        isFav: false),
    Product(
        id: '6',
        categoryId: 1,
        name: 'Samsung Galaxy M55',
        qty: 10,
        image: 'products/m55.png',
        isFav: false),
    Product(
        id: '7',
        categoryId: 2,
        name: 'Magic Bullet Blender, Small, Silver, 11 Piece Set',
        qty: 10,
        image: 'products/appliance1.png',
        isFav: false),
    Product(
        id: '8',
        categoryId: 2,
        name:
            'OVENTE Electric Sandwich Maker with Non-Stick Plates, Indicator Lights, Cool Touch Handle, Easy to Clean',
        qty: 10,
        image: 'products/appliance2.png',
        isFav: false),
    Product(
        id: '9',
        categoryId: 2,
        name: 'Vobaga Mug Warmer for Coffee',
        qty: 10,
        image: 'products/appliance3.png',
        isFav: false),
    Product(
        id: '10',
        categoryId: 3,
        name: 'Under Armor Mens Tech 2.0 Short Sleeve',
        qty: 10,
        image: 'products/sport1.png',
        isFav: false),
    Product(
        id: '11',
        categoryId: 3,
        name:
            'Blisset 3 Pack High Waisted Leggings for Women-Soft Athletic Tummy Control Pants for Running Yoga Workout Reg & Plus Size',
        qty: 10,
        image: 'products/sport2.png',
        isFav: false),
    Product(
        id: '12',
        categoryId: 3,
        name:
            'Workout Shirts for Men Short Sleeve Quick Dry Athletic Gym Active T Shirt Moisture Wicking',
        qty: 10,
        image: 'products/sport3.png',
        isFav: false),
    Product(
        id: '13',
        categoryId: 6,
        name: 'Polo Ralph Lauren Train 89',
        qty: 10,
        image: 'products/shoes1.png',
        isFav: false),
    Product(
        id: '14',
        categoryId: 6,
        name: 'Skechers Mens Stamina Cutback Oxford',
        qty: 10,
        image: 'products/shoes2.png',
        isFav: false),
  ];

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
    // try {
    //   await FirestoreService.addProduct(product);
    //   _products.add(product);
    //   notifyListeners(); // to update the builders
    // } catch (e) {
    //   print('Error adding product: $e');
    //   // Handle any errors here (e.g., show a user-friendly message)
    // }

    _products.add(product);
    notifyListeners(); // to update the builders
  }
}
