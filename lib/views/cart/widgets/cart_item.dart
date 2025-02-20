import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/cart_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'add_remove_btm.dart';
import 'cart_item_image.dart';
import 'circular_icon.dart' show CircularIcon;

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
    required this.cartProvider,
  });

  final CartModel cartItem;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(children: [
            CartItemImage(cartItem: cartItem),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.title ??
                        '',
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Text(cartItem.category ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: AppColors.grey)),
                ],
              ),
            )
          ]),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddRemoveButtonWithQty(cartProvider: cartProvider, cartItem: cartItem),

                Text("\u{20B9} ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium)
              ])
        ]);
  }
}



