import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart' show AppSizes;
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart' show CartProvider;
import 'package:doodleblue_ecommerce/views/Product/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.isInCart,
  });

  final ProductModel product;
  final bool isInCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailView(
            product: product,
          ))),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(0.1),
                  blurRadius: 50,
                  spreadRadius: 7,
                  offset: const Offset(0, 2)),
            ],
            color: AppColors.appWhite,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            /// Product Image
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: AppColors.appWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: product.image ?? '',
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
            ),

            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Title
                  Text(
                    product.title ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                      height: AppSizes.spaceBtwItems / 4),

                  /// Category
                  Text(product.category ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: AppColors.grey)),
                ],
              ),
            ),

            /// Price
            Row(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 12, vertical: 2),
                child: Text(
                    "\u{20B9} ${product.price!.toStringAsFixed(2)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    Theme.of(context).textTheme.titleLarge),
              ),
              Spacer(),
              GestureDetector(
                onTap: !isInCart
                    ? () {
                  Provider.of<CartProvider>(context,
                      listen: false)
                      .addToCart(product);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                        content: Text("Added to Cart")),
                  );
                }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.appBlack,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(16),
                      )),
                  child: SizedBox(
                    width: 38,
                    height: 38,
                    child: Center(
                      child: Icon(
                          isInCart ? Icons.done : Icons.add,
                          color: AppColors.appWhite),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}