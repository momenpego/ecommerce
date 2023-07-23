import 'package:ecommerce_app/features/Main/presentation/bloc/main_bloc.dart';
import 'package:ecommerce_app/features/Main/presentation/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: _bulidNavBar(),
            appBar: _buildAppBar(),
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return context
              .read<MainBloc>()
              .screens[context.read<MainBloc>().currentIndex];
  }

  AppBar _buildAppBar() => AppBar();

  BottomNavWidget _bulidNavBar() => const BottomNavWidget();
}
