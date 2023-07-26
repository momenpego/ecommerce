import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Http/dio_req.dart';

abstract class ProductRemoteDataSource {
  Future<String> addOrRemoveCart({required int id});
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  SharedPreferences sharedPreferences;
  ProductRemoteDataSourceImp({required this.sharedPreferences});

  @override
  Future<String> addOrRemoveCart({required int id}) async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Map<String, dynamic> pram = {'product_id': id};
    final Response response = await Diorequest.postdata(
        url: 'carts', querypram: pram, headers: headers);
    if (response.statusCode == 200) {
      final String message = response.data['message']??'';
      return message;
    } else {
      throw ServerException();
    }
  }
}
