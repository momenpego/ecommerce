import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/features/Home/data/models/home_model.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  List<HomeProduct> myList;
  ItemWidget({super.key, required this.myList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(context.height*0.01),
          child: Text(
            context.translate(key1: 'item')!,
            style: AppStyles.headline2(height: context.height),
          ),
        ),
        SizedBox(
          height: context.height*0.01,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: myList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return ProductWidget(
              myList: myList,
              index: index,
            );
          },
        ),
      ],
    );
  }
}
