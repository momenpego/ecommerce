import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Cart/domain/repositories/cart_repo.dart';

class UpdateCartQuantityUseCase {
  CartRepositorie repositorie;
  UpdateCartQuantityUseCase({required this.repositorie});

  Future<Either<Failure, String>> call(
      {required int id, required int quantity}) async {
    return await repositorie.updateCartQuantity(id: id, quantity: quantity);
  }
}
