part of 'cart_bloc.dart';

abstract class CartEvent {

}

class GetCartDataEvent extends CartEvent{}

class UpdateCartQuantityEvent extends CartEvent{
 
 int id;
 int quantity;

 UpdateCartQuantityEvent({required this.id , required this.quantity});

}

class DeleteCartItemEvent extends CartEvent{
  int id;
  DeleteCartItemEvent({required this.id});
}