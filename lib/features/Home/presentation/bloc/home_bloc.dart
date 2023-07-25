// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Home/data/models/home_model.dart';
import 'package:ecommerce_app/features/Home/domain/usecases/add_cart_usecase.dart';
import 'package:ecommerce_app/features/Home/domain/usecases/add_fav_usecase.dart';
import 'package:ecommerce_app/features/Home/domain/usecases/get_home_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetHomeDataUseCase getHomeData;
  AddOrDeleteCartUseCase addOrDeleteCart;
  AddOrDeleteFavoriteUseCase addOrDeleteFavorite;
   List<HomeProduct> myListItems =[];
  List<HomeBanner> myListBanner=[];
  HomeBloc(
      {required this.addOrDeleteCart,
      required this.addOrDeleteFavorite,
      required this.getHomeData})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetHomeDataEvent) {
        emit(HomeDataLoagingState());
        final dataOrFail = await getHomeData.call();
        dataOrFail.fold(
            (failure) => {
                  emit(HomeDataErrorState(
                      mssageError: _MessageOfError(failure: failure)))
                },
            (data) => {
                  myListItems.addAll(data.data.products),
                  myListBanner.addAll(data.data.banners),
                  emit(HomeDataSuccessState())
                });
      } else if (event is AddCartEvent) {
        final addOrFail = await addOrDeleteCart.call(id: event.id);
        addOrFail.fold(
            (failure) => {
                  emit(AddCartErrorState(
                      mssageError: _MessageOfError(failure: failure)))
                },
            (message) => {
                  myListItems[event.index].inCart =
                      !myListItems[event.index].inCart,
                  emit(AddCartSuccessState(mssage: message))
                });
      } else if (event is AddFavoriteEvent) {
        final addOrFail = await addOrDeleteFavorite.call(id: event.id);
        addOrFail.fold(
            (failure) => {
                  emit(AddFavoriteErrorState(
                      mssageError: _MessageOfError(failure: failure)))
                },
            (mssage) => {
                  myListItems[event.index].inFavorites =
                      !myListItems[event.index].inFavorites,
                  emit(AddFavoriteSuccessState(mssage: mssage))
                });
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
