import 'package:flutter/material.dart';
import 'package:inventory_app/product_model.dart';
import 'package:inventory_app/product_store.dart';
import 'package:provider/provider.dart';
//import 'package:inventory_app/inventory_data.dart';

class ProductSingleView extends StatefulWidget {
  const ProductSingleView({required this.product, super.key});

  final Product product;

  @override
  State<ProductSingleView> createState() => _ProductSingleViewState();
}

class _ProductSingleViewState extends State<ProductSingleView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();

  late int _productQty;
  bool _isEdit = false;

  @override
  void initState() {
    super.initState();
    _productQty = widget.product.qty;
    _productNameController.text = widget.product.name;
  }

  void toggleEdit() {
    setState(() {
      _isEdit = !_isEdit;
    });
  }

  void _addQty() {
    setState(() {
      _productQty++;
    });
  }

  void _removeQty() {
    setState(() {
      if (_productQty > 0) {
        _productQty--;
      } else {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
                title: const Text('Quantity Already 0'),
                content: const Text('No more item remaining'),
                actions: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    icon: const Icon(Icons.close),
                  )
                ]);
          },
        );
      }
    });
  }

  // this is creating new entry
  // void _saveProduct() {
  //   products.add(Product(
  //       id: '1',
  //       categoryId: 1,
  //       name: _productNameController.text.trim(),
  //       qty: _productQty,
  //       image: widget.product.image,
  //       isFav: widget.product.isFav));
  // }

  //Update the product list
  // void updateProduct() {
  //   int index =
  //       products.indexWhere((product) => product.id == widget.product.id);

  //   if (index != -1) {
  //     setState(() {
  //       products[index].name = _productNameController.text.trim();
  //       products[index].qty = _productQty;
  //     });
  //   }
  // }
  void updateProduct() {
    widget.product.name = _productNameController.text.trim();
    widget.product.qty = _productQty;

    Provider.of<ProductStore>(context, listen: false)
        .updateProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.product.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              toggleEdit();
            },
            icon: const Icon(Icons.edit_document),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.pinkAccent[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/${widget.product.image}",
                          fit: BoxFit.cover)),
                  Positioned(
                    bottom: 10.0,
                    right: 20.0,
                    child: FloatingActionButton(
                      elevation: 2.0,
                      onPressed: () {},
                      child: const Icon(Icons.favorite_outline_rounded,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Center(
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Form Here

              Center(
                child: Text(
                  //'Remaining Quantity : ${widget.product.qty}',
                  'Remaining Quantity : $_productQty',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (_isEdit)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              _addQty();
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _removeQty();
                            },
                            icon: const Icon(
                              Icons.do_disturb_on,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _productNameController,
                              decoration: const InputDecoration(
                                labelText: 'Item Name',
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
                            TextButton(
                              onPressed: () {
                                _formKey.currentState!.validate();

                                updateProduct();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Character saved.'),
                                  showCloseIcon: true,
                                  backgroundColor: Colors.pinkAccent,
                                  duration: Duration(seconds: 3),
                                ));

                                //Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                color: Colors.pink[700],
                                child: const Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
