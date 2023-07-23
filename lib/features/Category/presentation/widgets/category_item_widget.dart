import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final int id;
  const CategoryItemWidget(
      {super.key, required this.name, required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(context.height * 0.01),
          child: Container(
            height: context.height * 0.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: context.height * 0.04,
                      ),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  imageUrl: image),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(context.height * 0.01),
          child: Container(
            height: context.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.2)),
            child: Center(
              child: Text(
                name,
                style: AppStyles.headline1(
                    height: context.height, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
