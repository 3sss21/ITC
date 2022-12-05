import 'dart:developer';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ApiRequester {
  var box = Hive.box("tokenbox");
  static String url = 'http://165.22.49.123/api';

  Future<Dio> initDio() async {
    String token = await box.get("token", defaultValue: '');
    log('Token_apiRequester === ${box.get('token')}');
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: {"Authorization": 'Token $token'},
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? queryParam}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: queryParam);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, queryParameters: param, data: body);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPatch(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.patch(url, queryParameters: param, data: body);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
