import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Cart/domain/repositories/cart_repo.dart';

class DeleteItemCartUseCase {
  CartRepositorie repositorie;
  DeleteItemCartUseCase({required this.repositorie});

  Future<Either<Failure, String>> call({required int id}) async {
    return await repositorie.deleteCartItem(id: id);
  }
}
