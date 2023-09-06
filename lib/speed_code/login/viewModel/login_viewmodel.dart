import 'dart:developer';

import 'package:twitch_best_practices/core/base/viewModel/i_base_viewmodel.dart';
import 'package:twitch_best_practices/speed_code/login/model/login_data_model.dart';
import 'package:twitch_best_practices/speed_code/login/service/login_service.dart';

class LoginViewModel extends IBaseViewModel with _LoginViewModelMixin {
  final LoginService _loginService = LoginService();

  @override
  Future<void> init() async {}

  @override
  void reset() {}

  Future<void> login() async {
    if (!validate) return;
    final response = await _loginService.login(
      LoginDataModel(email: _email, password: _password),
    );
    if (response?.token != null) {
      /// Cache and navigate by _LoginMixin
      log(response!.token!);
    }
  }
}

mixin _LoginViewModelMixin {
  String? _email;
  String? _password;

  changeEmail(String? email) {
    _email = email;
  }

  changePassword(String? password) {
    _password = password;
  }

  bool get validate => _email != null && _password != null;
}
