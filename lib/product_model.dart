import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.qty,
    required this.image,
    required this.isFav,
  });

  final String id;
  final int categoryId;
  String name;
  int qty;
  String image;
  bool isFav = false;

//Create a map
// product to firestore
  Map<String, dynamic> toFirestore() {
    return {
      'categoryid': categoryId,
      'name': name,
      'qty': qty,
      'image': image,
      'isFav': isFav,
    };
  }

// from firestore
  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    // get data from snapshot
    Product product = Product(
        id: snapshot.id,
        categoryId: data['categoryId'],
        name: data['name'],
        qty: data['qty'],
        image: data['image'],
        isFav: data['isFav']);

    return product;
  }
}
