import 'package:flutter/material.dart';

class Item {
  final String image, title, detail;
  final int price;
  final Color color;

  Item({
    required this.image,
    required this.detail,
    required this.title,
    required this.color,
    required this.price,
  });
}

List<Item> items = [
  Item(
    title: "White Sneakers",
    image: "assets/images/Sneakers.png",
    color: const Color.fromARGB(255, 190, 223, 245),
    detail: '20% off',
    price: 100,
  ),
  Item(
    title: "Denim Jacket",
    image: "assets/images/Jackets.png",
    color: const Color.fromARGB(255, 190, 223, 245),
    detail: '30% off',
    price: 100,
  ),
  Item(
    title: "Chelsea Boots",
    image: "assets/images/Boots.png",
    color: const Color.fromARGB(255, 190, 223, 245),
    detail: '30% off',
    price: 150,
  ),
  Item(
      title: "Flannel Shirts",
      image: "assets/images/Shirts.png",
      color: const Color.fromARGB(255, 190, 223, 245),
      detail: '20% off',
      price: 60),
];
