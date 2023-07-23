part of 'category_bloc.dart';

abstract class CategoryEvent {}

class GetAllCategoryEvent extends CategoryEvent {}

class GetCategoryItemsEvent extends CategoryEvent {
  final int id;
  GetCategoryItemsEvent({required this.id});
}

class AddCateroryItemFavoriteEvent extends CategoryEvent {
  final int id;
  final int index;
  AddCateroryItemFavoriteEvent({required this.id, required this.index});
}

class AddCateroryItemCartEvent extends CategoryEvent {
  final int id;
  final int index;
  AddCateroryItemCartEvent({required this.id, required this.index});
}
