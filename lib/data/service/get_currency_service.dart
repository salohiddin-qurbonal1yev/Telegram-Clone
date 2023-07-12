// import 'package:dio/dio.dart';
// import 'package:unired_telegram/core/config/dio_catch_error_config.dart';
// import 'package:unired_telegram/core/config/dio_config.dart';
// import 'package:unired_telegram/core/constant/project_url.dart';
// import 'package:unired_telegram/data/model/currency_model.dart';

// class CurrencyService {
//   Future<dynamic> getCurrencyService() async {
//     try {
//       Response response =
//           await DioConfig.createRequest().get(TelegramUrls.currencyAPI);
//       if (response.statusCode == 200) {
//         return (response.data as List)
//             .map((e) => CurrencyModel.fromJson(e))
//             .toList();
//       } else {
//         return response.statusMessage.toString();
//       }
//     } on DioException catch (e) {
//       return DioCatchErrorConfig.catchError(e);
//     }
//   }
// }
