import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/features/SignUp/data/datasources/sign_up_remote_data.dart';
import 'package:ecommerce_app/features/SignUp/domain/entities/sign_up_entitie.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/SignUp/domain/repositories/sign_up_rep.dart';

class SignUpRepositorieImp implements SignUpRepositorie {
  NetWorkChecker netWorkChecker;
  SignUpRemoteDataSource signUpRemoteDataSource;
  SignUpRepositorieImp(
      {required this.netWorkChecker, required this.signUpRemoteDataSource});
  @override
  Future<Either<Failure, SignUpEntitie>> signUp(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    if (await netWorkChecker.hasconnected) {
      final data = await signUpRemoteDataSource.signUp(
          name: name, email: email, password: password, phone: phone);
      if (data.status) {
        return Right(data);
      } else {
        return Left(WrongDataFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
