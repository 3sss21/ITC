import 'dart:developer';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ApiRequester {
  var tokenBox = Hive.box("tokenbox");
  static String url = 'http://165.22.49.123/api';

  Future<Dio> initDio({bool isToken = false}) async {
    String token = await tokenBox.get("token", defaultValue: '');
    log('Token_apiRequester === $token');
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: isToken ? {"Authorization": 'Token $token'} : null,
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(
    String url, {
    bool? isToken = false,
    Map<String, dynamic>? queryParam,
  }) async {
    Dio dio = await initDio(isToken: isToken ?? false);
    try {
      return dio.get(url, queryParameters: queryParam);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(
    String url, {
    bool? isToken = false,
    Map<String, dynamic>? param,
    required Map<String, dynamic> body,
  }) async {
    Dio dio = await initDio(isToken: isToken!);
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
