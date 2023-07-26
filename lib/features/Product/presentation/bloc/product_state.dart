part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class AddOrDeleteCartSuccessState extends ProductState{
  String message;
  AddOrDeleteCartSuccessState({required this.message});
}

class AddOrDeleteCartErrorState extends ProductState{
  String message;
  AddOrDeleteCartErrorState({required this.message});
}