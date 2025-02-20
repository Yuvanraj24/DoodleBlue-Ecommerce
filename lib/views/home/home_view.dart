
import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/models/product_model.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/providers/product_provider.dart';
import 'package:doodleblue_ecommerce/views/cart/cart_view.dart';
import 'package:doodleblue_ecommerce/views/home/widgets/grid_shimmer.dart';
import 'package:doodleblue_ecommerce/views/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productProvider.getGreeting(),
                  style: Theme.of(context).textTheme.titleMedium!.apply(color: AppColors.appWhite)),
              Text("Customer", style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.appWhite)),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
        ],
      ),
      body: productProvider.isLoading
          ? GridViewShimmer()
          : GridView.builder(
              itemCount: productProvider.products.length,
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSizes.gridViewSpacing,
                  crossAxisSpacing: AppSizes.gridViewSpacing,
                  mainAxisExtent: 288),
              itemBuilder: (context, index) {
                ProductModel product = productProvider.products[index];
                final cartProvider = Provider.of<CartProvider>(context);
                bool isInCart = cartProvider.cartItems
                    .any((item) => item.id == product.id);

                return ProductCard(product: product, isInCart: isInCart);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        elevation: 5,

        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartView()));
        },
        shape: CircleBorder(),
        child: Icon(Icons.shopping_cart,color: AppColors.appWhite.withValues(alpha: .6),),
      )
    );
  }
}




