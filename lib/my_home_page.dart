import 'package:flutter/material.dart';
import 'package:inventory_app/category_view.dart';
import 'package:inventory_app/side_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Inventory App',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        centerTitle: true,
      ),
      drawer: const SideDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            width: double.infinity,
            color: Colors.pinkAccent,
            child: const Column(
              children: [
                Text(
                  'Product Categories',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const CategoryView(),
        ],
      ),
    );
  }
}
