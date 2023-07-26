part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetHomeDataEvent extends HomeEvent {}


class AddFavoriteEvent extends HomeEvent {
  int id;
  int index;
  AddFavoriteEvent({required this.id, required this.index});
}
