import 'dart:developer';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ApiRequester {
  var box = Hive.box("tokenbox");
  static String url = 'http://165.22.49.123/api';

  Future<Dio> initDio() async {
    String token = await box.get("token", defaultValue: '');

    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: {
          // "Authorization": "Token 8e0cb2730a4eb0c04d19bc3df76901a0ccaccd46"
          "Autorization": token
          //  Constatns.token == null ? "" : "Token ${Constatns.token}",
        },
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
  }

  Future<Response> toPost(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, queryParameters: param, data: body);
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
