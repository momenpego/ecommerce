import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignIn/data/models/login_model.dart';

abstract class LogInRemoteDataSource {
  Future<LogInModel> logIn({required String email, required String password});
}

class LogInRemoteDataSourceImp implements LogInRemoteDataSource {
  @override
  Future<LogInModel> logIn({required String email, required String password}) async {
    final Response respone = await Diorequest.postdata(
        url: 'login', querypram: {"email": email, "password": password});
    if (respone.statusCode == 200) {
      final data = LogInModel.fromJson(respone.data);
      return data;
    } else {
      throw ServerFailure();
    }
  }
}
