// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/features/Home/data/models/home_model.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  List<HomeBanner> myList;
  BannerWidget({super.key, required this.myList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            context.height * 0.01,
          ),
          child: Row(
            children: [
              Text(
                context.translate(key1: 'Deal')!,
                style: AppStyles.headline2(height: context.height),
              ),
            ],
          ),
        ),
        CarouselSlider.builder(
            itemCount: myList.length,
            itemBuilder: (context, index, realIndex) => SizedBox(
                  width: context.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.03,
                        horizontal: context.height * 0.02),
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
                          imageUrl: myList[index].image),
                    ),
                  ),
                ),
            options: CarouselOptions(
                aspectRatio: 15 / 8,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1))),
      ],
    );
  }
}
