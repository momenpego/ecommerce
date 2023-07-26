import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Cart/data/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getAllCartData();
  Future<String> deleteItemCart({required int id});
  Future<String> updateCartQuantity({required int id, required int quantity});
}

class CartRemoteDataSourceImp implements CartRemoteDataSource {
  SharedPreferences sharedPreferences;
  CartRemoteDataSourceImp({required this.sharedPreferences});
  @override
  Future<CartModel> getAllCartData() async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Response response =
        await Diorequest.getdata(url: 'carts', headers: headers);
    if (response.statusCode == 200) {
      final data = CartModel.fromJson(response.data);
      return data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> deleteItemCart({required int id}) async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Response response =
        await Diorequest.deletdata(url: 'carts/$id', headers: headers);
    if (response.statusCode == 200) {
      final String message = response.data['message'];
      return message;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> updateCartQuantity(
      {required int id, required int quantity}) async {
    final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Response response = await Diorequest.putdata(
        url: 'carts/$id', headers: headers, querypram: {'quantity': quantity});
    if (response.statusCode == 200) {
      final String message = response.data['message'];
      return message;
    } else {
      throw ServerException();
    }
  }
}
