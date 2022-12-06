import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/user_data_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileProvider {
  Box userData = Hive.box('userDataBox');
  Box userIdBox = Hive.box('userIdBox');
  Future<UserDataModel> getProfile({required int userId}) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toGet('/register/${userIdBox.get('userId')}/');

      if (response.statusCode == 200) {
        log("Pofile Data ==================== ${response.data}");
        UserDataModel userDataModel = UserDataModel.fromJson(response.data);

        await userData.put('email', response.data['email']);
        await userData.put('username', response.data['username']);
        await userData.put('phone', response.data['phone']);
        await userData.put('qrCode', response.data['qr_code']);
        await userData.put('cashbackAll', response.data['cashback_all']);
        await userData.put('isSeller', response.data['is_seller']);
        await userData.put('branchId', response.data['branch_user']);
        return userDataModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
