part of 'category_bloc.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class AllCategoryLoadingState extends CategoryState{}

class AllCategorySuccessState extends CategoryState{
  CategoryEtitie data;
  AllCategorySuccessState({required this.data});
}

class AllCategoryErrorState extends CategoryState{
  String message;
  AllCategoryErrorState({required this.message});
}

class CategoryItemsLoadingState extends CategoryState{}

class CategoryItemsSuccessState extends CategoryState{}

class CategoryItemsErrorState extends CategoryState{
    String message;
  CategoryItemsErrorState({required this.message});
}

class CategoryAddItemFavoriteSuccessState extends CategoryState{
   String message;
  CategoryAddItemFavoriteSuccessState({required this.message});
}

class CategoryAddItemFavoriteErrorState extends CategoryState{
   String message;
  CategoryAddItemFavoriteErrorState({required this.message});
}

class CategoryAddItemCartSuccessState extends CategoryState{
   String message;
  CategoryAddItemCartSuccessState({required this.message});
}

class CategoryAddItemCartErrorState extends CategoryState{
   String message;
  CategoryAddItemCartErrorState({required this.message});
}