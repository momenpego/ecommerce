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
