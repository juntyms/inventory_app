import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:inventory_app/category_model.dart';
import 'package:inventory_app/product_model.dart';
import 'package:inventory_app/product_store.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductCreate extends StatefulWidget {
  const ProductCreate({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productQtyController = TextEditingController();
  File? _selectedImage;
  //var imgPath;

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    setState(() {
      //imgPath = returnedImage;
      _selectedImage = File(returnedImage.path);
    });
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Saving Product....'),
          backgroundColor: Colors.pink,
        ),
      );

      //Upload Image to Firestorage

      var imageName = DateTime.now().millisecondsSinceEpoch.toString();
      var storageRef =
          FirebaseStorage.instance.ref().child('product_images/$imageName.jpg');
      var uploadTask = storageRef.putFile(_selectedImage!);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();

      //Transfer this to the provider below
      // products.add(Product(
      //   id: uuid.v4(),
      //   categoryId: widget.category.id,
      //   name: productNameController.text.trim(),
      //   qty: int.parse(productQtyController.text.trim()),
      //   image: 'image.jpg',
      //   isFav: false,
      // ));

      //// after this install flutter pub add provider then create product_store.dart

      // Add this and comment above
      Provider.of<ProductStore>(context, listen: false).addProduct(Product(
        id: uuid.v4(),
        categoryId: widget.categoryId,
        name: productNameController.text.trim(),
        qty: int.parse(productQtyController.text.trim()),
        //   image: 'image.jpg',
        image: downloadUrl.toString(),
        isFav: false,
      ));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Product'),
        ),
        body: Column(
          children: [
            _selectedImage == null
                ? const Text("Select Image")
                : Container(
                    height: 250,
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(2),
                    child: Image.file(_selectedImage!),
                  ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      child: const Text('Upload Image'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: productNameController,
                      decoration: const InputDecoration(
                        labelText: 'Product Name',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* This field should not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: productQtyController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Product Qty',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* This field should not be empty';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        submitForm();
                        //Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
