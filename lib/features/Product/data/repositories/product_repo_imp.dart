import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/Product/data/datasources/product_remote_data.dart';
import 'package:ecommerce_app/features/Product/domain/repositories/product_repo.dart';

class ProductRepositorieImp implements ProductRepositorie {
  NetWorkChecker netWorkChecker;
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositorieImp(
      {required this.netWorkChecker, required this.productRemoteDataSource});
  @override
  Future<Either<Failure, String>> addOrRemoveCart({required int id}) async {
    if (await netWorkChecker.hasconnected) {
      try {
        final data = await productRemoteDataSource.addOrRemoveCart(id: id);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
