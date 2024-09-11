class LoginModel {
  final int id;
  final String email, password;

  const LoginModel({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "password": password,
    };
  }
}
