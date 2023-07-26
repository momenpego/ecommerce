// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/utils/app_snakbars.dart';
import 'package:ecommerce_app/features/Category/data/models/navgigat_models.dart';
import 'package:ecommerce_app/features/Category/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/loading_category_widget.dart';
import '../widgets/product_category_widget.dart';

class CategoryProductPage extends StatelessWidget {
  NavCategoryProducts arg;
  CategoryProductPage({
    required this.arg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<CategoryBloc>()..add(GetCategoryItemsEvent(id: arg.id)),
      child: Scaffold(
        appBar: _buildAppBar(title: arg.title),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryAddItemFavoriteSuccessState) {
          AppSnakBarMessages.snakbarSuccessMesage(
              context: context, message: state.message);
        } else if (state is CategoryAddItemFavoriteErrorState) {
          AppSnakBarMessages.snakbarErrorMesage(
              context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            if (state is CategoryItemsLoadingState)
              const ShimmerCategoryWidget(),
            if (state is CategoryItemsSuccessState ||
                state is CategoryAddItemFavoriteErrorState ||
                state is CategoryAddItemFavoriteSuccessState)
              ProductCategoryWidget(
                data: context.read<CategoryBloc>().myItems,
              )
          ],
        );
      },
    );
  }

  AppBar _buildAppBar({required String title}) {
    return AppBar(
      title: Text(title),
    );
  }
}
