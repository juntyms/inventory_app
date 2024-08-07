import 'package:flutter/material.dart';
import 'package:inventory_app/category_model.dart';
import 'package:inventory_app/product_create.dart';
//import 'package:inventory_app/inventory_data.dart';
//import 'package:inventory_app/product_model.dart';
import 'package:inventory_app/product_single_view.dart';
import 'package:inventory_app/product_store.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductView extends StatefulWidget {
  const ProductView({required this.category, super.key});

  final Category category;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    //  final categoryProducts = getProductsByCategory(widget.category.id); // Comment this out when adding builder transfer it in body
    final int categoryId = widget.category.id;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.category.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductCreate(categoryId: categoryId)),
          );
        },
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add),
      ),
      body: Consumer<ProductStore>(builder: (context, value, child) {
        final categoryProducts =
            value.getProductsByCategory(widget.category.id);
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: 3 / 2,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            final product = categoryProducts[index];

            var productName = '';

            if (product.name.length >= 20) {
              productName = product.name.substring(0, 20);
            } else {
              productName = product.name;
            }

            return Dismissible(
              key: ValueKey(product.id),
              onDismissed: (direction) {
                Provider.of<ProductStore>(context, listen: false)
                    .deleteProduct(product);
              },
              child: Container(
                height: 250,
                width: double.maxFinite,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    //image: AssetImage('assets/${product.image}'),
                    image: NetworkImage(product.image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.favorite_outline_rounded,
                          color: Colors.red),
                      const Expanded(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductSingleView(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: const Color.fromRGBO(1, 2, 3, 0.39),
                          child: Column(
                            children: [
                              Text(
                                productName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Qty : ${product.qty}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Expanded(
                                      child: SizedBox(
                                    width: 20,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
