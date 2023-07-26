import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/cart_entitie.dart';

class ImagesCartWidget extends StatelessWidget {
  const ImagesCartWidget({super.key, required this.data, required this.index});

  final int index;
  final CartEntitie data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.45,
      height: context.height * 0.18,
      child: CarouselSlider.builder(
          itemCount: data.data.cartItems[index].product.images.length,
          itemBuilder: (context, index1, realIndex) => SizedBox(
                width: context.width,
                height: context.height * 0.15,
                child: Padding(
                  padding: EdgeInsets.all(context.height * 0.01),
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
                        imageUrl:
                            data.data.cartItems[index].product.images[index1]),
                  ),
                ),
              ),
          options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1))),
    );
  }
}