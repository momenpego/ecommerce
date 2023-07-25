import 'package:ecommerce_app/core/utils/app_snakbars.dart';
import 'package:ecommerce_app/features/Home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Widgets/text_error_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/items_widget.dart';
import '../widgets/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di.sl<HomeBloc>()..add(GetHomeDataEvent()),
        child: _buildBody());
  }

  Widget _buildBody() => BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AddFavoriteSuccessState) {
            AppSnakBarMessages.snakbarSuccessMesage(
                context: context, message: state.mssage);
          } else if (state is AddFavoriteErrorState) {
            AppSnakBarMessages.snakbarErrorMesage(
                context: context, message: state.mssageError);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                if (state is HomeDataErrorState)
                  TextErrorWidget(message: state.mssageError),
                if (state is HomeDataLoagingState) const ShimmerHomeWidget(),
                if (state is HomeDataSuccessState ||
                    state is AddFavoriteSuccessState ||
                    state is AddFavoriteErrorState)
                  Column(
                    children: [
                      BannerWidget(
                        myList: context.read<HomeBloc>().myListBanner,
                      ),
                      ItemWidget(myList: context.read<HomeBloc>().myListItems)
                    ],
                  )
              ],
            ),
          );
        },
      );
}
