import 'dart:io';

import 'package:dio/dio.dart';

import '../model/user_request_model.dart';
import '../model/user_response_model.dart';

abstract class ILoginService {
  final String path = "api/login";

  final Dio dio;

  ILoginService(this.dio);
  Future<UserResponseModel?> fetchLogin(UserRequestModel model);
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final response = await dio.post(path, data: model);
    if (response.statusCode == HttpStatus.ok) {
      return UserResponseModel.fromJson(response.data);
    }
    return null;
  }
}
