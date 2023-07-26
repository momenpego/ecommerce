// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/features/Cart/domain/entities/cart_entitie.dart';
import 'package:ecommerce_app/features/Cart/domain/usecases/delete_item_cart_usecase.dart';
import 'package:ecommerce_app/features/Cart/domain/usecases/getdata_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failurs.dart';
import '../../domain/usecases/update_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartDataUseCase getCartData;
  UpdateCartQuantityUseCase updateCartQuantity;
  DeleteItemCartUseCase deleteItemCart;


 //! this fuction because the back end have bug in quantity !!
  Future<void> checkQuantity(
      {required int id, required int d}) async {
    if (d == 0) {
      await deleteItemCart.call(id: id);
    } else {}
  }

  CartBloc(
      {required this.deleteItemCart,
      required this.getCartData,
      required this.updateCartQuantity})
      : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is GetCartDataEvent) {
        emit(LoadingCartDataState());
        final dataOrFail = await getCartData.call();
        dataOrFail.fold(
            (failure) => {
                  emit(ErrorCartDataState(
                      message: _MessageOfError(failure: failure)))
                },
            (data) => {emit(SuccessCartDataState(data: data))});
      } else if (event is DeleteCartItemEvent) {
        final deleteOrFail = await deleteItemCart.call(id: event.id);
        deleteOrFail.fold(
            (failure) => {
                  emit(DeleteItemCartErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (message) => {emit(DeleteItemCartSuccessState(message: message))});
      } else if (event is UpdateCartQuantityEvent) {
        final updateOrFail = await updateCartQuantity.call(
            id: event.id, quantity: event.quantity);
        updateOrFail.fold(
            (failure) => {
                  emit(UpdateItemQuantityErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (message) =>
                {emit(UpdateItemQuantitySuccessState(message: message))});
      }
    });
  }

  String _MessageOfError({required Failure failure}) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return 'Check your internet!';
      case ServerFailure:
        return 'try again later';
      default:
        return 'something went wrong try again later';
    }
  }
}
