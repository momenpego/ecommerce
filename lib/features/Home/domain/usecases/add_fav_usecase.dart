import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Home/domain/repositories/home_repo.dart';

class AddOrDeleteFavoriteUseCase {
  HomeRepositorie repositorie;
  AddOrDeleteFavoriteUseCase({required this.repositorie});

  Future<Either<Failure, String>> call({required int id}) async {
    return await repositorie.addOrDeleteFavorite(id: id);
  }
}
