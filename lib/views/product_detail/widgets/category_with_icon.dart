import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryWithIcon extends StatelessWidget {
  const CategoryWithIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(product.category ?? '',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: AppColors.grey)),
        SizedBox(width: 4),
        Icon(Icons.category, color: AppColors.grey),
      ],
    );
  }
}