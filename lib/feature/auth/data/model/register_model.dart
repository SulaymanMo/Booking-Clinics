class RegisterModel {
  final int id;
  final String name, email, phone;

  const RegisterModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
