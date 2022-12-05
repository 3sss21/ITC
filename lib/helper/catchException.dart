import 'package:dio/dio.dart';

class CatchException {
  String? message;
  CatchException({this.message});
  static CatchException convertException(dynamic error) {
    if (error is DioError && error.error is CatchException) {
      return error.error;
    }
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout) {
        return CatchException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        return CatchException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        return CatchException(message: 'Нет интернет соеденения');
      } else if (error.response!.statusCode == 409) {
        // return CatchException(message: error.response!.data["message"]);
        return CatchException(
            message: 'Пользователь с таким email уже существует');
      } else if (error.response!.statusCode == 401) {
        return CatchException(message: error.response!.data["message"]);
      } else {
        return CatchException(message: 'Произошла системаная ошибка');
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: 'Произошла системаная ошибка');
    }
  }

  @override
  String toString() {
    return 'message: $message';
  }
}
