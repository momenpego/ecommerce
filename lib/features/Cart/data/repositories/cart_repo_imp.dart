import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Cart/data/datasources/cart_remote_data.dart';
import 'package:ecommerce_app/features/Cart/domain/entities/cart_entitie.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/Cart/domain/repositories/cart_repo.dart';
class CartRepositorieImp implements CartRepositorie {
  NetWorkChecker netWorkChecker;
  CartRemoteDataSource remoteDataSource;
  CartRepositorieImp(
      {required this.netWorkChecker, required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> deleteCartItem({required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final message = await remoteDataSource.deleteItemCart(id: id);
        return Right(message);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CartEntitie>> getAllCartData() async {
    if (await netWorkChecker.hasconnected) {
      try {
        final data = await remoteDataSource.getAllCartData();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateCartQuantity(
      {required int id, required int quantity}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final message = await remoteDataSource.updateCartQuantity(
            id: id, quantity: quantity);
        return Right(message);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
