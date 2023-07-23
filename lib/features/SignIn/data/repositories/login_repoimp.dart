import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/SignIn/data/datasources/localdata_source.dart';
import 'package:ecommerce_app/features/SignIn/data/models/login_model.dart';

import '../../domain/repositories/login_repo.dart';

class LogInRepositorieImp implements LogInRepositorie {
  LogInRemoteDataSource logInRemoteDataSource;
  NetWorkChecker netWorkChecker;
  LogInRepositorieImp(
      {required this.logInRemoteDataSource, required this.netWorkChecker});
  @override
  Future<Either<Failure, LogInModel>> logInNow(
      {required String email, required String password}) async {
    if (await netWorkChecker.hasconnected) {
      final data =
          await logInRemoteDataSource.logIn(email: email, password: password);
      if (data.status == true) {
       return Right(data);
      } else {
        return Left(WrongDataFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
