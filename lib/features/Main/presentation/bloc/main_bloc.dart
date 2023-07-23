import 'package:ecommerce_app/features/Category/presentation/pages/category_page.dart';
import 'package:ecommerce_app/features/Home/presentation/pages/home_page.dart';
import 'package:ecommerce_app/features/More/presentation/pages/more_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const CategoryPage(),
    const MorePage()
  ];
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {
      if (event is ChangePageEvent) {
        currentIndex = event.currentPage;
        emit(ChangePageState());
      }
    });
  }
}
