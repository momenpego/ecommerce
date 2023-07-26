import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/Category/data/models/all_category_model.dart';
import 'package:ecommerce_app/features/Category/data/models/category_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Home/data/models/favorite_model.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryModel> getAllCategory();
  Future<CategoryItemsModel> getCategoryItems({required int id});
  Future<String> addOrDeleteItemFavorite({required int id});
}

class CategoryRemoteDataSourceImp implements CategoryRemoteDataSource {
  SharedPreferences sharedPreferences;
  CategoryRemoteDataSourceImp({required this.sharedPreferences});

  @override
  Future<String> addOrDeleteItemFavorite({required int id}) async {
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
  Future<CategoryModel> getAllCategory() async {
    final Map<String, dynamic> headers = {'lang': 'en'};
    final Response response =
        await Diorequest.getdata(url: 'categories', headers: headers);
    if (response.statusCode == 200) {
      final CategoryModel data = CategoryModel.fromJson(response.data);
      return data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoryItemsModel> getCategoryItems({required int id}) async {
     final Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': sharedPreferences.getString('TOKEN')
    };
    final Response response = await Diorequest.getdata(url: 'categories/$id',headers: headers);
    if (response.statusCode == 200) {
      final CategoryItemsModel data =
          CategoryItemsModel.fromJson(response.data);
      return data;
    } else {
      throw ServerException();
    }
  }
}
