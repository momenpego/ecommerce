part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoagingState extends HomeState {}

class HomeDataSuccessState extends HomeState {
}

class HomeDataErrorState extends HomeState {
  String mssageError;
  HomeDataErrorState({required this.mssageError});
}

class AddFavoriteSuccessState extends HomeState {
  String mssage;
  AddFavoriteSuccessState({required this.mssage});
}

class AddFavoriteErrorState extends HomeState {
  String mssageError;
  AddFavoriteErrorState({required this.mssageError});
}

class AddCartSuccessState extends HomeState {
  String mssage;
  AddCartSuccessState({required this.mssage});
}

class AddCartErrorState extends HomeState {
  String mssageError;
  AddCartErrorState({required this.mssageError});
}
