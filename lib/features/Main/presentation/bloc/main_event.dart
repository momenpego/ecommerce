part of 'main_bloc.dart';

abstract class MainEvent{
}

class ChangePageEvent extends MainEvent{
  int currentPage;
  ChangePageEvent({required this.currentPage});
}