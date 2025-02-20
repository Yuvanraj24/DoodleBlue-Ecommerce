import 'dart:convert';

import 'package:doodleblue_ecommerce/models/cart_model.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _cartItems = []; // Store products with quantity
  double _totalPrice = 0.0;

  List<CartModel> get cartItems => _cartItems;

  double get totalPrice => _totalPrice;

  void addToCart(ProductModel product) {
    _cartItems.add(CartModel(
        id: product.id!,
        title: product.title!,
        price: product.price!,
        category: product.category!,
        image: product.image!,
        quantity: 1));
    calculateTotal();
    saveCart();
    notifyListeners();
  }

  void increaseQty(int productId) {
    cartItems.firstWhere((item) => item.id == productId).quantity++;
    calculateTotal();
    saveCart();
    notifyListeners();
  }

  void decreaseQty(int productId) {
    final product = _cartItems.firstWhere((item) => item.id == productId);
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      _cartItems.remove(product);
    }
    calculateTotal();
    saveCart();
    notifyListeners();
  }

  /// Calculate total price
  void calculateTotal() {
    _totalPrice =
        _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> fetchCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonCart = prefs.getStringList('cart');

    if (jsonCart != null) {
      _cartItems =
          jsonCart.map((item) => CartModel.fromJson(jsonDecode(item))).toList();
      calculateTotal();
      notifyListeners();
    }
  }

  Future<void> saveCart() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> jsonCart =
        _cartItems.map((item) => jsonEncode(item.toJson())).toList();
    sp.setStringList('cart', jsonCart);
  }
}
