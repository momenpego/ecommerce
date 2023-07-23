import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/features/Main/presentation/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return BottomNavigationBar(
            currentIndex: context.read<MainBloc>().currentIndex,
            onTap: (value) {
              context.read<MainBloc>().add(ChangePageEvent(currentPage: value));
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: context.height * 0.035,
                  ),
                  label: context.translate(key1: 'home')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_outlined,
                    size: context.height * 0.035,
                  ),
                  label: context.translate(key1: 'category')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.more_horiz_outlined,
                    size: context.height * 0.035,
                  ),
                  label: context.translate(key1: 'more')),
            ]);
      },
    );
  }
}
