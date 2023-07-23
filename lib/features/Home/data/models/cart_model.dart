import 'package:ecommerce_app/features/Home/domain/entities/cart_entitie.dart';

class CartModel extends CartEntitie {
  CartModel({required super.message, required super.status});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        message: json["message"],
      );
}
