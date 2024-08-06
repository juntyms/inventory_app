import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/product_model.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection('products')
      .withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product p, _) => p.toFirestore());

  // After adding withCOnverter
  // Add new product
  static Future<void> addProduct(Product product) async {
    await ref.doc(product.id).set(product);

    // try {
    //   print('Attempting to add product: ${product.id}');
    //   await ref.doc(product.id).set(product);
    //   print('Product added successfully: ${product.id}');
    // } catch (e) {
    //   print('Error adding product to Firestore: $e');
    //   rethrow; // Rethrow if you want to handle it further up the call stack
    // }
  }

  // get all products

  //update product

  //delete product
}
