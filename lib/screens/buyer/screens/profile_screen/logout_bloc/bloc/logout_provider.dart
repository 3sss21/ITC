import 'package:cashback_app/commons/logout_user.dart';
import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/helper/urls.dart';
import 'package:dio/dio.dart';

class LogoutProvider {
  Future<LogoutUser> logoutUser() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost(logoutUserUrl(), body: {});

      if (response.statusCode! == 204) {
        LogoutUser logoutUser = LogoutUser(isLogout: true);
        return logoutUser;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
