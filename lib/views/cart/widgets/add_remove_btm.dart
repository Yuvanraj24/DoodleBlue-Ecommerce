import 'package:doodleblue_ecommerce/models/cart_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/sizes/sizes.dart';
import 'circular_icon.dart';

class AddRemoveButtonWithQty extends StatelessWidget {
  const AddRemoveButtonWithQty({
    super.key,
    required this.cartProvider,
    required this.cartItem,
  });

  final CartProvider cartProvider;
  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 70),
        CircularIcon(
            onPress: () => cartProvider.decreaseQty(cartItem.id),
            width: 32,
            height: 32,
            size: AppSizes.md,
            iconColor: cartItem.quantity > 1? AppColors.appBlack : Colors.redAccent,
            icon: cartItem.quantity > 1 ?Icons.remove: Icons.delete,
            backgroundColor:
            AppColors.appWhite.withOpacity(0.9)),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text(cartItem.quantity.toString(),
            style:
            Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AppSizes.spaceBtwItems),
        CircularIcon(
            onPress: () => cartProvider.increaseQty(cartItem.id),
            width: 32,
            height: 32,
            size: AppSizes.md,
            iconColor: AppColors.appWhite,
            icon: Icons.add,
            backgroundColor:
            AppColors.appBlue.withOpacity(0.9)),
      ],
    );
  }
}