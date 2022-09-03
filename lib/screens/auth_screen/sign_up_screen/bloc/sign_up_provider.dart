import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';

class SignUpProvider{
  Future createUser({
    required String email,
    required String username,
    required String phoneNumber,
    required String password,
    // required String repeatPassword,
  }) async {
    try{
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/register/', body: {
        'email': email,
        'username': username,
        'phone': phoneNumber,
        'password': password,
        // 'password2': repeatPassword,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
      } else {      
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e){
      throw CatchException.convertException(e);
    }
  }
}