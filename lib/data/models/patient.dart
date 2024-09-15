// temporary Patient model
class Patient {
  final String uid, name, email, phone, birthDate, profileImg;

  const Patient({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.profileImg,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      birthDate: json["birth_date"],
      profileImg: json["profile_image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phone": phone,
      "birth_date": birthDate,
      "profile_image": profileImg,
    };
  }
}