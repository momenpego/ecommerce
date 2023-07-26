import '../../data/models/cart_model.dart';

class CartEntitie {
  bool status;
  dynamic message;
  CartData data;

  CartEntitie({
    required this.status,
    required this.message,
    required this.data,
  });
}
