import 'package:ecommerce_app/core/resources/app_colors.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/features/Product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ProductNavBarWidget extends StatelessWidget {
  int id;
   ProductNavBarWidget({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProductBloc>().add(AddOrDeleteCartEvent(id: id));
      },
      child: Container(
        height: context.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            context.translate(key1: 'addcart')!,
            style: AppStyles.headline1(
                height: context.height / 1.3, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
