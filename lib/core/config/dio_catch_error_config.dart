import 'package:dio/dio.dart';

class DioCatchErrorConfig {
  static String catchError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return 'Connection timed out';
      case DioErrorType.sendTimeout:
        return 'Send timed out';
      case DioErrorType.receiveTimeout:
        return 'Receive timed out';
      case DioErrorType.unknown:
        return 'Unknown error';
      default:
        return 'Something went wrong';
    }
  }
}
