import 'dart:io';

import 'package:dio/dio.dart';
import 'package:twitch_best_practices/speed_code/login/model/login_data_model.dart';

import 'package:twitch_best_practices/speed_code/login/model/login_model.dart';

class LoginService with _NetworkMixin {
  Future<LoginModel?> login(LoginDataModel loginDataModel) async {
    final response = await Dio().post(
      loginUrl,
      data: loginDataModel.toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return LoginModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      return throw Exception();
    }
  }
}

mixin _NetworkMixin {
  String get loginUrl => 'https://reqres.in/api/login';
}
