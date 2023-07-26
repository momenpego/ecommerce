// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/features/Product/data/models/product_model.dart';
import 'package:ecommerce_app/core/resources/route_manger.dart';
import 'package:flutter/material.dart';

import '../../data/models/category_item_model.dart';
import 'product_item_widget.dart';

class ProductCategoryWidget extends StatelessWidget {
  List<CategoryItemDatum> data;
  ProductCategoryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.productPage,
                  arguments: ProductModel(
                      id: data[index].id,
                      description: data[index].description,
                      discount: data[index].discount,
                      images: data[index].images,
                      inCart: data[index].inCart,
                      name: data[index].name,
                      oldPrice: data[index].oldPrice,
                      price: data[index].price));
            },
            child: ItemProduct(
              index: index,
              myList: data,
            ),
          );
        },
      ),
    );
  }
}
