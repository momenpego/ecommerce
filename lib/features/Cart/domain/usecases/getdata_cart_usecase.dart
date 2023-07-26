import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Cart/domain/entities/cart_entitie.dart';
import 'package:ecommerce_app/features/Cart/domain/repositories/cart_repo.dart';

class GetCartDataUseCase {
  CartRepositorie repositorie;
  GetCartDataUseCase({required this.repositorie});

  Future<Either<Failure, CartEntitie>> call() async {
    return await repositorie.getAllCartData();
  }
}
