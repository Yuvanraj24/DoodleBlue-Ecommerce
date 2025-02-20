import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart' show ProductModel;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: CachedNetworkImage(
          imageUrl:
          product.image ?? '',
          progressIndicatorBuilder: (context, url, progress) =>
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        color: AppColors.appWhite,
                        borderRadius: BorderRadius.circular(15)),
                  )),
        ),
      ),
    );
  }
}