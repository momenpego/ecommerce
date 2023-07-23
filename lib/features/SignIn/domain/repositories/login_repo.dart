import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignIn/domain/entities/login_entitie.dart';

abstract class LogInRepositorie{
  Future<Either<Failure , LogInEntitie>> logInNow({required String email , required String password});
}