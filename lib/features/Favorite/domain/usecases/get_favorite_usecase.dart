import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Favorite/domain/entities/favorite_entitie.dart';
import 'package:ecommerce_app/features/Favorite/domain/repositories/favorite_repo.dart';

class GetAllFavoriteDataUseCase {
  FavoriteRepositorie repositorie;
  GetAllFavoriteDataUseCase({required this.repositorie});
  Future<Either<Failure, FavoriteEntitie>> call() async {
    return await repositorie.getAllFavoriteData();
  }
}
