import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:dio/dio.dart';

import '../../../helper/catchException.dart';
import '../../../models/confirm_model.dart';

// class ConfirmProvider {
//   Future<ConfirmModel> getConfirm() async {
//     try {
//       ApiRequester requester = ApiRequester();
//       Response response = await requester.toPost(, body: )
//       if (response.statusCode == 200) {
//         ConfirmModel confrimModel = ConfirmModel.fromJson(response.data);
//         return confrimModel;
//       } else {
//         throw CatchException.convertException(response);
//       }
//     } catch (e) {
//       throw CatchException.convertException(e);
//     }
//   }
// }

class ConfirmProvider {
  Future getConfirm({
    required String code,
    required String email,
  }) async {
    try {
      log('email =============== $email');
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toPost('/register/confirm_code/', body: {
        'code': code,
        'email': email,
      });
      log("Response Confirm ========== ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
