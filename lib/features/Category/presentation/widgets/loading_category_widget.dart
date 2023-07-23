import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryWidget extends StatelessWidget {
  const ShimmerCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
          baseColor: Colors.grey[900]!,
          highlightColor: Colors.grey[500]!,
          child: const CategorySkeleton()),
    );
  }
}

class CategorySkeleton extends StatelessWidget {
  const CategorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.12),
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.all(context.height*0.01),
          child: Container(
            height: context.height*0.2,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
              borderRadius: BorderRadius.circular(15)
            ),
          ),
        );
      },
    );
  }
}
