// ignore_for_file: must_be_immutable
import 'package:ecommerce_app/core/utils/app_snakbars.dart';
import 'package:ecommerce_app/features/Product/data/models/product_model.dart';
import 'package:ecommerce_app/features/Product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/nav_bar_product_widget.dart';
import '../widgets/product_screen_widgets.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;

class ProductDetailesPage extends StatelessWidget {
  ProductModel model;
  ProductDetailesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ProductBloc>(),
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is AddOrDeleteCartSuccessState) {
            AppSnakBarMessages.snakbarSuccessMesage(
                context: context, message: state.message);
          } else if (state is AddOrDeleteCartErrorState) {
            AppSnakBarMessages.snakbarErrorMesage(
                context: context, message: state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: ProductNavBarWidget(
              id: model.id,
            ),
            appBar: AppBar(),
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ImagesWidget(model: model),
          NameProduct(model: model),
          PriceWidget(model: model),
          DescriptionText(model: model),
        ],
      ),
    );
  }
}
