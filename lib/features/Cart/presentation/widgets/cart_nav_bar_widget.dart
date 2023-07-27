import 'package:ecommerce_app/core/resources/app_colors.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CartNavBar extends StatelessWidget {
  const CartNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is SuccessCartDataState) {
          return Visibility(
            visible: state.data.data.cartItems.isNotEmpty,
            child: Container(
              height: context.height * 0.065,
              width: double.infinity,
              color: AppColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.all(context.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'total: ${state.data.data.total.toInt().toString()}',
                      style: AppStyles.smallCaptions(
                          height: context.height, color: Colors.white),
                    ),
                    Text(
                      'items: ${state.data.data.cartItems.length}',
                      style: AppStyles.smallCaptions(
                          height: context.height, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
