part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class LoadingCartDataState extends CartState {}

class SuccessCartDataState extends CartState {
  CartEntitie data;
  SuccessCartDataState({required this.data});
}

class ErrorCartDataState extends CartState {
  String message;
  ErrorCartDataState({required this.message});
}

class DeleteItemCartSuccessState extends CartState {
  String message;
  DeleteItemCartSuccessState({required this.message});
}

class DeleteItemCartErrorState extends CartState {
  String message;
  DeleteItemCartErrorState({required this.message});
}

class UpdateItemQuantitySuccessState extends CartState {
  String message;
  UpdateItemQuantitySuccessState({required this.message});
}

class UpdateItemQuantityErrorState extends CartState {
  String message;
  UpdateItemQuantityErrorState({required this.message});
}
