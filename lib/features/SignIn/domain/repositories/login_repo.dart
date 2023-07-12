import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';

abstract class LogInRepositorie{
  Future<Either<Failure , Unit>> logInNow({required String email , required String password});
}