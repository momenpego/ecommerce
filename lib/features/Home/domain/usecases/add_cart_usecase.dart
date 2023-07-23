import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Home/domain/repositories/home_repo.dart';

class AddOrDeleteCartUseCase {
  HomeRepositorie repositorie;
  AddOrDeleteCartUseCase({required this.repositorie});

  Future<Either<Failure, String>> call({required int id}) async {
    return await repositorie.addOrDeleteCart(id: id);
  }
}
