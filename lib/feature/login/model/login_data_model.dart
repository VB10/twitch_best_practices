final class LoginDataModel {
  LoginDataModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  // JSON SERIALIZABLE
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
