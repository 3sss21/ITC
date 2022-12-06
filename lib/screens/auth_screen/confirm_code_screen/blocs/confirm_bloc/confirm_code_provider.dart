import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/confirm_response_model.dart';
import 'package:dio/dio.dart';

class ConfirmProvider {
  Future<ConfirmResponseModel> getConfirm({
    required String code,
    required String email,
  }) async {
    try {
      log('email =============== $email');
      log('code ============ $code');
      ApiRequester requester = ApiRequester();
      Response response = await requester
          .toPost('/register/confirm_code/', isToken: false, body: {
        'code': code,
        'email': email,
      });
      log("Response Confirm ========== ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        ConfirmResponseModel responseModel =
            ConfirmResponseModel.fromJson(response.data);

        return responseModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
