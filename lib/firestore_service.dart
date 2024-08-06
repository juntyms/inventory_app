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
  }

  // get all products
  static Future<QuerySnapshot<Product>> getProductsOnces() {
    return ref.get();
  }

  //update product
  static Future<void> updateProduct(Product product) async {
    await ref.doc(product.id).update({
      'name': product.name,
      'qty': product.qty,
    });
  }

  //delete product
  static Future<void> deleteProduct(Product product) async {
    await ref.doc(product.id).delete();
  }
}
