import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignUp/domain/entities/sign_up_entitie.dart';

abstract class SignUpRepositorie {
  Future<Either<Failure, SignUpEntitie>> signUp(
      {required String name,
      required String email,
      required String phone,
      required String password});
}
