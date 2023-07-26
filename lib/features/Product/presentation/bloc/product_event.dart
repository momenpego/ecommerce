part of 'product_bloc.dart';

abstract class ProductEvent  {

}

class AddOrDeleteCartEvent extends ProductEvent{
  int id;
  AddOrDeleteCartEvent({required this.id});
}