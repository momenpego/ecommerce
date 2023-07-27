import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Favorite/data/datasources/favorite_remote_data.dart';
import 'package:ecommerce_app/features/Favorite/domain/entities/favorite_entitie.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/Favorite/domain/repositories/favorite_repo.dart';

class FavoriteRepositorieImp implements FavoriteRepositorie {
  NetWorkChecker netWorkChecker;
  FavoriteRemoteDataSource remoteDataSource;
  FavoriteRepositorieImp(
      {required this.netWorkChecker, required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> deleteItemFromFavorite(
      {required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final message = await remoteDataSource.deleteItemFromFavorite(id: id);
        return Right(message);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, FavoriteEntitie>> getAllFavoriteData() async {
    if (await netWorkChecker.hasconnected) {
      try {
        final data = await remoteDataSource.getAllFavoriteData();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
