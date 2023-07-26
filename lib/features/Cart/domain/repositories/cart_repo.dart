import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Cart/domain/entities/cart_entitie.dart';

abstract class CartRepositorie{
  Future<Either<Failure,CartEntitie>> getAllCartData();
  Future<Either<Failure,String>> deleteCartItem({required int id});
  Future<Either<Failure,String>> updateCartQuantity({required int id , required int quantity});
}