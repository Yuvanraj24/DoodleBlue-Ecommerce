import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class CartModel {
  int id;
  String title;
  num price;
  String category;
  String image;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.quantity
});

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'title' : title,
      'price' : price,
      'category' : category,
      'image' : image,
      'quantity' : quantity
    };

  }

  factory CartModel.fromJson(Map<String, dynamic> cartItem) {
    return CartModel(id: cartItem['id'],
        title: cartItem['title'],
        price: cartItem['price'],
        category: cartItem['category'],
        image: cartItem['image'],
        quantity: cartItem['quantity']);
  }


}