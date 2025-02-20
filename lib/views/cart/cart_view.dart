import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/views/checkout/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
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
                                      .labelMedium!
                                      .apply(color: AppColors.grey)),
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBtwItems),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 70),
                            CircularIcon(
                                onPress: () => cartProvider.decreaseQty(cartItem.id),
                                width: 32,
                                height: 32,
                                size: AppSizes.md,
                                iconColor: AppColors.appBlack,
                                icon: Icons.remove,
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
                        ),

                        /// Product price
                        Text("\u{20B9} ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium)
                      ])
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutView()));
            },
            child: Text("Checkout \u{20B9}${cartProvider.totalPrice.toStringAsFixed(2)}")),
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? iconColor, backgroundColor;
  final VoidCallback? onPress;

  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 32,
        height: 32,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withValues(alpha: .5),
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(1, 5)),
          ],
        ),

        child: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
