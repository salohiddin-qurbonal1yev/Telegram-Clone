import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest() {
    var dio = Dio(BaseOptions(
      validateStatus: (int? statusCode) {
        if (statusCode != null) {
          if (statusCode >= 100 && statusCode <= 511) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      receiveDataWhenStatusError: true,
    ));

    // TIME OUT CONFIGURATION

    dio.options.connectTimeout = const Duration(seconds: 55);
    dio.options.receiveTimeout = const Duration(seconds: 55);
    dio.options.sendTimeout = const Duration(seconds: 55);
    return dio;
  }
}
