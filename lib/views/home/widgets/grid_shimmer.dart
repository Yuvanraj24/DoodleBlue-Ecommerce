import 'package:doodleblue_ecommerce/core/constants/sizes/sizes.dart';
import 'package:doodleblue_ecommerce/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 8,
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSizes.gridViewSpacing,
            crossAxisSpacing: AppSizes.gridViewSpacing,
            mainAxisExtent: 288),
        itemBuilder: (_, __) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppShimmerEffect(width: 180, height: 180),
              SizedBox(height: AppSizes.spaceBtwItems),

              AppShimmerEffect(width: 160, height: 15),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              AppShimmerEffect(width: 110, height: 15)
            ],
          ),
        )
    );
  }
}