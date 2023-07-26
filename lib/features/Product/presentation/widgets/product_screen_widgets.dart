
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../../../../core/resources/app_styles.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 2,
        ),
        Visibility(
          visible: model.discount == 0,
          child: Padding(
            padding: EdgeInsets.all(context.height * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'price: ${model.price}',
                  style: AppStyles.smallCaptions(height: context.height * 1.1),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: model.discount > 0,
          child: Padding(
            padding: EdgeInsets.all(context.height * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'old price: ${model.oldPrice.toInt()}',
                  style: AppStyles.smallCaptions(
                      isDis: TextDecoration.lineThrough,
                      height: context.height * 1.1),
                ),
                Text(
                  'new price: ${model.price.toInt()}',
                  style: AppStyles.smallCaptions(height: context.height * 1.1),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//! Description ------------------------>
class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 2,
        ),
        Padding(
          padding: EdgeInsets.all(context.height * 0.01),
          child: Text(
            'About Product',
            style: AppStyles.smallCaptions(height: context.height * 1.1),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(context.height * 0.003),
          child: Text(
            model.description,
            style: AppStyles.smallCaptions(height: context.height),
          ),
        ),
      ],
    );
  }
}

//! Name ------------------------>
class NameProduct extends StatelessWidget {
  const NameProduct({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.005),
      child: Text(
        model.name,
        style: AppStyles.smallCaptions(height: context.height),
      ),
    );
  }
}

//! Images-------------------------->
class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: model.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(context.height * 0.01),
            child: InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content:CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          size: context.height * 0.04,
                        ),
                    fit: BoxFit.fill,
                    imageUrl: model.images[index]),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text('close',))
                    ],
                  );
                },);
              },
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
                    imageUrl: model.images[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}