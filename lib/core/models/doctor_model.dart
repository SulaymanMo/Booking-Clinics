final class DoctorModel {
  final String id, name;
  final Map<String, dynamic> location;

  const DoctorModel({
    required this.id,
    required this.name,
    required this.location,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json["id"],
      name: json["name"],
      location: json["location"],
    );
  }
}
