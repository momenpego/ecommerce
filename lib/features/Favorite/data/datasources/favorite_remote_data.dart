import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Favorite/data/models/favorite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteRemoteDataSource {
  Future<FavoriteModel> getAllFavoriteData();

  Future<String> deleteItemFromFavorite({required int id});
}

class FavoriteRemoteDataSourceImp implements FavoriteRemoteDataSource {
  SharedPreferences sharedPreferences;
  FavoriteRemoteDataSourceImp({required this.sharedPreferences});
  @override
  Future<String> deleteItemFromFavorite({required int id}) async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Map<String, dynamic> pram = {'product_id': id};
    Response response = await Diorequest.postdata(
        url: 'favorites', headers: headers, querypram: pram);
    if (response.statusCode == 200) {
      FavoriteModel data = FavoriteModel.fromJson(response.data);
      final String message = data.message;
      return message;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FavoriteModel> getAllFavoriteData() async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Response response =
        await Diorequest.getdata(url: 'favorites', headers: headers);
    if (response.statusCode == 200) {
      final data = FavoriteModel.fromJson(response.data);
      return data;
    } else {
      throw ServerException();
    }
  }
}
