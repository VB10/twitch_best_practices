import 'dart:io';

import 'package:dio/dio.dart';
import 'package:twitch_best_practices/feature/login/model/login_data_model.dart';

import 'package:twitch_best_practices/feature/login/model/login_model.dart';

class LoginService with _NetworkMixin {
  LoginService({required this.dio});

  final Dio dio;

  Future<(LoginModel?, CustomError?)> login(
    LoginDataModel loginDataModel,
  ) async {
    final response = await dio.post<dynamic>(
      _NetworkMixin.loginUrl,
      data: loginDataModel.toJson(),
    );

    if (response.statusCode != HttpStatus.ok) return (null, CustomError.server);
    final data = response.data;
    if (data is Map<String, dynamic>) return (LoginModel.fromJson(data), null);

    return (null, CustomError.unknown);
  }
}

mixin _NetworkMixin {
  static const String loginUrl = 'https://reqres.in/api/login';
}

enum CustomError {
  network,
  server,
  unknown;

  String get message {
    switch (this) {
      case CustomError.network:
        return 'Network Error';
      case CustomError.server:
        return 'Server Error';
      case CustomError.unknown:
        return 'Unknown Error';
    }
  }
}
