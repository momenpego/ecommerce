import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignUp/domain/entities/sign_up_entitie.dart';
import 'package:ecommerce_app/features/SignUp/domain/repositories/sign_up_rep.dart';

class SignUpUseCase {
  SignUpRepositorie repositorie;
  SignUpUseCase({required this.repositorie});
  Future<Either<Failure, SignUpEntitie>> call(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    return await repositorie.signUp(
        name: name, email: email, phone: phone, password: password);
  }
}
