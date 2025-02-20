import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/assets/images_strings.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/widgets/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Order Review')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, __) =>
                  SizedBox(height: AppSizes.spaceBtwSections),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return Column(
                  children: [
                    /// Cart item image, title, category
                    Row(
                      children: [
                        Container(
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
                        ),
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
                                      .labelLarge!
                                      .apply(color: AppColors.grey)),
                              Text("Qty - ${cartItem.quantity}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelMedium)
                            ],
                          ),
                        ),
                        Text("\u{20B9} ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
      bottomNavigationBar: cartProvider.cartItems.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {

            },
            child: Text("Confirm Order")),
      ),
    );
  }
}
