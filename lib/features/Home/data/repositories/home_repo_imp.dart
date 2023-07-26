import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Home/data/datasources/home_remote_data.dart';
import 'package:ecommerce_app/features/Home/data/models/home_model.dart';
import 'package:ecommerce_app/features/Home/domain/entities/home_entitie.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/Home/domain/repositories/home_repo.dart';

class HomeRepositorieImp implements HomeRepositorie {
  NetWorkChecker netWorkChecker;
  HomeRemoteDataSource remoteDataSource;
  HomeRepositorieImp(
      {required this.netWorkChecker, required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> addOrDeleteFavorite({required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final message = await remoteDataSource.addOrDeleteFavorite(id: id);
        return Right(message);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, HomeEntitie>> getHomeData() async {
    if (await netWorkChecker.hasconnected) {
      try {
        HomeModel data = await remoteDataSource.getHomeData();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
