import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Favorite/domain/repositories/favorite_repo.dart';

class DeleteItemFromFavoriteUseCase{
  FavoriteRepositorie repositorie;
  DeleteItemFromFavoriteUseCase({required this.repositorie});

  Future<Either<Failure,String>> call({required int id})async{
    return await repositorie.deleteItemFromFavorite(id: id);
  }
}