import 'package:ecommerce_app/features/Category/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_app/features/Category/presentation/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;

import '../../../../core/Widgets/text_error_widget.dart';
import '../widgets/loading_category_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<CategoryBloc>()..add(GetAllCategoryEvent()),
      child: _bulidBody(),
    );
  }

  Widget _bulidBody() => BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              if (state is AllCategoryLoadingState)
                const ShimmerCategoryWidget(),
              if (state is AllCategorySuccessState)
                CategoryWidget(list: state.data.data.data),
              if (state is AllCategoryErrorState)
                TextErrorWidget(
                  message: state.message,
                )
            ],
          );
        },
      );
}
