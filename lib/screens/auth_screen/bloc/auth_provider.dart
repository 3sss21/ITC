import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class SignUpProvider {
  Future createUser({
    required String email,
    required String phoneNumber,
    required String password,
    required String repeatPassword,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('user/register', body: {
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "repeatPassword": repeatPassword
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('err ============ $e');
      throw CatchException.convertException(e);
    }
  }

   Future LogIn({
    required String phoneNumber,
    required String userpassword,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('user/auth', body: {
        "password": userpassword,
        "phoneNumber": phoneNumber,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.data.toString());
          var box =  Hive.box('tokenBox');
           box.put('token', "Token ${response.data['auth_token']}",);
        //  Constatns.token = response.data['auth_token'];
      
        // print( 'Constatns.token === ${ Constatns.token}');
      } else {
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

}