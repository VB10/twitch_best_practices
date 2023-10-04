import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:twitch_best_practices/core/base/viewModel/i_base_viewmodel.dart';
import 'package:twitch_best_practices/feature/login/model/login_data_model.dart';
import 'package:twitch_best_practices/feature/login/service/login_service.dart';

final class LoginViewModel extends IBaseViewModel with _LoginViewModelMixin {
  final LoginService _loginService = LoginService(
    dio: Dio(),
  );

  @override
  Future<void> init() async {}

  @override
  void reset() {}

  Future<void> login() async {
    if (!validate) return;
    final (response, status) = await _loginService.login(
      LoginDataModel(email: _email, password: _password),
    );

    if (status != null) {
      if (kDebugMode) print(status.message);
      return;
    }

    if (response == null) return;
    if (response.token?.isEmpty ?? true) return;
  }
}

mixin _LoginViewModelMixin {
  String _email = '';
  String _password = '';

  void changeEmail(String email) {
    _email = email;
  }

  void changePassword(String password) {
    _password = password;
  }

  bool get validate => _password.isNotEmpty && _email.isNotEmpty;
}
