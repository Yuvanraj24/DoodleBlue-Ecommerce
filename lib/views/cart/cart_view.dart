import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/cart_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/views/cart/widgets/cart_item.dart';
import 'package:doodleblue_ecommerce/views/cart/widgets/circular_icon.dart';
import 'package:doodleblue_ecommerce/views/checkout/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${cartProvider.cartItems.length})'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.remove_shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, __) => SizedBox(height: AppSizes.spaceBtwSections),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return CartItem(cartItem: cartItem, cartProvider: cartProvider);
              }),
        ),
      ),
      bottomNavigationBar: cartProvider.cartItems.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutView()));
            },
            child: Text("Checkout \u{20B9}${cartProvider.totalPrice.toStringAsFixed(2)}")),
      ),
    );
  }
}




