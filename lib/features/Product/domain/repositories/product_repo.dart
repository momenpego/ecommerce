import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';

abstract class ProductRepositorie{
  Future<Either<Failure,String>> addOrRemoveCart({required int id});
}