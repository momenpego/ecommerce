import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Category/data/datasources/category_remote_data.dart';
import 'package:ecommerce_app/features/Category/data/models/category_item_model.dart';
import 'package:ecommerce_app/features/Category/domain/entities/item_category_entitie.dart';

import 'package:ecommerce_app/features/Category/domain/entities/category_entitie.dart';

import 'package:ecommerce_app/core/errors/failurs.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/category_rep.dart';

class CategoryRepositorieImp implements CategoryRepositorie {
  NetWorkChecker netWorkChecker;
  CategoryRemoteDataSource remoteDataSource;
  CategoryRepositorieImp(
      {required this.netWorkChecker, required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> addOrDeleteItemCart({required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final message = await remoteDataSource.addOrDeleteItemCart(id: id);
        return Right(message);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> addOrDeleteItemFavorite(
      {required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final message = await remoteDataSource.addOrDeleteItemFavorite(id: id);
        return Right(message);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryEtitie>> getAllCategory() async {
    if (await netWorkChecker.hasconnected) {
      try {
        final data = await remoteDataSource.getAllCategory();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryItemEntitie>> getCategoryItems(
      {required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        CategoryItemsModel data =
            await remoteDataSource.getCategoryItems(id: id);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
