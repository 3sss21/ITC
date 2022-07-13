import 'package:dio/dio.dart';

class CatchException {
  String? message;
  CatchException({this.message});
  static CatchException convertException(dynamic error) {
    if (error is DioError && error.error is CatchException) {
   
      return error.error;
    }
    if (error is DioError) {
      
      @override
      String toString() {
        return 'error: $error';
      }

      print(' qwertyuio ===== $error');
      if (error.type == DioErrorType.connectTimeout) {
        print('CONNECTION_ERROR');
        return CatchException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        print('RECIVE_ERROR');
        return CatchException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        print('NO_INTERNET');
        return CatchException(message: 'Нет интернет соеденения');
      } else if (error.response!.statusCode == 409) {
        print('555555');
        return CatchException(message: error.response!.data["message"]);
      } else if (error.response!.statusCode == 401) {
        print('444444');
        return CatchException(message: error.response!.data["message"]);
      } else {
        print('33333');
        return CatchException(message: 'Произошла системаная ошибка');
      }
    }
    if (error is CatchException) {
      
      return error;
    } else {
    
      return CatchException(message: 'Произошла системаная ошибка');
    }
  }  @override
  String toString() {
    return 'message: $message';
  }
}
