import 'package:inventory_app/category_model.dart';
import 'package:inventory_app/product_model.dart';

List<Category> categories = [
  Category(
    id: 1,
    title: "Mobile Phones",
    description: "Android and IOS Smart Phones",
    image: "mobile.png",
  ),
  Category(
    id: 2,
    title: "Home Appliances",
    description: "Affordable Home Appliances",
    image: "appliance.png",
  ),
  Category(
    id: 3,
    title: "Sports Clothing",
    description: "High Quality Sports Apparel",
    image: "clothing.png",
  ),
  Category(
    id: 4,
    title: "Fresh Vegetables",
    description: "Fresh from the farms",
    image: "veges.png",
  ),
  Category(
    id: 5,
    title: "Toys",
    description: "Toys for children",
    image: "toys.png",
  ),
  Category(
    id: 6,
    title: "Shoes",
    description: "Casual Shoes",
    image: "shoes.png",
  ),
  Category(
    id: 7,
    title: "Milk",
    description: "Dairy Products",
    image: "dairy.png",
  )
];

// List<Product> products = [
//   Product(
//       id: '1',
//       categoryId: 1,
//       name: 'Samsung Galaxy Z Fold6',
//       qty: 10,
//       image: 'products/zfold6.png',
//       isFav: false),
//   Product(
//       id: '2',
//       categoryId: 1,
//       name: 'Samsung Galaxy Flip6',
//       qty: 10,
//       image: 'products/flip6.png',
//       isFav: false),
//   Product(
//       id: '3',
//       categoryId: 1,
//       name: 'Samsung Galaxy M35',
//       qty: 10,
//       image: 'products/m35.png',
//       isFav: false),
//   Product(
//       id: '4',
//       categoryId: 1,
//       name: 'Samsung Galaxy F55',
//       qty: 10,
//       image: 'products/f55.png',
//       isFav: false),
//   Product(
//       id: '5',
//       categoryId: 1,
//       name: 'Samsung Galaxy C55',
//       qty: 10,
//       image: 'products/c55.png',
//       isFav: false),
//   Product(
//       id: '6',
//       categoryId: 1,
//       name: 'Samsung Galaxy M55',
//       qty: 10,
//       image: 'products/m55.png',
//       isFav: false),
//   Product(
//       id: '7',
//       categoryId: 2,
//       name: 'Magic Bullet Blender, Small, Silver, 11 Piece Set',
//       qty: 10,
//       image: 'products/appliance1.png',
//       isFav: false),
//   Product(
//       id: '8',
//       categoryId: 2,
//       name:
//           'OVENTE Electric Sandwich Maker with Non-Stick Plates, Indicator Lights, Cool Touch Handle, Easy to Clean',
//       qty: 10,
//       image: 'products/appliance2.png',
//       isFav: false),
//   Product(
//       id: '9',
//       categoryId: 2,
//       name: 'Vobaga Mug Warmer for Coffee',
//       qty: 10,
//       image: 'products/appliance3.png',
//       isFav: false),
//   Product(
//       id: '10',
//       categoryId: 3,
//       name: 'Under Armor Mens Tech 2.0 Short Sleeve',
//       qty: 10,
//       image: 'products/sport1.png',
//       isFav: false),
//   Product(
//       id: '11',
//       categoryId: 3,
//       name:
//           'Blisset 3 Pack High Waisted Leggings for Women-Soft Athletic Tummy Control Pants for Running Yoga Workout Reg & Plus Size',
//       qty: 10,
//       image: 'products/sport2.png',
//       isFav: false),
//   Product(
//       id: '12',
//       categoryId: 3,
//       name:
//           'Workout Shirts for Men Short Sleeve Quick Dry Athletic Gym Active T Shirt Moisture Wicking',
//       qty: 10,
//       image: 'products/sport3.png',
//       isFav: false),
//   Product(
//       id: '13',
//       categoryId: 6,
//       name: 'Polo Ralph Lauren Train 89',
//       qty: 10,
//       image: 'products/shoes1.png',
//       isFav: false),
//   Product(
//       id: '14',
//       categoryId: 6,
//       name: 'Skechers Mens Stamina Cutback Oxford',
//       qty: 10,
//       image: 'products/shoes2.png',
//       isFav: false),
// ];

// List<Product> getProductsByCategory(int categoryId) {
//   return products.where((product) => product.categoryId == categoryId).toList();
// }
