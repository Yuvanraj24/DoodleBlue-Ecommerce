import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);
    bool isInCart = cartProvider.cartItems.any((item) => item.id == product.id);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// Product Image
            Padding(
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
            ),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating
                  Row(
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
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Price of product
                        Text("\u{20B9} ${product.price!.toStringAsFixed(2)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium),

                        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

                        /// title
                        Text(
                          product.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),

                        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

                        /// Category
                        Row(
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
                        ),
                      ]),

                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  Row(
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
                    ],
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
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: !isInCart? () => cartProvider.addToCart(product) : null,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: AppColors.appBlack,
                side: const BorderSide(color: AppColors.appBlack)),
            child:  Text(!isInCart ? "Add to cart" : "Added", style: TextStyle(
              color: Colors.white
            ),)),
      ),
    );
  }
}
