import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Favorite/domain/entities/favorite_entitie.dart';

abstract class FavoriteRepositorie{

 Future<Either<Failure,FavoriteEntitie>> getAllFavoriteData();

 Future<Either<Failure,String>> deleteItemFromFavorite({required int id});

}