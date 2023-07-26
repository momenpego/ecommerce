import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Product/domain/repositories/product_repo.dart';

class AddOrRemoveCartUseCase {
  ProductRepositorie repositorie;
  AddOrRemoveCartUseCase({required this.repositorie});

  Future<Either<Failure, String>> call({required int id}) async {
    return await repositorie.addOrRemoveCart(id: id);
  }
}
