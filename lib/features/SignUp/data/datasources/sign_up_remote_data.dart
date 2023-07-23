import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/SignUp/data/models/signup_model.dart';

abstract class SignUpRemoteDataSource {
  Future<SignUpModel> signUp(
      {required String name,
      required String email,
      required String password,
      required String phone});
}

class SignUpRemoteDataSourceImp implements SignUpRemoteDataSource {
  @override
  Future<SignUpModel> signUp(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    final Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password
    };
    final Response response =
        await Diorequest.postdata(url: 'register', querypram: data);
    if (response.statusCode == 200) {
      final data = SignUpModel.fromJson(response.data);
      return data;
    } else {
      throw ServerException();
    }
  }
}
