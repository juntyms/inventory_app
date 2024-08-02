import 'package:flutter/material.dart';
import 'package:inventory_app/inventory_data.dart';
import 'package:inventory_app/product_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  //final Category category;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: const EdgeInsets.only(right: 12.0),
                      decoration: const BoxDecoration(
                          border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black),
                      )),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(45),
                          child: Image(
                            image: AssetImage('assets/${category.image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    //title
                    title: Text(
                      category.title,
                      style: const TextStyle(color: Colors.black),
                    ),

                    //subtitle
                    subtitle: Text(
                      category.description,
                    ),
                    // trailing
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.pink[900],
                      size: 30.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductView(category: category),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
