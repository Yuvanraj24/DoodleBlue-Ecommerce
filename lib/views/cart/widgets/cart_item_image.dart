import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart' show AppColors;


class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
    required this.cartItem,
  });

  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(AppSizes.sm),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl:
          cartItem.image ??
              '',
          progressIndicatorBuilder: (context, url,
              progress) =>
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        color: AppColors.appWhite,
                        borderRadius:
                        BorderRadius.circular(15)),
                  )),
        ),
      ),
    );
  }
}