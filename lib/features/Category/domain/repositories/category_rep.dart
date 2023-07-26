import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Category/domain/entities/category_entitie.dart';
import 'package:ecommerce_app/features/Category/domain/entities/item_category_entitie.dart';

abstract class CategoryRepositorie {
  Future<Either<Failure, CategoryEtitie>> getAllCategory();
  Future<Either<Failure, CategoryItemEntitie>> getCategoryItems(
      {required int id});
  Future<Either<Failure, String>> addOrDeleteItemFavorite({required int id});
}
