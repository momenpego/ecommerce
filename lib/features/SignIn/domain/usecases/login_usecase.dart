import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignIn/domain/entities/login_entitie.dart';
import 'package:ecommerce_app/features/SignIn/domain/repositories/login_repo.dart';

class LogInUseCase {
  LogInRepositorie repositorie;
  LogInUseCase({required this.repositorie});

  Future<Either<Failure, LogInEntitie>> call(
      {required String email, required String password}) async {
    return await repositorie.logInNow(email: email, password: password);
  }
}
