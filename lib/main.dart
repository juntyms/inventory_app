import 'package:flutter/material.dart';
import 'package:inventory_app/my_home_page.dart';
import 'package:inventory_app/product_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // this line is added when setting up Provider which was wrap with widgets
      create: (context) =>
          ProductStore(), // this line is added when setting up Provider
      child: MaterialApp(
        title: 'Inventory App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
          ),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
