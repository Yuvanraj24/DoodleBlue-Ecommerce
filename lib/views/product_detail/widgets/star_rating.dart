import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/sizes/sizes.dart' show AppSizes;

class StarRatingWithCount extends StatelessWidget {
  const StarRatingWithCount({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.orangeAccent, size: 24),
        SizedBox(width: AppSizes.spaceBtwItems / 4),
        RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '${product.rating!.rate}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(fontWeightDelta: 2)),
              TextSpan(
                  text: " (${product.rating!.count})",
                  style: Theme.of(context).textTheme.bodyMedium)
            ]))
      ],
    );
  }
}