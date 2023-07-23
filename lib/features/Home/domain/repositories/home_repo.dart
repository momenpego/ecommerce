import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Home/domain/entities/home_entitie.dart';

abstract class HomeRepositorie {
  Future<Either<Failure, HomeEntitie>> getHomeData();
  Future<Either<Failure, String>> addOrDeleteFavorite({required int id});
  Future<Either<Failure, String>> addOrDeleteCart({required int id});
}
