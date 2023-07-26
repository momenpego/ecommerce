// ignore_for_file: must_be_immutable
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/features/Cart/domain/entities/cart_entitie.dart';
import 'package:ecommerce_app/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/Cart/presentation/widgets/images_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  CartEntitie data;
  CartItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.data.cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(context.height * 0.01),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300]),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.height * 0.005),
                    child: Text(
                      data.data.cartItems[index].product.name,
                      style: AppStyles.smallCaptions(height: context.height),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  QuantityWidget(data: data, index: index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuantityWidget extends StatelessWidget {
  QuantityWidget({super.key, required this.data, required this.index});

  final CartEntitie data;
  final int index;
  late int x;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagesCartWidget(
          data: data,
          index: index,
        ),
        SizedBox(
          width: context.width * 0.18,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.data.cartItems[index].quantity.toString(),
              style: AppStyles.smallCaptions(height: context.height),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      x = data.data.cartItems[index].quantity;
                      x++;
                      context.read<CartBloc>().add(UpdateCartQuantityEvent(
                          id: data.data.cartItems[index].id, quantity: x));
                      context.read<CartBloc>().add(GetCartDataEvent());
                    },
                    icon: Icon(
                      Icons.add,
                      size: context.height * 0.03,
                    )),
                IconButton(
                    onPressed: () {
                      x = data.data.cartItems[index].quantity;
                      x--;
                      context.read<CartBloc>().checkQuantity(
                          id: data.data.cartItems[index].id, d: x);
                     x != 0? context.read<CartBloc>().add(UpdateCartQuantityEvent(
                          id: data.data.cartItems[index].id, quantity: x)) : null;
                      context.read<CartBloc>().add(GetCartDataEvent());
                    },
                    icon: Icon(
                      Icons.remove,
                      size: context.height * 0.03,
                    )),
              ],
            )
          ],
        )
      ],
    );
  }
}
