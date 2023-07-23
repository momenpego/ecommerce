import 'package:dio/dio.dart';

const String _baseUrl =
    "https://student.valuxapps.com/api/"; //here your base Url of your api

class Diorequest {
  static late Dio dio;
  static Future initdio() async {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  //get data
  static Future<Response> getdata(
      {required String url,
      Map<String, dynamic>? querypram,
      Object? data,
      Map<String, dynamic>? headers}) async {
    late Response myresponse;
    myresponse = await dio.get(url,
        queryParameters: querypram,
        data: data,
        options: Options(headers: headers));
    return myresponse;
  }

  //post data
  static Future<Response> postdata(
      {required String url,
      Map<String, dynamic>? querypram,
      Object? data,
      Map<String, dynamic>? headers}) async {
    late Response myresponse;
    myresponse = await dio.post(url,
        queryParameters: querypram,
        data: data,
        options: Options(headers: headers));
    return myresponse;
  }

  //delete

  static Future<Response> deletdata(
      {required String url,
      Map<String, dynamic>? querypram,
      Object? data,
      Map<String, dynamic>? headers}) async {
    late Response myresponse;
    myresponse = await dio.delete(url,
        queryParameters: querypram,
        data: data,
        options: Options(headers: headers));
    return myresponse;
  }

  //put -- update

  static Future<Response> putdata(
      {required String url,
      Map<String, dynamic>? querypram,
      Object? data,
      Map<String, dynamic>? headers}) async {
    late Response myresponse;
    myresponse = await dio.put(url,
        queryParameters: querypram,
        data: data,
        options: Options(headers: headers));
    return myresponse;
  }

  //patch

  static Future<Response> patchdata(
      {required String url,
      Map<String, dynamic>? pram,
      Object? data,
      Map<String, dynamic>? headers}) async {
    late Response myresponse;
    myresponse = await dio.patch(url,
        queryParameters: pram, data: data, options: Options(headers: headers));
    return myresponse;
  }
}