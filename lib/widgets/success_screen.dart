import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart' show CartProvider;
import '../views/home/home_view.dart' show HomeView;


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(
            top: AppSizes.defaultSpace * 2,
            left: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace
        ) * 2,
            child: Column(
              children: [

                Lottie.asset(image),
                const SizedBox(height: AppSizes.spaceBtwSections),

                Text(title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSizes.spaceBtwItems),

                Text(subTitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSizes.spaceBtwSections),

                SizedBox(width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {

                          cartProvider.cartItems.clear();
                          cartProvider.saveCart();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));

                      },
                      child: const Text("Done")),),
              ],
            )
        ),

      ),
    );
  }
}
