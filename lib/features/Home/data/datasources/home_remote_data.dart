import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Home/data/models/cart_model.dart';
import 'package:ecommerce_app/features/Home/data/models/favorite_model.dart';
import 'package:ecommerce_app/features/Home/data/models/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<String> addOrDeleteFavorite({required int id});
  Future<String> addOrDeleteCart({required int id});
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  SharedPreferences sharedPreferences;
  HomeRemoteDataSourceImp({required this.sharedPreferences});

  @override
  Future<HomeModel> getHomeData() async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    Response response = await Diorequest.getdata(url: 'home', headers: headers);
    HomeModel data = HomeModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> addOrDeleteCart({required int id}) async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Map<String, dynamic> pram = {'product_id': id};
    Response response = await Diorequest.postdata(
        url: 'carts', headers: headers, querypram: pram);
    if (response.statusCode == 200) {
      CartModel data = CartModel.fromJson(response.data);
      final String message = data.message;
      return message;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> addOrDeleteFavorite({required int id}) async {
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
}
