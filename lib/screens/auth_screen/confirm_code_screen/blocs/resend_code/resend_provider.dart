import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/resend_response_model.dart';
import 'package:dio/dio.dart';

class ResendCodeProvider {
  Future<ResendResponseModel> resendCode({
    required String email,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toPost('/register/resend_code/', body: {
        'email': email,
      });
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        ResendResponseModel responseModel =
            ResendResponseModel.fromJson(response.data);

        return responseModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
