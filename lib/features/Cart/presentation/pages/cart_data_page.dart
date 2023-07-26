import 'package:ecommerce_app/core/utils/app_snakbars.dart';
import 'package:ecommerce_app/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/Cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDataPage extends StatelessWidget {
  const CartDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<CartBloc>()..add(GetCartDataEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: _bulidBody(),
      ),
    );
  }

  Widget _bulidBody() {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is UpdateItemQuantitySuccessState) {
          AppSnakBarMessages.snakbarSuccessMesage(
              context: context, message: state.message);
        } else if (state is UpdateItemQuantityErrorState) {
          AppSnakBarMessages.snakbarErrorMesage(
              context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            if (state is LoadingCartDataState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is SuccessCartDataState)
              CartItemWidget(
                data: state.data,
              )
          ],
        );
      },
    );
  }
}
