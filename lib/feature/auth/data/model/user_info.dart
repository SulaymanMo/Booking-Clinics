class UserInfo {
  final int id, gender;
  final String nickName, email, phone, profileImg, birthDate;

  const UserInfo({
    required this.id,
    required this.gender,
    required this.nickName,
    required this.email,
    required this.phone,
    required this.profileImg,
    required this.birthDate,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json["id"],
      gender: json["gender"],
      nickName: json["nick_name"],
      email: json["email"],
      phone: json["phone"],
      profileImg: json["profile_image"],
      birthDate: json["birth_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "gender": gender,
      "nickName": nickName,
      "email": email,
      "phone": phone,
      "profile_image": profileImg,
      "birth_date": birthDate,
    };
  }
}
