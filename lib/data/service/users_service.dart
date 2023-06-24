import 'package:dio/dio.dart';
import 'package:unired_telegram/core/config/dio_config.dart';
import 'package:unired_telegram/core/constant/project_url.dart';
import 'package:unired_telegram/data/model/users_model.dart';

class UsersService {
  Future<dynamic> getUsers() async {
    try {
      // Response
      Response response = await DioConfig.createRequest()
          .get(ProjectUrl.users); // dio-config // project url api
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UsersModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
