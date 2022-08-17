import 'dart:developer';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';
class ApiRequester {
  static String url = 'http://165.22.49.123/api/v1/list';
  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        headers: {'Authorization' : 'Token 8e0cb2730a4eb0c04d19bc3df76901a0ccaccd46'},
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        connectTimeout: 30000,
      ),
    );
  }
  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: {}
          // data: jsonEncode(params),
          );
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }}