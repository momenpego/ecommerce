// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Model/product_model.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';

class ProductDetailesPage extends StatelessWidget {
  ProductModel model;
  ProductDetailesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImagesWidget(model: model),
          NameProduct(model: model),
          DescriptionText(model: model)
        ],
      ),
    );
  }
}

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
          padding:  EdgeInsets.all(context.height*0.01),
          child: Text('About Product',style: AppStyles.smallCaptions(height: context.height*1.1),),
        ),
        Padding(
          padding:  EdgeInsets.all(context.height*0.003),
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
          );
        },
      ),
    );
  }
}
