
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/views/product_detail/widgets/category_with_icon.dart';
import 'package:doodleblue_ecommerce/views/product_detail/widgets/product_description.dart';
import 'package:doodleblue_ecommerce/views/product_detail/widgets/product_image.dart';
import 'package:doodleblue_ecommerce/views/product_detail/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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

            ProductImage(product: product),


            Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [

                  StarRatingWithCount(product: product),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("\u{20B9} ${product.price!.toStringAsFixed(2)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium),

                        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),


                        Text(
                          product.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),

                        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),


                        CategoryWithIcon(product: product),
                      ]),

                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  ProductDescription(product: product)

                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
            onPressed: !isInCart? () => cartProvider.addToCart(product) : null,
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: AppColors.appBlack.withValues(alpha: .5),
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








