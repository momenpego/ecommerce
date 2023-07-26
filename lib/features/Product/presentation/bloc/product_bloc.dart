// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failurs.dart';
import '../../domain/usecases/add_cart_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  AddOrRemoveCartUseCase addOrRemoveCart;
  ProductBloc({required this.addOrRemoveCart}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is AddOrDeleteCartEvent) {
        final addOrFail = await addOrRemoveCart.call(id: event.id);
        addOrFail.fold(
            (failure) => {
                  emit(AddOrDeleteCartErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (message) => {emit(AddOrDeleteCartSuccessState(message: message))});
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
