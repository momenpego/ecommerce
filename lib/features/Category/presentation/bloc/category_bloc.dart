// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/features/Category/domain/entities/category_entitie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failurs.dart';
import '../../data/models/category_item_model.dart';
import '../../domain/usecases/add_cart_category_usecase.dart';
import '../../domain/usecases/add_fav_category_usecase.dart';
import '../../domain/usecases/get_category_usecase.dart';
import '../../domain/usecases/get_item_category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetAllCategoryUseCase getAllCategory;
  GetCategoryItemUseCase getCategoryItem;
  AddOrDeleteCatergoryItemFavoriteUseCase addOrDeleteCatergoryItemFavorite;
  AddOrDeleteCatergoryItemCartUseCase addOrDeleteCatergoryItemCart;
  late List<CategoryItemDatum> myItems;
  CategoryBloc(
      {required this.addOrDeleteCatergoryItemCart,
      required this.addOrDeleteCatergoryItemFavorite,
      required this.getAllCategory,
      required this.getCategoryItem})
      : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetAllCategoryEvent) {
        emit(AllCategoryLoadingState());
        final dataOrFail = await getAllCategory.call();
        dataOrFail.fold(
            (failure) => {
                  emit(AllCategoryErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (data) => {emit(AllCategorySuccessState(data: data))});
      } else if (event is GetCategoryItemsEvent) {
        emit(CategoryItemsLoadingState());
        final dataOrFail = await getCategoryItem.call(id: event.id);
        dataOrFail.fold(
            (failure) => {
                  emit(CategoryItemsErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (data) =>
                {myItems = data.data.data, emit(CategoryItemsSuccessState())});
      } else if (event is AddCateroryItemFavoriteEvent) {
        final doneOrFail =
            await addOrDeleteCatergoryItemFavorite.call(id: event.id);
        doneOrFail.fold(
            (failure) => {
                  emit(CategoryAddItemFavoriteErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (message) => {
                  myItems[event.index].inFavorites =
                      !myItems[event.index].inFavorites,
                  emit(CategoryAddItemFavoriteSuccessState(message: message))
                });
      } else if (event is AddCateroryItemCartEvent) {
        final addOrFail = await addOrDeleteCatergoryItemCart.call(id: event.id);
        addOrFail.fold(
            (failure) => {
                  emit(CategoryAddItemCartErrorState(
                      message: _MessageOfError(failure: failure)))
                },
            (message) => {
                  myItems[event.index].inCart = !myItems[event.index].inCart,
                  emit(CategoryAddItemCartSuccessState(message: message))
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
