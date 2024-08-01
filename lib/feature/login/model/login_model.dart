final class LoginModel {
  LoginModel({
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'] as String?,
    );
  }

  final String? token;
}
