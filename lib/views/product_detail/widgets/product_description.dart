import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart' show ReadMoreText, TrimMode;

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.appBlack),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        ReadMoreText(product.description ?? "",
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: " Show more",
          trimExpandedText: " Less",
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}