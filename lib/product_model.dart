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
}
